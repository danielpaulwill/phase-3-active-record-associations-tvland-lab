class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def list_roles
    roles_list = []
    self.characters.each do |character|
      roles_list << character.name + " - " + character.show.name
    end
    roles_list
  end

end