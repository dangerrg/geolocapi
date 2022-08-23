# frozen_string_literal: true
require 'rails_helper'

RSpec.describe DataIp, type: :model do
  # Association test
  it { should belong_to(:data_type) }
  # Validation tests
  it { should validate_presence_of(:ip_address) }
end
