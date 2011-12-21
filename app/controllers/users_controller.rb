class UsersController < ApplicationController
  def index
  end

  def filter
    @users = User.filter(params[:filters])
    @filters = User.filters_as_json(params[:filters])
    @users = @users.paginate(:page => params[:page])
    @pagination = { :total_pages => @users.total_pages, :current_page => @users.current_page, :next_page => @users.next_page, :previous_page => @users.previous_page }
  end
end
