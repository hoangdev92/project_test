class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.date :date_of_birth
      t.bigint :phone
      t.string :address
      t.bigint :user_id

      t.timestamps
    end
  end
end
