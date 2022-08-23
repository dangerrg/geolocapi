# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "DataTypes", type: :request do

  let!(:data_types) { create_list(:data_type, 3) }
  let!(:data_type_id) { data_types.first.id }
  # Test suite for POST /data_type
  describe "GET /data_types" do
    before { get '/api/v1/data_types' }
    it 'returns data_types' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /data_type
  describe 'POST /data_type' do
    # valid payload
    let(:valid_name) { { name_type: 'Public' } }

    context 'when the request is valid' do
      before { post '/api/v1/data_types', params: valid_name }

      it 'creates a data_type' do
        expect(json['name_type']).to eq('Public')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/data_types', params: { name_type: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
  # Test suite for DELETE /data_type/:id
  describe 'DELETE /data_types/:id' do
    before { delete "/api/v1/data_types/#{data_type_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
