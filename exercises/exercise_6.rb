require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
    belongs_to :store
    validates :first_name, :last_name, presence: true
    validates :hourly_rate, numericality: {only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200}
    validates :store, presence: true
    before_save :password_generation

    private
    def password_generation
        self.password=rand(36**8).to_s(36)
    end

end

@store1.add_new_employee!(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.add_new_employee!(first_name: "Xiaoqi", last_name: "Pan", hourly_rate: 100)
@store1.add_new_employee!(first_name: "Mateus", last_name: "Braga", hourly_rate: 40)
@store2.add_new_employee!(first_name: "Michael", last_name: "Stranges", hourly_rate: 70)
@store2.add_new_employee!(first_name: "Frank", last_name: "Addison", hourly_rate: 50)