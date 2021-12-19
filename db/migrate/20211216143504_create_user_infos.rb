class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|
      t.bigint :user_id
      t.string :position
      t.date :onboard_date

      t.timestamps
    end
  end
end
