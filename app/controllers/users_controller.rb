class UsersController < ApplicationController
  def index

    pagination = Pagination.new(params[:page].to_i,
                                User.count,
                                pagination_limit)

    @page = pagination.page
    @pages = pagination.pages
    
    @users = User.page(pagination)
  end

  private
  def pagination_limit
    50
  end

end
