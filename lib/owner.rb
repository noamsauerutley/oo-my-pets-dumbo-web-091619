require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
   Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
end