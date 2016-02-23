class Contact < ActiveRecord::Base

  def self.all_favourites
    contacts = []
    Contact.all.each do |contact|
      if contact.favourite == true
        contacts << contact
      end
    end
    contacts
  end


  def self.search(letter)
    contacts = []

    contacts = Contact.all.select do | contact |
      contact.name.first == letter
    end

    contacts
  end

end
