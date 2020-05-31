puts " "
puts "#####  RUN - init2.rb  #####"


Dir[File.join(Rails.root, 'db', 'seeds/files', '*projects_archivizations.rb')].sort.each { |seed| load seed }


puts "#####  END OF - init2.rb  #####"
puts " "
