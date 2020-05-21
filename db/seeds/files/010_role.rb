puts " "
puts "#####  RUN - 010_role.rb  #####"

user = CreateAdminService.new.call(1)
puts 'CREATED ADMIN USER: ' << user.email 
user.log_work('create', 1)

# ----------------------------------------------------------------------------
role = CreateRoleService.new.role_admin(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)
	#user.roles << role 
    approval = Approval.create!(role: role, user: user, author: user)
    approval.log_work_for_user('add_role_to_user', user.id)
    approval.log_work_for_role('add_user_to_role', user.id)
    # role.log_work_approvals('add_user_to_role', user.id)
    # user.log_work_approvals('add_role_to_user', user.id)
puts "ADD ROLE: #{role.name}   TO USER: #{user.email}"


# ----------------------------------------------------------------------------
role = CreateRoleService.new.user_admin(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)
	#user.roles << role 
    approval = Approval.create!(role: role, user: user, author: user)
    approval.log_work_for_user('add_role_to_user', user.id)
    approval.log_work_for_role('add_user_to_role', user.id)
    # role.log_work_approvals('add_user_to_role', user.id)
    # user.log_work_approvals('add_role_to_user', user.id)
puts "ADD ROLE: #{role.name}   TO USER: #{user.email}"

role = CreateRoleService.new.user_writer(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)

role = CreateRoleService.new.user_observer(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)


# ----------------------------------------------------------------------------
role = CreateRoleService.new.work_observer(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)
	#user.roles << role 
    approval = Approval.create!(role: role, user: user, author: user)
    approval.log_work_for_user('add_role_to_user', user.id)
    approval.log_work_for_role('add_user_to_role', user.id)
    # role.log_work_approvals('add_user_to_role', user.id)
    # user.log_work_approvals('add_role_to_user', user.id)
puts "ADD ROLE: #{role.name}   TO USER: #{user.email}"

# ----------------------------------------------------------------------------
role = CreateRoleService.new.group_admin(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)
	#user.roles << role 
    approval = Approval.create!(role: role, user: user, author: user)
    approval.log_work_for_user('add_role_to_user', user.id)
    approval.log_work_for_role('add_user_to_role', user.id)
    # role.log_work_approvals('add_user_to_role', user.id)
    # user.log_work_approvals('add_role_to_user', user.id)
puts "ADD ROLE: #{role.name}   TO USER: #{user.email}"

role = CreateRoleService.new.group_writer(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)

role = CreateRoleService.new.group_observer(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)


# ----------------------------------------------------------------------------
role = CreateRoleService.new.archive_admin(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)
	#user.roles << role 
    approval = Approval.create!(role: role, user: user, author: user)
    approval.log_work_for_user('add_role_to_user', user.id)
    approval.log_work_for_role('add_user_to_role', user.id)
    # role.log_work_approvals('add_user_to_role', user.id)
    # user.log_work_approvals('add_role_to_user', user.id)
puts "ADD ROLE: #{role.name}   TO USER: #{user.email}"

role = CreateRoleService.new.archive_writer(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)

role = CreateRoleService.new.archive_observer(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)


puts "#####  END OF - 010_role.rb  #####"
puts " "
