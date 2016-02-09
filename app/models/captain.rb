class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    all.joins(boats: :classifications).where("classifications.name = 'Catamaran'")
  end

  def self.sailors
    all.joins(boats: :classifications).where("classifications.name = 'Sailboat'").distinct
  end

  def self.motorers
    all.joins(boats: :classifications).where("classifications.name = 'Motorboat'").distinct
  end

  def self.talented_seamen
    talented_seamen_ids = sailors.ids & motorers.ids
    where(id: talented_seamen_ids)
  end

  def self.non_sailors
    non_sailors_ids = all.ids - sailors.ids 
    where(id: non_sailors_ids)
  end

end
