class ItemsController < ApplicationController
  def index
    if params[:user_id]
      # byebug
      user = User.find(params[:user_id])
      items = user.items
    else
      items = Item.all
    end

    render json: items, include: :user
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    if params[:user_id]
      user = User.find(params[:user_id])
      item = user.items.create(item_params)
    else
    end
    render json: item, status: :created
  end

  private

  def item_params
    params.permit(:name, :description, :price)
  end
end
