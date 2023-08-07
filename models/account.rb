class Account < Sequel::Model
    plugin :validation_helpers
    many_to_one :costumers

    def validate
        super
        validates_presence %i[access_account costumer_id]
        validates_unique %i[access_account]
    end
end