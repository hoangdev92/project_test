class GroupsController < ApplicationController
  before_action :set_department, only: %i[new create]
  def index
  end

  def new
    @group = Group.new
    @group = @department.groups.new if @department.present?
    authorize @group
    @departments = current_company.departments.pluck(:name, :id)
    @learders = User.all.pluck(:email, :id) if current_user.admin?
    @learders = @department.users.pluck(:email, :id) if @department.present? && @department.manage?(current_user.id)
  end

  def create
    if @department.present?
      @group = @department.groups.new(params_group)
      link_to = groups_department_path(@department.id)
    else
      @group = Group.new(params_group)
      link_to = groups_path
    end
    authorize @group
    return redirect_to link_to, flash: { success: 'thanh cong' } if @group.save

    flash[:errors] = 'co loi'
    render :new
  end

  private

  def params_group
    params.require(:group).permit(:name, :department_id, :learder)
  end

  def set_department
    @department = current_company.departments.find_by(id: params[:department_id])
  end
end
