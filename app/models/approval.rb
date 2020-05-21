class Approval < ApplicationRecord

  # relations
  belongs_to :role
  belongs_to :user
  belongs_to :author, class_name: "User"


  def log_work_for_user(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id

    Work.create!(trackable_type: 'User', trackable_id: self.user.id, action: "#{action}", author_id: worker_id, 
      parameters: self.to_json(only: [:id, :created_at], include: {user: {only: [:id, :user_name, :email]}, 
                                                                   role: {only: [:id, :name]},
                                                                   author: {only: [:id, :user_name, :email]} } ))
  end

  def log_work_for_role(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id

    Work.create!(trackable_type: 'Role', trackable_id: self.role.id, action: "#{action}", author_id: worker_id, 
      parameters: self.to_json(only: [:id, :created_at], include: {user: {only: [:id, :user_name, :email]}, 
                                                                   role: {only: [:id, :name]},
                                                                   author: {only: [:id, :user_name, :email]} }))
  end

end
