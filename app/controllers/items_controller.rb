class ItemsController < ApplicationController

  def index
    if params[:user_id]
      items = User.find(params[:user_id]).items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
    item = User.find(params[:user_id]).items.find(params[:id])
    render json: item
  end

  def create
    item = Item.create(item_params)
    render json: item, status: :created
  end

  private

  def item_params
    params.permit(:name, :description, :price, :user_id)
  end

end
