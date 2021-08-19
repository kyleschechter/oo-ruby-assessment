class Restaurant
  attr_reader :name, :reviews

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def reviews
    Review.all.filter {|rev| rev.restaurant == self}
  end

  def customers
    self.reviews.map { |rev| rev.customer }
  end

  def self.find_by_name name
    @@all.find {|rest| rest.name == name}
  end

end
