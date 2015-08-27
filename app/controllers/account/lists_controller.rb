class Account::ListsController < ApplicationController

  def index
    @lists = List.all
  end

end
