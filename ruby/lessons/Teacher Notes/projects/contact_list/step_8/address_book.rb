require './contact'

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def run
    loop do
      puts "Address Book: "
      puts "a: Add Contact"
      puts "p: Print Contact List"
      puts "e: Exit"
      print "Enter your choice: "
      input = gets.chomp.downcase
      case input
      when "e"
        break
      when "p"
        print_contact_list
      when "a"
        add_contact
      end
    end
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("Name", search, results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub("-", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "").include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone Number", search, results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address", search, results)
  end

  def add_contact
    contact = Contact.new
    print "First Name: "
    contact.first_name = gets.chomp
    print "Middle Name: "
    contact.middle_name = gets.chomp
    print "Last Name: "
    contact.last_name = gets.chomp
    contacts.push(contact)
  end

  def print_results(type, search, results)
    puts "#{type} search results (#{search})"
    results.each do |contact|
      puts contact.to_s('first_last')
      contact.print_phone_numbers
      contact.print_addresses
    end
  end

  def print_contact_list
    puts "Contact List"
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end
end

address_book = AddressBook.new
address_book.run