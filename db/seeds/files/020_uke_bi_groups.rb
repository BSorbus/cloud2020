puts " "
puts "#####  RUN - 020_uke_bi_groups.rb  #####"

@first_user = User.order(:created_at).first

def build_uke_bi_groups
  group = Group.find_or_create_by!(name: "UKE-BI") do |row|
    row.note = "<div>Pracownicy BI</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED GROUP: ' << row.name
  end
    group = Group.find_or_create_by!(name: "UKE-BI Wydział Infrastruktury Technicznej") do |row|
      row.note = "<div>Pracownicy BI - Wydział Infrastruktury Technicznej</div>"
      row.author_id = @first_user.id
      row.save!
      row.log_work('create', @first_user.id)
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-BI Wydział Utrzymania i Rozwoju Systemów") do |row|
      row.note = "<div>Pracownicy BI - Wydział Utrzymania i Rozwoju Systemów</div>"
      row.author_id = @first_user.id
      row.save!
      row.log_work('create', @first_user.id)
      puts 'CREATED GROUP: ' << row.name 
    end
    group = Group.find_or_create_by!(name: "UKE-BI Wydział Wsparcia Technicznego") do |row|
      row.note = "<div>Pracownicy BI - Wydział Wsparcia Technicznego</div>"
      row.author_id = @first_user.id
      row.save!
      row.log_work('create', @first_user.id)
      puts 'CREATED GROUP: ' << row.name 
    end
end


build_uke_bi_groups

puts "#####  END OF - 020_uke_bi_groups.rb  #####"
puts " "
