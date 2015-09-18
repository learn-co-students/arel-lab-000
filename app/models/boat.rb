class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  def self.first_five
    Boat.all.limit(5)
  end

  def self.ship
    Boat.where("length > ?", 20)
  end

  def self.dinghy
    Boat.where("length <= ?", 20)
  end

  def self.last_three_alphabetically
    Boat.order(name: :desc).limit(3)
  end

  def self.without_a_captain
    Boat.where(captain_id: nil)
  end

  def self.sailboats
    Classification.find(2).boats
  end

  def self.with_three_classifications
    three_boat = BoatClassification.select(:boat_id).group("boat_id").having("count(boat_id) = ?", 3)
    Boat.where(id: three_boat)
  end

end
