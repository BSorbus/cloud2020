class Member < ApplicationRecord

  # relations
  belongs_to :group, touch: true
  belongs_to :user
  belongs_to :author, class_name: "User"

  # validates
  # validates :user_id, presence: true,  
  #                     uniqueness: { scope: [:group_id] }  

  # validates :user, presence: true,  
  #                     uniqueness: { scope: [:group_id], message: " - Użytkownik %{value} %{attribute} %{model} jest już przypisany do tej grupy" }

  # validates :user_id, presence: true,  
  #                     uniqueness: { scope: [:group_id],  
  #                                   message: ->(object, data) do
  #                                     "#{object.user.fullname} jest już przypisany do tej grupy"
  #                                   end } 

  validates :user_id, presence: true,  
                      uniqueness: { scope: [:group_id],  
                                    message: ->(object, data) do
                                      I18n.t("activerecord.errors.messages.user_taken", user_name: "#{object.user.fullname}" )
                                    end } 


  def log_work_for_user(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id

    Work.create!(trackable_type: 'User', trackable_id: self.user.id, action: "#{action}", author_id: worker_id, 
      parameters: self.to_json(only: [:id, :created_at], include: {user: {only: [:id, :user_name, :email]}, 
                                                                   group: {only: [:id, :name]},
                                                                   author: {only: [:id, :user_name, :email]} } ))
  end

  def log_work_for_group(action = '', action_user_id = nil)
    worker_id = action_user_id || self.author_id

    Work.create!(trackable_type: 'Group', trackable_id: self.group.id, action: "#{action}", author_id: worker_id, 
      parameters: self.to_json(only: [:id, :created_at], include: {user: {only: [:id, :user_name, :email]}, 
                                                                   group: {only: [:id, :name]},
                                                                   author: {only: [:id, :user_name, :email]} }))
  end

end
