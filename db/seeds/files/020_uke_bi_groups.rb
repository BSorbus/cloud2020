puts " "
puts "#####  RUN - 020_uke_bi_groups.rb  #####"

def build_uke_bi_groups
  group = Group.find_or_create_by!(name: "UKE-BI") do |row|
    row.note = "Pracownicy BI"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end
    group = Group.find_or_create_by!(name: "UKE-BI Wydział Infrastruktury Technicznej") do |row|
      row.note = "Pracownicy BI - Wydział Infrastruktury Technicznej"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-BI Wydział Utrzymania i Rozwoju Systemów") do |row|
      row.note = "Pracownicy BI - Wydział Utrzymania i Rozwoju Systemów"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-BI Wydział Wsparcia Technicznego") do |row|
      row.note = "Pracownicy BI - Wydział Wsparcia Technicznego"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
end


build_uke_bi_groups

puts "#####  END OF - 020_uke_bi_groups.rb  #####"
puts " "
