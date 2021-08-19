# Object Relations Code Challenge

For this assignment, we'll be working with a Yelp-style domain. We have three models - `Restaurant`, `Customer`, and `Review`.
For our purposes, a `Restaurant` has many `Reviews`, a `Customer` has many `Reviews`, and a `Review` belongs to a `Customer` and to a `Restaurant`.
`Restaurant` - `Customer` is a many to many relationship.

Sketch out your object relationships before getting started.

## Topics

* Classes vs Instances
* Variable Scope ( Class, Instance, Local )
* Object Relationships
* Arrays and Array Methods
* Class Methods

## Instructions

Your goal is to build out all of the methods listed in the deliverables. Do your best to follow Ruby best practices. For example, use higher-level array methods such as `map`, `select`, and `find` when appropriate in place of `each`.

We've provided you with a console that you can use to test your code. To enter a console session, run `ruby tools/console.rb`. You'll be able to test out the methods that you write here.

  --  Make sure you are testing your code as you go! --

Look at the `console.rb` file and use the commented out code to guide writing your API. Comment out a line or section at a time and verify that 1. your code executes without error and 2. your code returns the expected data.

## Submission

Do not push your changes up to Github. When you finish:

1. If you haven't already, create a custom branch with `git checkout -b custom_branch`.
1. `git add` and `git commit` your changes.
1. From you custom branch, run `git format-patch master --stdout > your_name.patch`, replacing `your_name` with your first and last name.
1. Send the patch file to your instructor on Connect before the specified time. Remember, you can use `open .` to launch a Finder window from your current directory, and then drag your file into Connect.

## Deliverables

Implement all of the methods described below

### `Customer`

* Customer.all
  * should return **all** of the customer instances
* Customer.find_by_full_name(full_name)
  * given a string of a **full name**, returns the **first customer** whose full name matches
* Customer.find_all_by_first_name(name)
  * given a string of a first name, returns an **array** containing all customers with that first name
* Customer.all_names
  * should return an **array** of all of the customer full names
* Customer#reviews
  * returns an array of all reviews given by the customer
* Customer#restaurants
  * returns all of restaurants the customer has reviewed. A `Customer` has many `Restaurants` and a `Restaurant` has many `Customers`
* Customer#add_review(restaurant, content)
  * given a **restaurant object** and some review content (as a string), creates a new review and associates it with that customer and restaurant. A `Review` belongs to a `Customer` and belongs to a `Restaurant`. The method should return the new review.

### `Review`

* Review.all
  * returns all of the reviews
* Review#content
  * returns this string attribute
* Review#customer
  * returns the customer object for that given review
* Review#restaurant
  * returns the restaurant object for that given review

### `Restaurant`

* Restaurant.all
  * returns an array of all restaurants
* Restaurant.find_by_name(name)
  * given a string of restaurant name, returns the first restaurant that matches
* Restaurant#reviews
  * returns an array of all reviews for that restaurant
* Restaurant#customers
  * returns all of customers who have written reviews of that restaurant. A `Restaurant` has many `Customers` and a `Customer` has many `Restaurants`
