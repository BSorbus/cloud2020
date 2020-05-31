puts " "
puts "#####  RUN - 030_bi_users.rb  #####"


def build_users_uke_dsa_wgd
  user = User.find_or_create_by!(email: "joanna.antczak@uke.gov.pl") do |row|
    row.note = "<div>Naczelnik DSA-WGD</div>"
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "anna.zawadzka@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "anna.podpora@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "marek.orciuch@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "paulina.olszewska@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "pawel.milewski@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "marcin.kwaczynski@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "konrad.krzeminski@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "mateusz.gladki@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "ewelina.fornalczyk@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
  user = User.find_or_create_by!(email: "beata.czajka@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wgd_array << row.id
  end
end

def build_users_uke_dsa_wmi
  user = User.find_or_create_by!(email: "marcin.blasiak@uke.gov.pl") do |row|
    row.note = "<div>Naczelnik DSA-WMI</div>"
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wmi_array << row.id
  end
  user = User.find_or_create_by!(email: "grzegorz.wrobel@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wmi_array << row.id
  end
  user = User.find_or_create_by!(email: "maciej.roman@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wmi_array << row.id
  end
  user = User.find_or_create_by!(email: "malgorzata.reilly@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wmi_array << row.id
  end
  user = User.find_or_create_by!(email: "iwona.mazur-zmuda@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wmi_array << row.id
  end
  user = User.find_or_create_by!(email: "tomasz.krasnowski@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wmi_array << row.id
  end
end
 
def build_users_uke_dsa_wat
  user = User.find_or_create_by!(email: "dorota.oniszczuk@uke.gov.pl") do |row|
    row.note = "<div>Naczelnik DSA-WAT</div>"
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wat_array << row.id
  end
  user = User.find_or_create_by!(email: "dorota.wilkowska@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wat_array << row.id
  end
  user = User.find_or_create_by!(email: "hubert.szymczyk@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wat_array << row.id
  end
  user = User.find_or_create_by!(email: "elzbieta.okninska@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wat_array << row.id
  end
  user = User.find_or_create_by!(email: "katarzyna.krzyzanowska@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wat_array << row.id
  end
  user = User.find_or_create_by!(email: "katarzyna.grabowska@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wat_array << row.id
  end
end
 
def build_users_uke_dsa_wme
  user = User.find_or_create_by!(email: "grzegorz.nieroda@uke.gov.pl") do |row|
    row.note = "<div>Naczelnik DSA-WME</div>"
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wme_array << row.id
  end
  user = User.find_or_create_by!(email: "katarzyna.socha@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wme_array << row.id
  end
  user = User.find_or_create_by!(email: "agnieszka.jaskolka@uke.gov.pl") do |row|
    row.note = ""
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
    @uke_dsa_wme_array << row.id
  end
end
 
def build_users_uke_dsa_other
  user = User.find_or_create_by!(email: "agnieszka.gladysz@uke.gov.pl") do |row|
    row.note = "<div>Dyrektor Departamentu Strategii i Analiz</div>"
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
  end
  user = User.find_or_create_by!(email: "katarzyna.gredczyszyn@uke.gov.pl") do |row|
    row.note = "<div>Radca Prezesa</div>"
    row.author_id = 1
    row.save!
    row.log_work('create', 1)
    puts 'CREATED USER: ' << row.email
    @uke_dsa_array << row.id
  end
end

def build_users_uke_dsa_uke_members
  @uke_dsa_array.each do |i|
    Member.create(group: @uke_dsa, user_id: i, author_id: 1) #unless Member.find_by(group: @bi, user_id: i) 
    puts "CREATED MEMBER:   #{@uke_dsa.name} + " << User.find(i).email
  end  

  @uke_dsa_wgd_array.each do |i|
    Member.create(group: @uke_dsa_wgd, user_id: i, author_id: 1)  
    puts "CREATED MEMBER:   #{@uke_dsa_wgd.name} + " << User.find(i).email
  end  

  @uke_dsa_wmi_array.each do |i|
    Member.create(group: @uke_dsa_wmi, user_id: i, author_id: 1)  
    puts "CREATED MEMBER:   #{@uke_dsa_wmi.name} + " << User.find(i).email
  end  

  @uke_dsa_wat_array.each do |i|
    Member.create(group: @uke_dsa_wat, user_id: i, author_id: 1)  
    puts "CREATED MEMBER:   #{@uke_dsa_wat.name} + " << User.find(i).email
  end  

  @uke_dsa_wme_array.each do |i|
    Member.create(group: @uke_dsa_wme, user_id: i, author_id: 1)  
    puts "CREATED MEMBER:   #{@uke_dsa_wme.name} + " << User.find(i).email
  end  

end

def build_users_uke_dsa
  build_users_uke_dsa_other
  build_users_uke_dsa_wgd
  build_users_uke_dsa_wmi
  build_users_uke_dsa_wat
  build_users_uke_dsa_wme
end

def build_users_uke_dsa_init
  @uke_dsa_array = []
  @uke_dsa_wgd_array = []
  @uke_dsa_wmi_array = []
  @uke_dsa_wat_array = []
  @uke_dsa_wme_array = []

  @uke_dsa = Group.find_by!(name: "UKE-DSA") 
  @uke_dsa_wgd = Group.find_by!(name: "UKE-DSA Wydział Geoprzetwarzania Danych") 
  @uke_dsa_wmi = Group.find_by!(name: "UKE-DSA Wydział Metod Ilościowych") 
  @uke_dsa_wat = Group.find_by!(name: "UKE-DSA Wydział Analiz Telekomunikacyjnych") 
  @uke_dsa_wme = Group.find_by!(name: "UKE-DSA Wydział Modelowania Ekonomicznego") 
end


build_users_uke_dsa_init
build_users_uke_dsa
build_users_uke_dsa_uke_members

puts "#####  END OF - 030_bi_users.rb  #####"
puts " "
