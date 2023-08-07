class Costumer < Sequel::Model
    plugin :validation_helpers
    one_to_many :accounts


    def validate
        super
        validates_presence %i[name doc address phone]
        validates_unique %i[doc phone]
    end
end