puts " "
puts "#####  RUN - 010_role.rb  #####"

user = CreateAdminService.new.call(1)
puts 'CREATED ADMIN USER: ' << user.email 
user.log_work('create', 1)

role = CreateRoleService.new.role_admin(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)
user.roles << role 
puts "ADD ROLE: #{role.name}   TO USER: #{user.email}"


role = CreateRoleService.new.user_admin(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)
user.roles << role 
puts "ADD ROLE: #{role.name}   TO USER: #{user.email}"


role = CreateRoleService.new.work_observer(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)
user.roles << role 
puts "ADD ROLE: #{role.name}   TO USER: #{user.email}"


role = CreateRoleService.new.group_admin(user.id)
puts 'CREATED ROLE: ' << role.name
role.log_work('create', user.id)
user.roles << role 
puts "ADD ROLE: #{role.name}   TO USER: #{user.email}"


puts "#####  END OF - 010_role.rb  #####"
puts " "
