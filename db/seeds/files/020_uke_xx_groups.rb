puts " "
puts "#####  RUN - 020_group.rb  #####"

def build_uke_groups
  @dpk = Group.find_or_create_by!(name: "UKE-DPK") do |row|
    row.note = "Pracownicy Departamentu Polityki Konsumenckiej"
    row.author_id = 1
    row.save!
    # puts "CREATED GROUP: #{row.name}" 
    puts 'CREATED GROUP: ' << row.name 
  end

  @dr = Group.find_or_create_by!(name: "UKE-DR") do |row|
    row.note = "Pracownicy Departamentu Regulacji"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end

# "UKE-DSA" 020_dsa_group.rb

  @dpr = Group.find_or_create_by!(name: "UKE-DRP") do |row|
    row.note = "Pracownicy Departamentu Rynku Pocztowego"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end

  @dc = Group.find_or_create_by!(name: "UKE-DC") do |row|
    row.note = "Pracownicy Departamentu Częstotliwości"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end

  @dt = Group.find_or_create_by!(name: "UKE-DT") do |row|
    row.note = "Pracownicy Departamentu Techniki"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end

  @dk = Group.find_or_create_by!(name: "UKE-DK") do |row|
    row.note = "Pracownicy Departamentu Kontroli"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end

  @db = Group.find_or_create_by!(name: "UKE-DB") do |row|
    row.note = "Pracownicy Departamentu Bezpieczeństwa"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end

# "UKE-DP" 020_dp_group.rb

  group = Group.find_or_create_by!(name: "UKE-DSZ") do |row|
    row.note = "Pracownicy Departamentu Spraw Zagranicznych"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end

  group = Group.find_or_create_by!(name: "UKE-BA") do |row|
    row.note = "Pracownicy Biura Administracji"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end
  group = Group.find_or_create_by!(name: "UKE-BDG") do |row|
    row.note = "Pracownicy Biura Dyrektora Generalnego"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end

# "UKE-BI" 020_bi_group.rb

  @bf = Group.find_or_create_by!(name: "UKE-BF") do |row|
    row.note = "Pracownicy Biura Finansów"
    row.author_id = 1
    row.save!
    puts 'CREATED GROUP: ' << row.name 
  end
end


build_uke_groups

puts "#####  END OF - 020_group.rb  #####"
puts " "
