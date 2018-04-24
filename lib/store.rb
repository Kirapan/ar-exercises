class Store < ActiveRecord::Base
    has_many :employees
    validates :name, length: { minimum: 3 } 
    validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal: 0 }
    validate :either_mens_or_womens
    before_destroy :check_empty_store

    def add_new_employee!(employeeParams)
        employees.create!(employeeParams)
    end

    def either_mens_or_womens
        if mens_apparel == false && womens_apparel == false
        errors.add(:base, "A store must at least carry either mens or womens apparel")
        end
    end

    private

    def check_empty_store
        puts employees.size
        if employees.size > 0
            errors.add(:base, "Can't not delete stores that have employees!")
            throw :abort
        end
    end

end 