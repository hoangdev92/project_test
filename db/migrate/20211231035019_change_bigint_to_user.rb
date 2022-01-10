class ChangeBigintToUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_groups, :bigint, :user_id
  end
end
