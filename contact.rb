require 'csv'
require_relative 'contact_database'

class Contact

  class DuplicateUser < StandardError
  end
 
  attr_accessor :first_name, :last_name, :contact_email, :id
  ## if email is broken its because i changed email to contact_email

  def initialize(first_name, last_name, email)
    @first_name = first_name
    @last_name =last_name
    @contact_email = contact_email
  end
 
  def to_s
    "<#first_name}> <#last_name> (<#{email}>)"
  end

  def save(first_name, last_name, contact_email)
      if @id ## where is this coming from???
          UPDATE contacts SET firstname = first_name, lastname = last_name, email = contact_email
          WHERE id = @id ## will use SERIAL somewhere for id's
          ### should use the @id previously stored for creating this WHERE clause.
          ## need a SELECT SELECT
      else
        INSERT INTO contacts (firstname, lastname, email) ## table values
          VALUES (first_name, last_name, contact_email) ## variable values
          ## will use SERIAL somewhere for id's
      end

    # Either inserts or updates a row in the database, 
    # as necessary for the given instance of contact.
    # Ask yourself / discuss: When save is called, 
    # how will it know whether to run an INSERT or UPDATE SQL statement?
  end

  def destroy
    # Executes a DELETE SQL command against the database.
    # Ask yourself / discuss: What will it need to provide 
    # the database as part of the DELETE SQL statement?
  end

  ## Class Methods

  # def self.create(first_name, last_name, email)
  #     ContactDatabase.csv_write(first_name, last_name, email)
  # end

  def self.find_by_email(email)
    #Almost identical to the other two methods above. However, since emails 
    # are assumed to be unique, we return only a single record (or nil) here. 
  end

  # def self.duplicate_user(email)
  #   if ContactDatabase.csv_read.flatten.include?(email)
  #     true
  #   else
  #     false
  #   end
  # end

  def self.find_all_by_lastname(name)
    # Another class method, but this one returns an array of all contacts 
    # that have the provided last name. If none are found, an empty array 
    # should be returned.
  end

  def self.find_all_by_firstname(name)
    # Another class method, but this one returns an array of all contacts 
    # that have the provided first name. If none are found, an empty array 
    # should be returned.
  end

  # def self.find(search_term)

  #   user = "I could not find a contact containing #{search_term}"
  #   contact_row = ContactDatabase.csv_read
  #   contact_row.each do |row|
  #     row.each do |cell|
  #       if cell.include?(search_term)
  #         user = "<#{row[1]}> <#{row[2]}> (#{row[3]})"
  #       end
  #     end
  #   end
  #   user

  # end



  # def self.all
  #   contacts_list = ContactDatabase.list_contacts
  # end

  def self.find(id)
    # A class method to SELECT a contact row from the database by id 
    # and return a Contact instance that represents ("maps to") that row.
    # Ask yourself / discuss: Why is this a class method and not an instance method?
    SELECT c.id, c.firstname, c.lastname, c.email
    FROM contacts AS c
    WHERE c.id = id
  end

  # def self.show(id)
  #   found_contact = "I could not find a contact with an id of #{id}"
  #   contact_row = ContactDatabase.csv_read
  #   contact_row.each do |row|
  #     if row[0] == id
  #       found_contact = "<#{row[1]}> <#{row[2]}> (#{row[3]})"
  #     end
  #   end
  #   found_contact
  # end
 
end
