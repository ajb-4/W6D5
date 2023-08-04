class Cat < ApplicationRecord
    CAT_COLORS = ['black', 'red', 'green', 'orange', 'white', 'blue', 'yellow']
    GENDER = ['M','F']
    validates :name, :birth_date, :color, :sex, presence: true
    validates :color, inclusion: {in: CAT_COLORS}
    validates :sex, inclusion: {in: GENDER}
    validate :birth_date_cannot_be_future

    def birth_date_cannot_be_future
        debugger
        if birth_date > Date.today
            raise "Date cannot be in the future!"
        end
    end
end
