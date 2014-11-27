module Api
  module V1
    class GiftsController < ApplicationController
      respond_to :json

      def index
        @gifts = Gift.all
        respond_with @gifts.to_json(:methods => [:image_url])
      end

      def show
        @gift = Gift.find(params[:id])
        respond_with @gift.to_json(:methods => [:image_url])
      end

      # def create
      #   respond_with Gift.create(params[:gift])
      # end
      #
      # def update
      #   respond_with Gift.update(params[:id], params[:product])
      # end
      #
      # def destroy
      #   respond_with Gift.destroy(params[:id])
      # end

    end
  end
end