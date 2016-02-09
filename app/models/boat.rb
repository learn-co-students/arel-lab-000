class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    all.limit(5)
  end

  def self.dinghy
    all.where("length < ?", "20")
  end

  def self.ship
    all.where("length > ?", "20")
  end

  def self.last_three_alphabetically
    all.order('name DESC').limit(3)
  end 

  def self.without_a_captain
    all.where("captain_id is null")
  end

  def self.sailboats
    self.joins(:classifications).where("classifications.name = 'Sailboat'")
  end

  def self.with_three_classifications
    self.joins(:classifications).group("boat_classifications.boat_id").having("count(boat_classifications.boat_id) = 3")
    ### below would have done classifications that hold three boats, not visa versa
    ###self.joins(:classifications).group("classifications.name").having("count(classifications.name) = 3")
  end

  def list_classifications
    
  end

end
