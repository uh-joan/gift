module Api
  module V1
    class PurchasesController < ApplicationController
      respond_to :json

      def index
        @purchases = Purchase.all
        respond_with @purchases.to_json()
        # respond_with Purchase.all
      end

      def show
        @purchase = Purchase.find(params[:id])
        respond_with @purchase.to_json()
        #respond_with Purchase.find(params[:id])
      end

      def create
        @purchase = Purchase.new(purchase_params)
        @purchase.identifier = SecureRandom.uuid

        if @purchase.save
          respond_to do |format|
            format.json { render :json => @purchase }
          end
        end
      end


      def update
        respond_with Purchase.update(params[:id], params[:product])
      end

      def destroy
        respond_with Purchase.destroy(params[:id])
      end

      private

      def purchase_params
        params.require(:purchase).permit(:identifier, :amount, :senderName, :senderEmail, :recipientName, :recipientEmail, :message, :status, :vendor, :completed, :confirmedPayment)
      end

    end
  end
end