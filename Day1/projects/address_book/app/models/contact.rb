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
    Contact.where("name like \'#{letter}%\'")
  end

end
