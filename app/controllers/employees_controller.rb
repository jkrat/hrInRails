class EmployeesController < ApplicationController
  include PresenterConcern
  before_action :authenticate_user!
  layout 'list_layout'

  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  def index
    @employees = policy_scope(Employee)
    @employees = @employees.region(params[:region]) if params[:region].present?
    @employees = @employees.location(params[:location]) if params[:location].present?
    @employees = @employees.department(Employee.departments[params[:department]]) if params[:department].present?
    @employees = @employees.last_name(params[:search]) if params[:search].present?
    @employees = present(@employees.by_name)
  end

  # GET /employees/1
  def show
    authorize @employee
    @employee = present(@employee)
    render layout: 'main_layout'
  end

  # GET /employees/new
  def new
    unless current_user.allowed?('applicant:invite')
      render :unauthorized && return
    end

    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit; end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    @employee.organization = current_user.organization

    if @employee.invalid?
      render :new
    else
      @employee.add_transaction Transaction.create_initial_transaction(@employee.balance, 'admin')
      @employee.save
      flash[:success] = 'Employee was successfully created.'
      redirect_to @employee
    end
  end

  # PATCH/PUT /employees/1
  def update

    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email,
                                     :balance, :start_date, :region,
                                     :location, :department, :permission_level, :status)
  end
end
