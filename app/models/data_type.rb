class DataType < ApplicationRecord
  has_many :data_ips

  validates :name_type, presence: true
end
