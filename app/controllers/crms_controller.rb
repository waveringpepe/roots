class CrmsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_crm, only: [:show, :edit, :update, :destroy]
  access admin: :all


  # GET /crms
  def index
    @crms = Crm.all
 
  end

  # GET /crms/1
  def show
  end

  # GET /crms/new
  def new
    @crm = Crm.new
  end

  # GET /crms/1/edit
  def edit
  end

  # POST /crms
  def create
    @crm = Crm.new(crm_params)

    if @crm.save
      redirect_to @crm, notice: 'Crm was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /crms/1
  def update
    if @crm.update(crm_params)
      redirect_to @crm, notice: 'Crm was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /crms/1
  def destroy
    @crm.destroy
    redirect_to crms_url, notice: 'Crm was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crm
      @crm = Crm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def crm_params
      params.require(:crm).permit(:private_status, :public_status, :credits_balance, :comment, :subscription_renewal, :user_id, :buy_credits)
    end
end
