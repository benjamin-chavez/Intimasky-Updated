class MasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    if params[:search].present?
      sql_query = "name ILIKE :query
      OR description ILIKE :query
      OR category ILIKE :query
      OR address ILIKE :query
      "
      @masks = Mask.where(sql_query, query: "%#{params[:search][:query]}%")
    else
      @masks = Mask.all
    end
    geocode(@masks)
  end

  def show
    @mask = Mask.find(params[:id])
  end

  def new
    @mask = Mask.new
  end

  def create
    @mask = Mask.new(mask_params)
    @mask.user = current_user
    if @mask.save
      redirect_to mask_path(@mask)
    else
      render :new
    end
  end

  def edit
    @mask = Mask.find(params[:id])
  end

  def update
    @mask = Mask.find(params[:id])
    @mask.update(mask_params)
    redirect_to mask_path(@mask)
  end

  def destroy
    @mask = Mask.find(params[:id])
    @mask.destroy
    redirect_to dashboard_path
  end

  private
  def mask_params
    params.require(:mask).permit(:name, :description, :category, :price, :photo, :address)
  end

  def geocode(masks)
    masks.geocoded #returns mask with coordinates

    @markers = masks.map do |mask|
      {
        lat: mask.latitude,
        lng: mask.longitude
      }
    end
  end
end
