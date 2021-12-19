class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.bigint :user_id
      t.bigint :project_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
