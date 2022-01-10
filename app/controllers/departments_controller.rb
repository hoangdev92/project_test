class DepartmentsController < ApplicationController
  before_action :set_department, except: %i[new create]

  def index
    @departments = current_user.departments
    @departments = Department.all if current_user.admin?
  end

  def new
    @department = current_company.departments.build
    authorize @department
    @manages = User.all.pluck(:email, :id)
  end

  def create
    @department = current_company.departments.create(department_params)
    if @department.save
      flash[:success] = 'thanh cong'
      redirect_to departments_path
    else
      flash[:errors] = @department.errors.full_message
      render :new
    end
  end

  def show
    authorize @department
    @groups = @department.groups
  end

  def edit
    authorize @department
  end

  def update
    authorize @department
  end

  def groups
    authorize @department
    @groups = @department.groups
  end

  def destroy
    authorize @department
  end

  private

  def department_params
    params.require(:department).permit(:name, :manage)
  end

  def set_department
    @department = current_company.departments.find_by(id: params[:id])
  end
end
