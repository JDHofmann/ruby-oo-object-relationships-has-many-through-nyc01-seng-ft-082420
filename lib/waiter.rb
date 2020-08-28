require 'pry'

class Waiter
  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.filter{|meal| meal.waiter == self}
  end

  def best_tipper
    best_tip_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    best_tip_meal.customer
    # binding.pry
  end

  def worst_tipper
    worst_tip_meal = meals.min do |meal_a , meal_b|
      meal_a.tip <=> meal_b.tip
    end
    worst_tip_meal.customer
  end

  def most_frequent_customer
    # This is a guess, I'm not sure if I can write a test for this #
    customer_meal_number = {}
    
    meals.each do |meal|
    if customer_meal_number.key?(meal.customer)
      customer_meal_number[meal.customer] += 1
    elsif
      customer_meal_number[meal.customer] = 1
    end
    most_frequent = customer_meal_number.max | cus_a , cus_b |
      :cus_a <=> :cus_b
    end
    most_frequent
  end
end