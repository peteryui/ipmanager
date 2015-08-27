class Admin::ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    # @lists = List.order("id DESC")
    @list = List.all
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end
end
