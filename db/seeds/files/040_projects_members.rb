puts " "
puts "#####  RUN - 040_projects_members.rb  #####"

@first_user = User.order(:created_at).first

def build_user(user_email)
  user = User.find_or_create_by!(email: user_email) do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
  end
  return user
end

def build_member(user, group)
  member = Member.create(group: group, user: user, author_id: @first_user.id)
  member.log_work_for_user('add_group_to_user', @first_user.id)
  member.log_work_for_group('add_user_to_group', @first_user.id)

  puts "CREATED MEMBER:   #{group.name} + " << user.email
end


def build_project_pit_user_and_members
  user = build_user("jedrzej.przepiorka@snt.pl")
  build_member(user, @group_project_pit)

  user = build_user("mfabijanczyk@evertop.pl")
  build_member(user, @group_project_pit)


  user = build_user("radoslaw.michalek@uke.gov.pl")
  build_member(user, @group_project_pit)

  user = build_user("mariusz.krupa@uke.gov.pl")
  build_member(user, @group_project_pit)

  user = build_user("bogdan.jarzab@uke.gov.pl")
  build_member(user, @group_project_pit)

  user = build_user("adam.goss@uke.gov.pl")
  build_member(user, @group_project_pit)

  user = build_user("katarzyna.pastuszak@uke.gov.pl")
  build_member(user, @group_project_pit)


  user = build_user("marcin.kwaczynski@uke.gov.pl")
  build_member(user, @group_project_pit)

  user = build_user("joanna.antczak@uke.gov.pl")
  build_member(user, @group_project_pit)

end

def build_project_govtech_user_and_members
  user = build_user("radoslaw.michalek@uke.gov.pl")
  build_member(user, @group_project_govtech)

  user = build_user("mariusz.krupa@uke.gov.pl")
  build_member(user, @group_project_govtech)

  user = build_user("bogdan.jarzab@uke.gov.pl")
  build_member(user, @group_project_govtech)

  user = build_user("adam.goss@uke.gov.pl")
  build_member(user, @group_project_govtech)

  user = build_user("katarzyna.pastuszak@uke.gov.pl")
  build_member(user, @group_project_govtech)


  user = build_user("slawomir.biegaj@uke.gov.pl")
  build_member(user, @group_project_govtech)

  user = build_user("pawel.pieniak@uke.gov.pl")
  build_member(user, @group_project_govtech)

  user = build_user("marcin.dudek@uke.gov.pl")
  build_member(user, @group_project_govtech)


  user = build_user("julia.wroblewska@inprojects.pl")
  build_member(user, @group_project_govtech)

  user = build_user("milena.kapanajko@inprojects.pl")
  build_member(user, @group_project_govtech)

  user = build_user("marcin.wlodarz@inprojects.pl")
  build_member(user, @group_project_govtech)

  user = build_user("krzysztof.ebert@inprojects.pl")
  build_member(user, @group_project_govtech)

  user = build_user("marcin.wasilewski@inprojects.pl")
  build_member(user, @group_project_govtech)

  user = build_user("michal.krawczak@inprojects.pl")
  build_member(user, @group_project_govtech)

  user = build_user("maciej.olszewski@inprojects.pl")
  build_member(user, @group_project_govtech)

  user = build_user("wojciech.kozicki@inprojects.pl")
  build_member(user, @group_project_govtech)

end


def build_projects_users
  build_project_pit_user_and_members
  build_project_govtech_user_and_members
end

def build_projects_groups
  @group_project_pit = Group.find_by!(name: "Grupa PIT")
  @group_project_govtech = Group.find_by!(name: "Grupa GOVTECH")
end


build_projects_groups
build_projects_users

puts "#####  END OF - 040_projects_members.rb  #####"
puts " "
