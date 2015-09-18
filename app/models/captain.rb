class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    boatie = Classification.find(3).boats
    capts = boatie.select(:captain_id)
    Captain.where(id: capts)
  end

  def self.sailors
    boatie = Classification.find(2).boats
    capts = boatie.select(:captain_id)
    Captain.where(id: boatie)
  end

  def self.talented_seamen
    boatie1 = Classification.find(2).boats
    boatie2 = Classification.find(4).boats
    capts1 = boatie1.select(:captain_id)
    capts2 = boatie2.select(:captain_id)
    Captain.where(id: capts1).where(id: capts2)
  end

  def self.non_sailors
    boatie = Classification.find(2).boats
    Captain.where.not(id: boatie)
  end


end
