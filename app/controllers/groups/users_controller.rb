class Groups::UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def create
    group = Group.find(params[:group_id])
    user = User.find(params[:id])

    authorize group, :add_remove_group_user? 
    # group.users << user if group.present? && user.present?
    # or
    Member.create!(group: group, user: user, author: current_user)
    group.log_work_members('add_user_to_group', current_user.id)
    user.log_work_members('add_group_to_user', current_user.id)
    head :ok
  end

  def destroy
    group = Group.find(params[:group_id])
    user = User.find(params[:id])

    authorize group, :add_remove_group_user? 
    user.groups.delete(group) if group.present? && user.present?
    group.log_work_members('remove_user_from_group', current_user.id)
    user.log_work_members('remove_group_from_user', current_user.id)
    head :no_content
  end

end
