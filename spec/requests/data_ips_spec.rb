# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "DataIps", type: :request do
  # initialize test data
  let!(:data_ips) { create_list(:data_ip, 3) }
  let(:data_ip_id) { data_ips.first.id }

  describe 'GET /data_ips' do
    before { get '/api/v1/data_ips' }
    it 'returns data_ips' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /data_ips/:id' do
    before { get "/api/v1/data_ips/#{data_ip_id}" }
    context 'when data_ip exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the data_ip item' do
        expect(json['id']).to eq(data_ip_id)
      end
    end

    context 'when data_ip does not exist' do
      let(:data_ip_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find DataIp with 'id'=0")
      end
    end
  end

  describe 'POST /data_ips/:id' do
    let!(:history) { create(:data_type) }
    let(:valid_attributes) do
      { ip_address: '160.39.144.19', data_type_id: history.id }
    end

    context 'when request attributes are valid' do
      before { post '/api/v1/data_ips', params: valid_attributes }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post '/api/v1/data_ips', params: {} }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe 'PUT /data_ips/:id' do
    let(:valid_attributes) { { ip_address: '134.201.250.155' } }
    before { put "/api/v1/data_ips/#{data_ip_id}", params: valid_attributes }
    context 'when data_ip exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the data_ip' do
        updated_item = DataIp.find(data_ip_id)
        expect(updated_item.ip_address).to match(/134.201.250.155/)
      end
    end

    context 'when the data_ip does not exist' do
      let(:data_ip_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find DataIp with 'id'=0")
      end
    end
  end

  describe 'DELETE /data_ips/:id' do
    before { delete "/api/v1/data_ips/#{data_ip_id}" }
    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
