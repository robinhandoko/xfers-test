class UsersController < ApplicationController
  before_action :prepare_user_info

  def index
    @transfer_info = User.get_transfer_info
  end

  def shop
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

  def buy
    item = [{
      id: 1,
      name: "Kindle",
      price: 947_000,
      img_src: 'kindle.jpg'
    }, {
      id: 2,
      name: "Macbook",
      price: 18_000_000,
      img_src: 'mac.jpg'
    }].select{|i| i[:id] == 1}.first

    if item[:price].to_f > @user[:available_balance].to_f
      redirect_to shop_user_path, alert: 'Unable to create transaction'
    else
      User.charge(item)
    end

    redirect_to complete_users_path
  end

  def complete
    @item = [{
      id: 1,
      name: "Kindle",
      price: 947_000,
      img_src: 'kindle.jpg'
    }, {
      id: 2,
      name: "Macbook",
      price: 18_000_000,
      img_src: 'mac.jpg'
    }].select{|i| i[:id] == 1}.first
  end

  private

    def prepare_user_info
      @user = User.get_user_info
    end
end
