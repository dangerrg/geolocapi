class DataIp < ApplicationRecord
  belongs_to :data_type

  validates :ip_address, presence: true
end
