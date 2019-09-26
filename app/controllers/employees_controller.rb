class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  def index
    puts
    @employees = Employee.where(nil)
    @employees = @employees.region(params[:region]) if params[:region].present?
    @employees = @employees.location(params[:location]) if params[:location].present?
    @employees = @employees.department(Employee.departments[params[:department]]) if params[:department].present?
    @employees = @employees.last_name(params[:search]) if params[:search].present?
  end

  # GET /employees/1
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      @transaction = Transaction.create_initial_transaction(@employee.balance, @employee.id, 'admin')
      begin
        @employee.add_transaction @transaction
        flash[:success] = 'Employee was successfully created.'
        redirect_to @employee
      rescue => e
        flash[:error] = e.to_s
        render :new
      end
    else
      flash[:success] = 'Employee could not be created.'
      render :new
    end
  end

  # PATCH/PUT /employees/1
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :balance, :start_date, :region, :location, :department)
  end
end
