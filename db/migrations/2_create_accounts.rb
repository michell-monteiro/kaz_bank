Sequel.migration do
    change do
        create_table(:accounts) do
            primary_key :id
            foreign_key :costumer_id, :costumers
            Integer :access_account, unique: true, allow_blank: true
            Float :balance, default: 0
            DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
        end
    end
end