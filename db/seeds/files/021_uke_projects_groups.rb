puts " "
puts "#####  RUN - 021_uke_projects_groups.rb  #####"

def build_uke_projects_groups
  @pgroup_project_govtech = Group.find_or_create_by!(name: "Projekt GOVTECH") do |row|
    row.note = "Członkowie zespołu biorący udział w projekcie GovTech"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end
  @pgroup_project_pit = Group.find_or_create_by!(name: "Projekt PIT") do |row|
    row.note = "Członkowie zespołu biorący udział w projekcie PIT"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end
end


build_uke_projects_groups

puts "#####  END OF - 021_uke_projects_groups.rb  #####"
puts " "
