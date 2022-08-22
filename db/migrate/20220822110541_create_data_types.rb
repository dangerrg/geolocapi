class CreateDataTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :data_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
