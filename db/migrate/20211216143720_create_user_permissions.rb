class CreateUserPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_permissions do |t|
      t.bigint :user_id
      t.bigint :permission_id

      t.timestamps
    end
  end
end
