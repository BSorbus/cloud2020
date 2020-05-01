class CreateRoleService

  #works
  def work_observer(creator_id=nil)
    role = Role.find_or_create_by!(name: "Obserwator Działań") do |role|
      role.activities += %w(all:work role:work user:work group:work)
      role.note = "<div>Rola służy do obserwowania historii wpisów, działań.<br>(Przypisz tylko Administratorom systemu)</div>"
      role.author_id = creator_id
      role.save!
    end
  end

  # roles
  def role_admin(creator_id=nil)
    role = Role.find_or_create_by!(name: "Administrator Ról Systemowych") do |role|
      role.activities += %w(role:index role:show role:create role:update role:delete role:work)
      role.note = "<div>Rola służy do tworzenia, modyfikowania Ról.<br>(Przypisz tylko zaawansowanym Administratorom systemu)</div>"
      role.author_id = creator_id
      role.save!
    end
  end 

  # users
  def user_admin(creator_id=nil)
    role = Role.find_or_create_by!(name: "Administrator Użytkowników") do |role|
      role.activities += %w(user:index user:show user:create user:update user:delete role:add_remove_role_user user:work)
      role.note = "<div>Rola służy do zarządzania Użytkownikami i przypisywania im Ról Systemowych.<br>(Przypisz tylko zaawansowanym Administratorom systemu)</div>"
      role.author_id = creator_id
      role.save!
    end
  end

  # groups
  def group_admin(creator_id=nil)
    role = Role.find_or_create_by!(name: "Administrator Grup") do |role|
      role.activities += %w(group:index group:show group:create group:update group:delete group:work group:add_remove_group_user)
      role.note = "<div>Rola służy do tworzenia, modyfikowania i usuwania Grup.<br>(Przypisz tylko zaawansowanym Administratorom systemu)</div>"
      role.author_id = creator_id
      role.save!
    end
  end 

end
