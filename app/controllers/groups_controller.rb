class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @user_lists = @group.user_lists(except: current_user)
  end
end
