class Admin::ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @lists = List.all
  end

  def update
    @lists = List.find(params[:id])

    if @lists.update(list_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

end
