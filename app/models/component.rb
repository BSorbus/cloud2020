class Component < ApplicationRecord

  def fullname
    # "#{self.attached_file_identifier}"
    "#{self.name}"
  end

end
