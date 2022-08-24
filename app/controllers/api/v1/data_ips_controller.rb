module Api
  module V1
    class DataIpsController < ApplicationController
      include Geolocation
      before_action :set_data_ip, only: %i[update show destroy]
      after_action :auto_update, only: :create

      # GET /data_ips
      def index
        @data_ips = DataIp.order(created_at: :desc)
        render json: { status: 'Success', message: 'Load DataIp', data: @data_ips }, status: :ok
      end

      # POST /data_ip
      def create
        @data_ip = DataIp.create(data_ip_params)
        if @data_ip.save
          pin_me(:ip_address)
          render json: { status: 'Success', message: 'Created DataIp', data: @data_ip }, status: :created
        else
          render json: @data_ip.errors, status: :unprocessable_entity
        end
      end

      # GET /data_ips/:id
      def show
        render json: { status: 'Success', message: 'Load DataIp', data: @data_ip }, status: :ok
      end

      # PUT /data_ips/:id
      def update
        @data_ip.update(data_ip_params)
        head :no_content
      end

      # DELETE /data_ips/:id
      def destroy
        @data_ip.destroy
        head :no_content
      end

      private

      def data_ip_params
        params.permit(:ip_address, :ip_type, :continent_code,
                      :continent_name, :country_code, :country_name,
                      :region_code, :region_name, :city,
                      :zip, :data_type_id
                      )
      end

      def set_data_ip
        @data_ip = DataIp.find(params[:id])
      end

      def pin_me(ip)
        JSON.parse(Geolocation.getiplocation(ip))
      end

      def auto_update
        # update_column(:column_name, new_value) # This will skip validation gracefully.
        # update_column(:ip_address, pin_me(@data_ip.ip_address).values.reverse[0])
        @data_ip.update_column(:ip_type, pin_me(@data_ip.ip_address).values.reverse[1])
        @data_ip.update_column(:continent_code, pin_me(@data_ip.ip_address).values.reverse[2])
        @data_ip.update_column(:continent_name, pin_me(@data_ip.ip_address).values.reverse[3])
        @data_ip.update_column(:country_code, pin_me(@data_ip.ip_address).values.reverse[4])
        @data_ip.update_column(:country_name, pin_me(@data_ip.ip_address).values.reverse[5])
        @data_ip.update_column(:region_code, pin_me(@data_ip.ip_address).values.reverse[6])
        @data_ip.update_column(:region_name, pin_me(@data_ip.ip_address).values.reverse[7])
        @data_ip.update_column(:city, pin_me(@data_ip.ip_address).values.reverse[8])
        @data_ip.update_column(:zip, pin_me(@data_ip.ip_address).values.reverse[9])
      end
    end
  end
end
