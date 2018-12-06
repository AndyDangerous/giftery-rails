class GroupsController < ApplicationController

  def new
  end

  def create
    @group = Group.create(group_params)

    if @group.save
      current_user.groups << @group
      redirect_to @group
    else
      render 'new'
    end
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @user_lists = @group.user_lists(except: current_user)
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
