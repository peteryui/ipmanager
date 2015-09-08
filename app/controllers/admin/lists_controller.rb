class Admin::ListsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @lists = List.all
  end

end
