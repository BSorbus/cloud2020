puts " "
puts "#####  RUN - init.rb  #####"


load 'db/seeds/files/000_dict.rb'
load 'db/seeds/files/010_role.rb'
#load 'db/seeds/files/020_group.rb'
#load 'db/seeds/files/030_user.rb'
Dir[File.join(Rails.root, 'db', 'seeds/files', '*groups.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds/files', '*users.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds/files', '*project_members.rb')].sort.each { |seed| load seed }
#Dir[File.join(Rails.root, 'db', 'seeds/files', '*project_archivizations.rb')].sort.each { |seed| load seed }

#load 'db/seeds/files/021_dictionary.rb'
#load 'db/seeds/files/031_customer.rb'
#load 'db/seeds/files/041_project.rb'


puts "#####  END OF - init.rb  #####"
puts " "
