class Roles::UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def create
    role = Role.find(params[:role_id])
    user = User.find(params[:id])

    authorize role, :add_remove_role_user? 
    # role.users << user if role.present? && user.present?
    # or
    Approval.create!(role: role, user: user, author: current_user)
    role.log_work_approvals('add_user_to_role', current_user.id)
    user.log_work_approvals('add_role_to_user', current_user.id)
    head :ok
  end

  def destroy
    role = Role.find(params[:role_id])
    user = User.find(params[:id])

    authorize role, :add_remove_role_user? 
    user.roles.delete(role) if role.present? && user.present?
    role.log_work_approvals('remove_user_from_role', current_user.id)
    user.log_work_approvals('remove_role_from_user', current_user.id)
   head :no_content
  end

end
