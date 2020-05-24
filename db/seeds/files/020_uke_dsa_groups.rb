puts " "
puts "#####  RUN - 020_uke_dsa_groups.rb  #####"

def build_uke_dsa_groups
  group = Group.find_or_create_by!(name: "UKE-DSA") do |row|
    row.note = "Pracownicy DSA"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end
    group = Group.find_or_create_by!(name: "UKE-DSA Wydział Geoprzetwarzania Danych") do |row|
      row.note = "Pracownicy DSA - Wydział Geoprzetwarzania Danych"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-DSA Wydział Metod Ilościowych") do |row|
      row.note = "Pracownicy DSA - Wydział Metod Ilościowych"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-DSA Wydział Analiz Telekomunikacyjnych") do |row|
      row.note = "Pracownicy DSA - Wydział Analiz Telekomunikacyjnych"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-DSA Wydział Modelowania Ekonomicznego") do |row|
      row.note = "Pracownicy DSA - Wydział Modelowania Ekonomicznego"
      row.author_id = 1
      row.save!
      puts 'CREATED GROUP: ' << row.name 
    end
end


build_uke_dsa_groups

puts "#####  END OF - 020_uke_dsa_groups.rb  #####"
puts " "
