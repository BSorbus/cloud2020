puts " "
puts "#####  RUN - 030_bi_users.rb  #####"

@first_user = User.order(:created_at).first

def build_users_uke_bi_wit
  user = User.find_or_create_by!(email: "slawomir.biegaj@uke.gov.pl") do |row|
    row.note = "<div>Naczelnik WIT</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wit_array << row.id
  end
  user = User.find_or_create_by!(email: "marcin.dudek@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wit_array << row.id
  end
  user = User.find_or_create_by!(email: "pawel.pieniak@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wit_array << row.id
  end
  user = User.find_or_create_by!(email: "piotr.klaus@uke.gov.pl") do |row|
    row.note = "<div>1/4 etatu</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
  end
end
 
def build_users_uke_bi_wur
  user = User.find_or_create_by!(email: "adam.goss@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wur_array << row.id
  end
  user = User.find_or_create_by!(email: "mariusz.krupa@uke.gov.pl") do |row|
    row.note = "<div>Naczelnik WUR</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wur_array << row.id
  end
  user = User.find_or_create_by!(email: "pawel.mielczarek@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wur_array << row.id
  end
  user = User.find_or_create_by!(email: "katarzyna.pastuszak@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wur_array << row.id
  end
  user = User.find_or_create_by!(email: "tomasz.pochmurski@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wur_array << row.id
  end
end

def build_users_uke_bi_wwt
  user = User.find_or_create_by!(email: "pawel.wodzinski@uke.gov.pl") do |row|
    row.note = "<div>Naczelnik WWT</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wwt_array << row.id
  end
  user = User.find_or_create_by!(email: "marcin.szmit@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wwt_array << row.id
  end
  user = User.find_or_create_by!(email: "marcin.lapuc@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wwt_array << row.id
  end
  user = User.find_or_create_by!(email: "tomasz.janiuk@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
    @uke_bi_wwt_array << row.id
  end
end
 
def build_users_uke_bi_other
  user = User.find_or_create_by!(email: "radoslaw.michalek@uke.gov.pl") do |row|
    row.note = "<div>Dyrektor Biura Informatyki</div>"
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
  end
  user = User.find_or_create_by!(email: "bogdan.jarzab@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = @first_user.id
    row.save!
    row.log_work('create', @first_user.id)
    puts 'CREATED USER: ' << row.email
    @uke_bi_array << row.id
  end
end

def build_users_uke_bi_uke_members
  @uke_bi_array.each do |i|
    Member.create(group: @uke_bi, user_id: i, author_id: @first_user.id) #unless Member.find_by(group: @bi, user_id: i) 
    puts "CREATED MEMBER:   #{@uke_bi.name} + " << User.find(i).email
  end  

  @uke_bi_wit_array.each do |i|
    Member.create(group: @uke_bi_wit, user_id: i, author_id: @first_user.id) #unless Member.find_by(group: @bi_wit, user_id: i) 
    puts "CREATED MEMBER:   #{@uke_bi_wit.name} + " << User.find(i).email
  end  

  @uke_bi_wur_array.each do |i|
    Member.create(group: @uke_bi_wur, user_id: i, author_id: @first_user.id) #unless Member.find_by(group: @bi_wur, user_id: i) 
    puts "CREATED MEMBER:   #{@uke_bi_wur.name} + " << User.find(i).email
  end  

  @uke_bi_wwt_array.each do |i|
    Member.create(group: @uke_bi_wwt, user_id: i, author_id: @first_user.id) #unless Member.find_by(group: @bi_wwt, user_id: i) 
    puts "CREATED MEMBER:   #{@uke_bi_wwt.name} + " << User.find(i).email
  end  

end

def build_users_uke_bi
  build_users_uke_bi_other
  build_users_uke_bi_wit
  build_users_uke_bi_wur
  build_users_uke_bi_wwt
end

def build_users_uke_bi_init
  @uke_bi_array = []
  @uke_bi_wit_array = []
  @uke_bi_wur_array = []
  @uke_bi_wwt_array = []

  @uke_bi = Group.find_by!(name: "UKE-BI") 
  @uke_bi_wit = Group.find_by!(name: "UKE-BI Wydział Infrastruktury Technicznej") 
  @uke_bi_wur = Group.find_by!(name: "UKE-BI Wydział Utrzymania i Rozwoju Systemów") 
  @uke_bi_wwt = Group.find_by!(name: "UKE-BI Wydział Wsparcia Technicznego") 
end


build_users_uke_bi_init
build_users_uke_bi
build_users_uke_bi_uke_members

puts "#####  END OF - 030_bi_users.rb  #####"
puts " "
