class UsersController < ApplicationController
  before_action :prepare_user_info
  before_action :prepare_items, only: [:shop, :buy, :complete]

  def index
    @transfer_info = User.get_transfer_info
  end

  def shop
  end

  def buy
    item = @items.select{|i| i[:id] == params[:id].to_i}.first

    if item[:price].to_f > @user[:available_balance].to_f
      redirect_to shop_users_path, notice: 'Unable to create transaction'
    else
      User.charge(item)
      redirect_to complete_user_path(item[:id])
    end
  end

  def complete
    @item = @items.select{|i| i[:id] == params[:id].to_i}.first
  end

  private

    def prepare_user_info
      @user = User.get_user_info
    end

    def prepare_items
      @items = [{
      id: 1,
      name: "Kindle",
      price: 947_000,
      img_src: 'kindle.jpg'
    }, {
      id: 2,
      name: "Macbook",
      price: 18_000_000,
      img_src: 'mac.jpg'
    }]
    end
end
