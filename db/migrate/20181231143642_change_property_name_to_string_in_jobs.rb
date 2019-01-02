class ChangePropertyNameToStringInJobs < ActiveRecord::Migration[5.2]
  def change
    change_column :jobs, :property_name, :string
  end
end
