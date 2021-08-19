class Review
  attr_reader :customer, :restaurant, :content

  @@all = []

  def initialize(customer, restaurant, content)
    @restaurant = restaurant
    @content = content
    @customer = customer
    @@all << self
  end

  def self.all
    @@all
  end
end

