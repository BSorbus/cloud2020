puts " "
puts "#####  RUN - 021_uke_projects_groups.rb  #####"

@first_user = User.order(:created_at).first

def build_uke_projects_groups
  @pgroup_project_govtech = Group.find_or_create_by!(name: "Grupa GOVTECH") do |row|
    row.note = "<div>Członkowie zespołu biorący udział w projekcie GovTech</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end
  @pgroup_project_pit = Group.find_or_create_by!(name: "Grupa PIT") do |row|
    row.note = "<div>Członkowie zespołu biorący udział w projekcie PIT</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end
end


build_uke_projects_groups

puts "#####  END OF - 021_uke_projects_groups.rb  #####"
puts " "
