class DataIp < ApplicationRecord
  belongs_to :data_type

  validates :ip_address, presence: true
  validates :data_type_id, presence: true
end
