class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :client_id
      t.string :job_number
      t.integer :property_name
      t.integer :fee
      t.timestamps
    end
  end
end
