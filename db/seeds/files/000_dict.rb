puts " "
puts "#####  RUN - 000_dict.rb  #####"

  user = CreateAdminService.new.call()
  puts 'CREATED ADMIN USER: ' << user.email 
  user.log_work('create', user.id)


  # PROPOSAL_STATUS_CREATED = 1
  # PROPOSAL_STATUS_APPROVED = 2
  # PROPOSAL_STATUS_NOT_APPROVED = 3
  # PROPOSAL_STATUS_CLOSED = 4
  # PROPOSAL_STATUS_ANNULLED = 5

  # ProposalStatus.create(name: "Nowe")
  # ProposalStatus.create(name: "Zaakceptowane")
  # ProposalStatus.create(name: "Odrzucone")
  # ProposalStatus.create(name: "Zamknięte")
  # ProposalStatus.create(name: "Anulowane")

  # LegalFormType.create(name: "spółka z ograniczoną odpowiedzialnością")
  # LegalFormType.create(name: "spółka akcyjna")
  # LegalFormType.create(name: "spółka jawna")
  # LegalFormType.create(name: "spółka partnerska")
  # LegalFormType.create(name: "spółka komandytowa")
  # LegalFormType.create(name: "spółka komandytowo-akcyjna")
  # LegalFormType.create(name: "działalność gospodarcza osoby fizycznej")
  # LegalFormType.create(name: "przedsiębiorstwo państwowe")
  # LegalFormType.create(name: "stowarzyszenie")
  # LegalFormType.create(name: "spółdzielnia")
  # LegalFormType.create(name: "instytut badawczy")
  # LegalFormType.create(name: "szkoła wyższa")
  # LegalFormType.create(name: "jednostka samorządu terytorialnego")
  # LegalFormType.create(name: "oddział zagranicznego przedsiębiorcy")
  # LegalFormType.create(name: "spółka europejska")
  # LegalFormType.create(name: "inna")

puts "#####  END OF - 000_dict.rb  #####"
puts " "
