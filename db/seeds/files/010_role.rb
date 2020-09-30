puts " "
puts "#####  RUN - 010_role.rb  #####"

@first_user = User.order(:created_at).first

# ----------------------------------------------------------------------------
role = CreateRoleService.new.role_admin(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)
#user.roles << role 
unless Approval.where(role: role, user: @first_user).any?
  approval = Approval.create!(role: role, user: @first_user, author: @first_user)
  approval.log_work_for_user('add_role_to_user', @first_user.id)
  approval.log_work_for_role('add_user_to_role', @first_user.id)
  # role.log_work_approvals('add_user_to_role', @first_user.id)
  # user.log_work_approvals('add_role_to_user', @first_user.id)
  puts "ADD ROLE: #{role.name}   TO USER: #{@first_user.email}"
end

# ----------------------------------------------------------------------------
role = CreateRoleService.new.user_admin(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)
#user.roles << role 
unless Approval.where(role: role, user: @first_user).any?
  approval = Approval.create!(role: role, user: @first_user, author: @first_user)
  approval.log_work_for_user('add_role_to_user', @first_user.id)
  approval.log_work_for_role('add_user_to_role', @first_user.id)
  # role.log_work_approvals('add_user_to_role', @first_user.id)
  # user.log_work_approvals('add_role_to_user', @first_user.id)
  puts "ADD ROLE: #{role.name}   TO USER: #{@first_user.email}"
end

role = CreateRoleService.new.user_writer(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)

role = CreateRoleService.new.user_observer(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)


# ----------------------------------------------------------------------------
role = CreateRoleService.new.work_observer(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)
unless Approval.where(role: role, user: @first_user).any?
  approval = Approval.create!(role: role, user: @first_user, author: @first_user)
  approval.log_work_for_user('add_role_to_user', @first_user.id)
  approval.log_work_for_role('add_user_to_role', @first_user.id)
  # role.log_work_approvals('add_user_to_role', @first_user.id)
  # user.log_work_approvals('add_role_to_user', @first_user.id)
  puts "ADD ROLE: #{role.name}   TO USER: #{@first_user.email}"
end

# ----------------------------------------------------------------------------
role = CreateRoleService.new.group_admin(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)
unless Approval.where(role: role, user: @first_user).any?
  approval = Approval.create!(role: role, user: @first_user, author: @first_user)
  approval.log_work_for_user('add_role_to_user', @first_user.id)
  approval.log_work_for_role('add_user_to_role', @first_user.id)
  # role.log_work_approvals('add_user_to_role', @first_user.id)
  # user.log_work_approvals('add_role_to_user', @first_user.id)
  puts "ADD ROLE: #{role.name}   TO USER: #{@first_user.email}"
end

role = CreateRoleService.new.group_writer(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)

role = CreateRoleService.new.group_observer(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)


# ----------------------------------------------------------------------------
role = CreateRoleService.new.archive_admin(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)
unless Approval.where(role: role, user: @first_user).any?
  approval = Approval.create!(role: role, user: @first_user, author: @first_user)
  approval.log_work_for_user('add_role_to_user', @first_user.id)
  approval.log_work_for_role('add_user_to_role', @first_user.id)
  # role.log_work_approvals('add_user_to_role', @first_user.id)
  # user.log_work_approvals('add_role_to_user', @first_user.id)
  puts "ADD ROLE: #{role.name}   TO USER: #{@first_user.email}"
end

role = CreateRoleService.new.archive_writer(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)

role = CreateRoleService.new.archive_observer(@first_user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', @first_user.id)


puts "#####  END OF - 010_role.rb  #####"
puts " "
