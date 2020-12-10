class LivestreamsController < ApplicationController
  before_action :set_livestream, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /livestreams
  def index
    @livestreams = Livestream.where user: @user.id

    render json: @livestreams
  end

  # GET /livestreams/1
  def show
    render json: @livestream
  end

  # POST /livestreams
  def create
    @livestream = Livestream.new(livestream_params)
    @livestream.user = @user

    if @livestream.save
      render json: @livestream, status: :created, location: @livestream
    else
      render json: @livestream.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /livestreams/1
  def update
    if @livestream.update(livestream_params)
      render json: @livestream
    else
      render json: @livestream.errors, status: :unprocessable_entity
    end
  end

  # DELETE /livestreams/1
  def destroy
    @livestream.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livestream
      @livestream = Livestream.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def livestream_params
      params.require(:livestream).permit(:band, :show_day, :show_link, :img, :user_id)
    end
end
