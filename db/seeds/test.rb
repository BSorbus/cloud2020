puts " "
puts "#####  RUN - init.rb  #####"


def build_test_groups
  1000.times do |i|
    group = Group.find_or_create_by!(name: "GR#{i}") do |row|
      row.note = "note to group GR #{i}"
      row.author_id = 1
      row.save!
    end
  end 
end

def build_test_users
  1000.times do |i|
    user = User.find_or_create_by!(email: "user#{i}@test.com") do |row|
      row.note = "note to user u#{i}"
      row.author_id = 1
      row.save!
    end
  end 
end

def build_test_members
  min_user_id = User.minimum(:id)
  max_user_id = User.maximum(:id)

  min_group_id = Group.minimum(:id)
  max_group_id = Group.maximum(:id)

  3000.times do |i|
    rand_user = User.find_by(id: rand(min_user_id..max_user_id) )
    rand_group = Group.find_by(id: rand(min_group_id..max_group_id) )
    if rand_user.present? && rand_group.present?
      Member.create(group: rand_group, user: rand_user, author_id: 1) unless Member.find_by(group: rand_group, user: rand_user) 
    end
  end
end

def build_test_archives
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
build_test_groups
puts '...groups created'

puts 'create users...'
build_test_users
puts '...users created'

puts 'create members...'
build_test_members
puts '...members created'

puts 'create archives...'
build_test_archives
puts '...archives created'



puts "#####  END OF - init.rb  #####"
puts " "
