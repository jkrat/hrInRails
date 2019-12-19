class TransactionsController < ApplicationController
  include PresenterConcern
  layout 'list_layout'

  before_action :set_transaction, only: [:show, :edit, :void, :destroy]
  before_action :set_employee, only: [:new, :create]
  before_action :set_user, only: [:new]

  # GET /transactions
  def index
    @transactions = Transaction.where(nil)
    @transactions = @transactions.includes(:employee).where(employees: { region: params[:region] }) if params[:region].present?
    @transactions = @transactions.includes(:employee).where(employees: { location: params[:location] }) if params[:location].present?
    @transactions = @transactions.includes(:employee).where(employees: { department: Employee.departments[params[:department]] }) if params[:department].present?
    @transactions = @transactions.includes(:employee).where(employees: { last_name: params[:search] }) if params[:search].present?
    @transactions = present(@transactions)
  end

  # GET /transactions/1
  def show
    render layout: 'main_layout'
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new(
      created_by: @user.employee.first_name + ' ' + @user.employee.last_name
    )
  end

  # POST /transactions
  def create
    @employee.add_transaction(transaction_params)

    if @employee.save
      flash[:success] = 'Transaction was successfully created.'
      redirect_to @employee
    else
      @transaction = Transaction.new(transaction_params)
      flash[:error] = 'Transaction leaves employee with negative balance'
      render :new
    end
  end

  # GET /transactions/1/void
  def void
    @employee = Employee.find(@transaction.employee_id)
    original_delta = @transaction.void_transaction
    @employee.calculate_balance

    if @employee.save
      flash[:success] = 'Transaction was successfully voided.'
    else
      @transaction.un_void(original_delta)
      flash[:error] = 'Voiding transaction would leave employee with negative balance'
    end
    redirect_to @employee
  end

  # DELETE /transactions/1
  def destroy
    @employee = Employee.find(@transaction.employee_id)

    @transaction.destroy
    @employee.calculate_balance
    redirect_to transactions_url, notice: 'Transaction was successfully destroyed.'
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def set_user
    @user = User.find_by_email(current_user.email)
  end

  def transaction_params
    params
      .require(:transaction)
      .permit(:created_by, :date, :transaction_type, :description)
      .merge(delta: 0)
  end
end
