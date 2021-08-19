

class Customer
  attr_reader :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.find_by_full_name(full_name)
    @@all.find {|cust| cust.full_name == full_name}
  end

  def self.find_all_by_first_name(name)
    found_cust = @@all.filter {|cust| cust.first_name == name}
    found_cust
  end

  def self.all_names
    @@all.map {|cust| cust.full_name}
  end

  def add_review(restaurant, content)
    Review.new(self, restaurant, content)
  end

  def reviews
    Review.all.filter {|review| review.customer == self}
  end

  def restaurants
    self.reviews.map {|rev| rev.restaurant}
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

end
