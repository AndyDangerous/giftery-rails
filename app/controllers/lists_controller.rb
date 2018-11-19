class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    if @list.user == current_user
      render "personal_show"
    else
      render "public_show"
    end
  end

  def edit
    @list = List.find(params[:id])
  end
end
