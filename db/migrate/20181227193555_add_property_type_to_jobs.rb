class AddPropertyTypeToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :property_type, :string
  end
end
