# frozen_string_literal: true
require 'rails_helper'

RSpec.describe DataType, type: :model do
  # Association test
  it { should have_many(:data_ips) }
  # Validation tests
  it { should validate_presence_of(:name_type) }
end
