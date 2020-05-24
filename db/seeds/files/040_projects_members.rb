puts " "
puts "#####  RUN - 040_projects_members.rb  #####"

def build_user(user_email)

  user = User.find_or_create_by!(email: user_email) do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    puts 'CREATED USER: ' << row.email
  end
  return user
end

def build_member(user, group)
  Member.create(group: group, user: user, author_id: 1)  
  puts "CREATED MEMBER:   #{group.name} + " << user.email
end


def build_project_pit_user_and_members
  @przepiorka = build_user("jedrzej.przepiorka@snt.pl")
  build_member(@przepiorka, @pgroup_project_pit)

  @fabijanczyk = build_user("mfabijanczyk@evertop.pl")
  build_member(@fabijanczyk, @pgroup_project_pit)

  @krupa = build_user("mariusz.krupa@uke.gov.pl")
  build_member(@krupa, @pgroup_project_pit)

  @jarzab = build_user("bogdan.jarzab@uke.gov.pl")
  build_member(@jarzab, @pgroup_project_pit)

  @goss = build_user("adam.goss@uke.gov.pl")
  build_member(@goss, @pgroup_project_pit)


  @kwaczynski = build_user("marcin.kwaczynski@uke.gov.pl")
  build_member(@kwaczynski, @pgroup_project_pit)

  @antczak = build_user("joanna.antczak@uke.gov.pl")
  build_member(@antczak, @pgroup_project_pit)

end

def build_project_govtech_user_and_members
  @krupa = build_user("mariusz.krupa@uke.gov.pl")
  build_member(@krupa, @pgroup_project_govtech)

  @jarzab = build_user("bogdan.jarzab@uke.gov.pl")
  build_member(@jarzab, @pgroup_project_govtech)

  @goss = build_user("adam.goss@uke.gov.pl")
  build_member(@goss, @pgroup_project_govtech)
end


def build_projects_users
  build_project_pit_user_and_members
  build_project_govtech_user_and_members
end

def build_projects_groups
  @pgroup_project_pit = Group.find_by!(name: "Projekt PIT")
  @pgroup_project_govtech = Group.find_by!(name: "Projekt GOVTECH")
end


build_projects_groups
build_projects_users

puts "#####  END OF - 040_projects_members.rb  #####"
puts " "
