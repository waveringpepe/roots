class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show], user: {except: [:new,:destroy, :edit, :create, :update]}, teacher: {except: [:new,:destroy, :edit, :create, :update]}, admin: :all

  # GET /languages
  def index
    @languages = Language.all
  end

  # GET /languages/1
  def show
    @plan = Plan.all
    @teacher_plan = Plan.find(1)
    @basic_plan = Plan.find(5)
    @medium_plan = Plan.find(6)
    @intensive_plan = Plan.find(7)
    @free_plan = Plan.find(8)
  end

  # GET /languages/new
  def new
    @language = Language.new
  end

  # GET /languages/1/edit
  def edit
  end

  # POST /languages
  def create
    @language = Language.new(language_params)

    if @language.save
      redirect_to @language, notice: 'Language was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /languages/1
  def update
    if @language.update(language_params)
      redirect_to @language, notice: 'Language was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /languages/1
  def destroy
    @language.destroy
    redirect_to languages_url, notice: 'Language was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def language_params
      params.require(:language).permit(:name)
    end
end
