class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :void, :destroy]
  before_action :set_employee, only: [:new, :create]

  # GET /transactions
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new(
      created_by: 'Admin name'
    )
  end

  # GET /transactions/1/edit
  def edit
    @employee = Employee.find(@transaction.employee_id)
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.employee_id = @employee.id
    @transaction.delta = 0

    begin
      @employee.add_transaction @transaction
      flash[:success] = 'Transaction was successfully created.'
      redirect_to @transaction
    rescue => e
      flash[:error] = e.to_s
      render :new
    end
  end

  # GET /transactions/1/void
  def void
    @employee = Employee.find(@transaction.employee_id)

    begin
      @transaction.void_transaction
      @employee.calculate_balance
      flash[:success] = 'Transaction was successfully voided.'
    rescue => e
      flash[:error] = e.to_s
    end
    redirect_to @transaction
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

  def transaction_params
    params.require(:transaction).permit(:created_by, :date, :transaction_type, :description, :employee_id)
  end
end
