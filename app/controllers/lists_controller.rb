class ListsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @lists = List.all
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])

    # update user
    @list.set_user_id(current_user.id)
    @list.set_user_ip(current_user.current_sign_in_ip)

    udpate_history

    if @list.update(product_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  def clean
    @list = List.find(params[:id])
  end

  private

  def product_params
    # params.require(:list).permit(:ip, :category, :user_name, :phone_number, :mac_address, :location, :description, :users_attributes => [:id], :users_attributes => [:user_ip])
    params.require(:list).permit(:ip, :category, :user_name, :phone_number, :mac_address, :location, :description)
  end

  def udpate_history

    # diff update
    permitted = product_params
    # permitted.new(:user_id, current_user.id)
    @history = History.new(permitted)

    @history.user_id = current_user.id
    @history.ip = @list.ip

    if (@history.category != @list.category)
      if (@list.category.nil?)
        @list.category = ""
      end
        @history.category = @list.category + " => " + @history.category
    end

    if (@history.user_name != @list.user_name)
      if (@list.user_name.nil?)
        @list.user_name = ""
      end
        @history.user_name = @list.user_name + " => " + @history.user_name
    end

    if (@history.phone_number != @list.phone_number)
      if (@list.phone_number.nil?)
        @list.phone_number = ""
      end
        @history.phone_number = @list.phone_number + " => " + @history.phone_number
    end

    if (@history.mac_address != @list.mac_address)
      if (@list.mac_address.nil?)
        @list.mac_address = ""
      end
        @history.mac_address = @list.mac_address + " => " + @history.mac_address
    end

    if (@history.location != @list.location)
      if (@list.location.nil?)
        @list.location = ""
      end
        @history.location = @list.location + " => " + @history.location
    end

    if (@history.description != @list.description)
      if (@list.description.nil?)
        @list.description = ""
      end
      @history.description = @list.description + " => " + @history.description
    end

    @history.save

  end
end
