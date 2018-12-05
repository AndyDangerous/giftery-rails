class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render 'new'
    end
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def claim
    @item = Item.find(params[:item_id])
    @item.claim

    redirect_to @item
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :url)
  end
end
