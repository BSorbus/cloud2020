class Approval < ApplicationRecord

  # relations
  belongs_to :role
  belongs_to :user
  belongs_to :author, class_name: "User", optional: true

end
