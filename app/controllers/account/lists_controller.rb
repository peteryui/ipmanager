class Account::ListsController < ApplicationController

  before_action :authenticate_user!

  def index
    @lists = List.all
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    # update user
    @list.last_update_user = current_user.email
    # diff update
    permitted = product_params
    @history = History.new(permitted)

    if (@history.ip != @list.ip)
      if (@list.ip.nil?)
        @list.ip = ""
      end
        @history.ip = @list.ip + " => " + @history.ip
    elsif (@history.category != @list.category)
      if (@list.category.nil?)
        @list.category = ""
      end
        @history.category = @list.category + " => " + @history.category
    elsif (@history.user_name != @list.user_name)
      if (@list.user_name.nil?)
        @list.user_name = ""
      end
        @history.user_name = @list.user_name + " => " + @history.user_name
    elsif (@history.phone_number != @list.phone_number)
      if (@list.phone_number.nil?)
        @list.phone_number = ""
      end
        @history.phone_number = @list.phone_number + " => " + @history.phone_number
    elsif (@history.mac_address != @list.mac_address)
      if (@list.mac_address.nil?)
        @list.mac_address = ""
      end
        @history.mac_address = @list.mac_address + " => " + @history.mac_address
    elsif (@history.location != @list.location)
      if (@list.location.nil?)
        @list.location = ""
      end
        @history.location = @list.location + " => " + @history.location
    elsif (@history.description != @list.description)
      if (@list.description.nil?)
        @list.description = ""
      end
      @history.description = @list.description + " => " + @history.description
    end
    @history.user_id = current_user.id
    @history.save

    if @list.update(product_params)
      redirect_to account_lists_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:list).permit(:ip, :category, :user_name, :phone_number, :mac_address, :location, :description, :last_update_user)
  end

end
