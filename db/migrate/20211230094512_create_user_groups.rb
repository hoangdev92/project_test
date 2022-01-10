class CreateUserGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :user_groups do |t|
      t.bigint :bigint
      t.bigint :group_id
      t.timestamps
    end
  end
end
