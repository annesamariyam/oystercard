class Station

  attr_reader :name

  def initialize(name, zone)
    @name = name
    @zone = zone
  end 

  def name
    @name
  end

  def zone
    @zone
  end
end