class Member < ApplicationRecord

  # relations
  belongs_to :group
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

end
