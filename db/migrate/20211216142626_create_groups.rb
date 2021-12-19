class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.bigint :department_id
      t.bigint :learder

      t.timestamps
    end
  end
end
