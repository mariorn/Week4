
20.times do |i|

  Contact.create(name: "Contact #{i}", address: "Adress #{i}", phone: i, email: "Email #{i}")

end