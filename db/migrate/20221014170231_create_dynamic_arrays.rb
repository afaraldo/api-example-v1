class CreateDynamicArrays < ActiveRecord::Migration[7.0]
  def change
    create_table :dynamic_arrays do |t|
      t.text :internal_array

      t.timestamps
    end
  end
end
