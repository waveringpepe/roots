class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_charge

  def show
    respond_to do |format|
      format.pdf {
        send_data(@charge.receipt.render,
                  filename: "#{@charge.id}-store-receipt.pdf",
                  type: "application/pdf",
                  disposition: :attachment
                 )
      }
    end
  end

  private

    def set_charge
      @charge = current_user.charges.find(params[:id])
    end
end
