# frozen_string_literal: true
FactoryBot.define do
 factory :data_ip do
   ip_address { Faker::Internet.public_ip_v4_address }
   data_type { create(:data_type) }
 end
end
