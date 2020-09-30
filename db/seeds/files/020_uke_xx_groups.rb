puts " "
puts "#####  RUN - 020_group.rb  #####"

@first_user = User.order(:created_at).first

def build_uke_groups
  @dpk = Group.find_or_create_by!(name: "UKE-DPK") do |row|
    row.note = "<div>Pracownicy Departamentu Polityki Konsumenckiej</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    # puts "CREATED GROUP: #{row.name}" 
    puts 'CREATED GROUP: ' << row.name 
  end

  @dr = Group.find_or_create_by!(name: "UKE-DR") do |row|
    row.note = "<div>Pracownicy Departamentu Regulacji</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end

# "UKE-DSA" 020_dsa_group.rb

  @dpr = Group.find_or_create_by!(name: "UKE-DRP") do |row|
    row.note = "<div>Pracownicy Departamentu Rynku Pocztowego</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end

  @dc = Group.find_or_create_by!(name: "UKE-DC") do |row|
    row.note = "<div>Pracownicy Departamentu Częstotliwości</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end

  @dt = Group.find_or_create_by!(name: "UKE-DT") do |row|
    row.note = "<div>Pracownicy Departamentu Techniki</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end

  @dk = Group.find_or_create_by!(name: "UKE-DK") do |row|
    row.note = "<div>Pracownicy Departamentu Kontroli</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end

  @db = Group.find_or_create_by!(name: "UKE-DB") do |row|
    row.note = "<div>Pracownicy Departamentu Bezpieczeństwa</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end

# "UKE-DP" 020_dp_group.rb

  group = Group.find_or_create_by!(name: "UKE-DSZ") do |row|
    row.note = "<div>Pracownicy Departamentu Spraw Zagranicznych</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end

  group = Group.find_or_create_by!(name: "UKE-BA") do |row|
    row.note = "<div>Pracownicy Biura Administracji</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end
  group = Group.find_or_create_by!(name: "UKE-BDG") do |row|
    row.note = "<div>Pracownicy Biura Dyrektora Generalnego</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end

# "UKE-BI" 020_bi_group.rb

  @bf = Group.find_or_create_by!(name: "UKE-BF") do |row|
    row.note = "<div>Pracownicy Biura Finansów</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name 
  end
end


build_uke_groups

puts "#####  END OF - 020_group.rb  #####"
puts " "
