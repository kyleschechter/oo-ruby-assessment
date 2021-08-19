require_relative '../config/environment.rb'

# Gradually uncomment the code below to check
# that your API is working correctly.

customer1 = Customer.new("Bryan", "Reed")
customer2 = Customer.new("Clark", "Kent")
customer3 = Customer.new("Clark", "Gable")

raise "Customer.all did not return collection of instances of Customer" unless Customer.all.is_a?(Array) && Customer.all.first.is_a?(Customer)

restaurant1 = Restaurant.new("Hardees")
restaurant2 = Restaurant.new("Chiles")

raise "Restaurant.all did not return collection of instances of Restaurant" unless Restaurant.all.is_a?(Array) && Restaurant.all.first.is_a?(Restaurant)

content1 = "Had a great cheeseburger!"
content2 = "This place stinks."
content3 = "My water was very cold"

review1 = customer2.add_review(restaurant1, content2)
review2 = customer2.add_review(restaurant2, content1)
review3 = customer3.add_review(restaurant2, content3)

raise "Customer#add_review(restaurant, content) did not return an instance of Review" unless review1.is_a?(Review) && review3.is_a?(Review)

raise "Review.all did not return a collection of instances of Review" unless Review.all.is_a?(Array) && Review.all.first.is_a?(Review)
raise "Review.all did not return the correct amount of reviews" unless Review.all.size == 3

raise "Review#restaurant should return a restaurant" unless review1.restaurant.is_a?(Restaurant)
raise "Review#restaurant should return the correct restaurant object" unless review1.restaurant == restaurant1 && review2.restaurant == restaurant2 && review3.restaurant == restaurant2

raise "Review#customer should return a customer" unless review1.customer.is_a?(Customer)
raise "Review#customer should return the correct customer object" unless review1.customer == customer2 && review2.customer == customer2 && review3.customer == customer3

raise "Review#content did not return an instance of String" unless review1.content.is_a?(String)
raise "Review#content did not return the correct content for a review" unless review1.content == content2 && review2.content == content1 && review3.content == content3

raise "Restaurant#reviews did not return a collection" unless restaurant1.reviews.is_a?(Array)
raise "Restaurant#reviews did not return a collection of instances of Review" unless restaurant1.reviews.first.is_a?(Review)
raise "Restaurant#reviews did not return the correct reviews" unless restaurant1.reviews.size == 1 && restaurant1.reviews.first == review1 && restaurant2.reviews.size == 2 && restaurant2.reviews.include?(review2) && restaurant2.reviews.include?(review3)

raise "Restaurant#customers did not return a collection" unless restaurant1.customers.is_a?(Array)
raise "Restaurant#customers did not return a collection of customers" unless restaurant1.customers.first.is_a?(Customer)
raise "Restaurant#customers did not return the correct customers" unless restaurant1.customers.size == 1 && restaurant1.customers.first == customer2 && restaurant2.customers.size == 2 && restaurant2.customers.include?(customer2) && restaurant2.customers.include?(customer3)

raise "Customer#reviews did not return a collection" unless customer2.reviews.is_a?(Array)
raise "Customer#reviews did not return a collection of instances of Review" unless customer3.reviews.first.is_a?(Review)
raise "Customer#reviews did not return the correct reviews" unless customer1.reviews.empty? && customer3.reviews.first == review3 && customer2.reviews.size == 2 && customer2.reviews.include?(review1) && customer2.reviews.include?(review2)

raise "Customer#restaurants did not return a collection" unless customer3.restaurants.is_a?(Array)
raise "Customer#restaurants did not return a collection of restaurants" unless customer3.restaurants.first.is_a?(Restaurant)
raise "Customer#restaurants did not return the correct restaurants" unless customer3.restaurants.size == 1 && customer3.restaurants.first == restaurant2 && customer2.restaurants.size == 2 && customer2.restaurants.include?(restaurant1) && customer2.restaurants.include?(restaurant2)

raise "Restaurant.find_by_name(name) did not return an instance of Restaurant" unless Restaurant.find_by_name("Chiles").is_a?(Restaurant)
raise "Restaurant.find_by_name(name) did not return the correct restaurant" unless Restaurant.find_by_name("Chiles") == restaurant2 && Restaurant.find_by_name("Hardees") == restaurant1

raise "Customer.all_names should return every customer's full name" unless Customer.all_names.include?("Bryan Reed") && Customer.all_names.include?("Clark Kent") && Customer.all_names.include?("Clark Gable")

raise "Customer.find_by_full_name(full_name) did not return an instance of Customer" unless Customer.find_by_full_name("Clark Kent").is_a?(Customer)
raise "Customer.find_by_full_name(full_name) did not return the correct Customer" unless Customer.find_by_full_name("Clark Gable") == customer3

raise "Customer.find_all_by_first_name(name) should return a collection" unless Customer.find_all_by_first_name("Bryan").is_a?(Array)
raise "Customer.find_all_by_first_name(name) should return a collection of customers" unless Customer.find_all_by_first_name("Bryan").first.is_a?(Customer)
raise "Customer.find_all_by_first_name(name) should return an empty collection when there are no matches" unless Customer.find_all_by_first_name("Connor").is_a?(Array) && Customer.find_all_by_first_name("Connor").size == 0
raise "Customer.find_all_by_first_name(name) should return a correct collection of customers" unless Customer.find_all_by_first_name("Clark").size == 2 && Customer.find_all_by_first_name("Clark").include?(customer2) && Customer.find_all_by_first_name("Clark").include?(customer3)

binding.pry
