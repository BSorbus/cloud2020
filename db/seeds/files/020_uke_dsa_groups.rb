puts " "
puts "#####  RUN - 020_uke_dsa_groups.rb  #####"

def build_uke_dsa_groups
  group = Group.find_or_create_by!(name: "UKE-DSA") do |row|
    row.note = "<div>Pracownicy DSA</div>"
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED GROUP: ' << row.name 
  end
    group = Group.find_or_create_by!(name: "UKE-DSA Wydział Geoprzetwarzania Danych") do |row|
      row.note = "<div>Pracownicy DSA - Wydział Geoprzetwarzania Danych</div>"
      row.author_id = 1
      row.save!
      row.log_work('create', 1)
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-DSA Wydział Metod Ilościowych") do |row|
      row.note = "<div>Pracownicy DSA - Wydział Metod Ilościowych</div>"
      row.author_id = 1
      row.save!
      row.log_work('create', 1)
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-DSA Wydział Analiz Telekomunikacyjnych") do |row|
      row.note = "<div>Pracownicy DSA - Wydział Analiz Telekomunikacyjnych</div>"
      row.author_id = 1
      row.save!
      row.log_work('create', 1)
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-DSA Wydział Modelowania Ekonomicznego") do |row|
      row.note = "<div>Pracownicy DSA - Wydział Modelowania Ekonomicznego</div>"
      row.author_id = 1
      row.save!
      row.log_work('create', 1)
      puts 'CREATED GROUP: ' << row.name 
    end
end


build_uke_dsa_groups

puts "#####  END OF - 020_uke_dsa_groups.rb  #####"
puts " "
