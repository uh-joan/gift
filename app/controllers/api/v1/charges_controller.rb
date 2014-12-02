module Api
  module V1
    class ChargesController < ApplicationController
      respond_to :json

      def index
        @charges = Charge.all
        respond_with @charges.to_json()
      end

      def show
        @charge = Charge.find(params[:id])
        respond_with @charge.to_json()
      end

      def create
        @purchases = Purchase.all
        @charge = Charge.new(charge_params)
        @charge.identifier = SecureRandom.uuid
        @charge.currency = 'gbp'

        if @charge.save
          respond_to do |format|
            format.json { render :json => @charge }
          end
        end

        # token = params[:stripeToken]

        begin
          charge = Stripe::Charge.create(
            :amount => @charge.amount,
            :currency => @charge.currency,
            :card => params[:stripeToken],
            :description => @charge.identifier
          )
          # customer = Stripe::Charge.create(
          #     :card => params[:stripeToken],
          #     :email => @charge.email
          # )
          #
          # charge = Stripe::Charge.create(
          #     :amount => @charge.amount,
          #     :currency => @charge.currency,
          #     :customer => customer.id,
          #     :description => @charge.identifier
          # )
        rescue Stripe::CardError => e
          flash[:error] = e.message
        end
      end

      # def update
      #   respond_with Purchase.update(params[:id], params[:product])
      # end

      def destroy
        respond_with Charge.destroy(params[:id])
      end

      private

      def charge_params
        params.require(:charge).permit(:identifier, :currency, :amount, :email, :completed, :stripeToken)
        #params.require(:charge).permit!
      end

    end
  end
end