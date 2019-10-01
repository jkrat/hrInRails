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

  def transaction_params
    params
        .require(:transaction)
        .permit(:created_by, :date, :transaction_type, :description)
        .merge(delta: 0)
  end
end
