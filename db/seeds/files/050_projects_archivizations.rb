puts " "
puts "#####  RUN - 050_projects_archivizations.rb  #####"

@first_user = User.order(:created_at).first

def build_archive(archive_name, archive_note, group)
  archive = Archive.find_or_create_by!(name: "#{archive_name}") do |row|
    row.note = "<div>#{archive_note}</div>"
    row.expiry_on = Time.zone.today + 2.years
    row.archivizations.build(group: group, archivization_type: @archivization_type)
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED ARCHIVE: ' << row.name
  end
end


def build_projects_archives
  build_archive("Składnica Projektu PIT2", "Miejsce wymiany plików pomiędzy członkami Grupy PIT2", @group_project_pit)
  build_archive("Składnica Projektu GovTech", "Miejsce wymiany plików pomiędzy członkami Grupy GOVTECH", @group_project_govtech)
end

def set_archivization_type
  @archivization_type = ArchivizationType.find_by!(name: "Składnica: [Odczyt]")
end

def set_projects_groups
  @group_project_pit = Group.find_by!(name: "Grupa PIT")
  @group_project_govtech = Group.find_by!(name: "Grupa GOVTECH")
end


set_archivization_type
set_projects_groups
build_projects_archives

puts "#####  END OF - 050_projects_archivizations.rb  #####"
puts " "
