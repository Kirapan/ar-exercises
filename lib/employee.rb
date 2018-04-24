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