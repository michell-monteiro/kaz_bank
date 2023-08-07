Sequel.migration do
    change do
        create_table(:costumers) do
            primary_key :id
            String :name, size: 100, null: false
            String :doc, unique: true, allow_blank: true
            String :address, allow_blank: true
            String :phone, allow_blank: true
        end
    end
end