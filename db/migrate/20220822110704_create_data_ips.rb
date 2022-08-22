class CreateDataIps < ActiveRecord::Migration[6.0]
  def change
    create_table :data_ips do |t|
      t.string :ip_address
      t.string :type
      t.string :continent_code
      t.string :continent_name
      t.string :country_code
      t.string :country_name
      t.string :region_code
      t.string :region_name
      t.string :city
      t.string :zip
      t.references :data_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
