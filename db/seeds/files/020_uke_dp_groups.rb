puts " "
puts "#####  RUN - 020_uke_dp_groups.rb  #####"

def build_uke_dp_groups
  @dp = Group.find_or_create_by!(name: "UKE-DP") do |row|
    row.note = "Pracownicy DP"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end
    @dp_1wop = Group.find_or_create_by!(name: "UKE-DP I Wydział Obsługi Prawnej") do |row|
      row.note = "Pracownicy DP - I Wydział Obsługi Prawnej"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
    @dp_2wop = Group.find_or_create_by!(name: "UKE-DP II Wydział Obsługi Prawnej") do |row|
      row.note = "Pracownicy DP - II Wydział Obsługi Prawnej"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
    @dp_1wlpu = Group.find_or_create_by!(name: "UKE-DP Wydział Legislacji i Prawa Unijnego") do |row|
      row.note = "Pracownicy DP - Wydział Legislacji i Prawa Unijnego"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
    @dp_wops = Group.find_or_create_by!(name: "UKE-DP Wydział Obsługi Postępowań Sądowych") do |row|
      row.note = "Pracownicy DP - Wydział Obsługi Postępowań Sądowych"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
end


build_uke_dp_groups

puts "#####  END OF - 020_uke_dp_groups.rb  #####"
puts " "
