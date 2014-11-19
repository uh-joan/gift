module Api
  module V1
    class GiftsController < ApplicationController
      respond_to :json

      def index
        respond_with Gift.all
      end

      def show
        respond_with Gift.find(params[:id])
      end

      def create
        respond_with Gift.create(params[:gift])
      end

      def update
        respond_with Gift.update(params[:id], params[:product])
      end

      def destroy
        respond_with Gift.destroy(params[:id])
      end

    end
  end
end