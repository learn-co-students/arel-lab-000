class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    Classification.select(:name)
  end

  def self.longest
    longest_boat = Boat.maximum(:length)
    long_boat = Boat.where(length: longest_boat)
    long_boat.first.classifications
  end

end
