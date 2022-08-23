# frozen_string_literal: true
module Api
  module V1
    # class DataTypesController
    class DataTypesController < ApplicationController
      before_action :set_data_type, only: :destroy

      # GET /data_types
      def index
        @data_types = DataType.order(created_at: :desc)
        render json: { status: 'Success', message: 'Load DataTypes', data: @data_types }, status: :ok
        # render json: DataTypesRepresenter.new(@data_types).as_json
      end

      # POST /data_type
      def create
        @data_type = DataType.create(data_type_params)
        if @data_type.save
          render json: { status: 'Success', message: 'Created DataTypes', data: @data_types }, status: :created
          # render json: DataTypeRepresenter.new(@data_type).as_json
        else
          render json: @data_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /data_types/:id
      def destroy
        @data_type.destroy
        render json: { status: 'Success', message: 'Deleted DataTypes', data: @data_types }, status: :ok
        # head :no_content
      end

      private

      def data_type_params
        params.permit(:name_type)
      end

      def set_data_type
        @data_type = DataType.find(params[:id])
      end
    end
  end
end
