puts " "
puts "#####  RUN - init2.rb  #####"






def build_uke_members
  min_user_id = User.minimum(:id)
  max_user_id = User.maximum(:id)

  min_group_id = Group.minimum(:id)
  max_group_id = Group.maximum(:id)

end

def build_uke_archives
  min_group_id = Group.minimum(:id)
  max_group_id = Group.maximum(:id)

  archivization_type = ArchivizationType.find_by!(name: "Zarządzanie Składnicą: [Odczyt]")

  100.times do |i|
    rand_group = Group.find_by(id: rand(min_group_id..max_group_id) )

    archive = Archive.find_or_create_by!(name: "SK#{i}") do |row|
      row.note = "note for archive SK#{i}"
      row.author_id = 1
      row.archivizations.build(group: rand_group, archivization_type: archivization_type)
      row.save!
    end
  end 
end


puts 'create groups...'
build_uke_groups
puts '...groups created'

puts 'create users...'
build_uke_users
puts '...users created'

puts 'create members...'
build_uke_members
puts '...members created'

puts 'create archives...'
build_uke_archives
puts '...archives created'



puts "#####  END OF - init2.rb  #####"
puts " "
