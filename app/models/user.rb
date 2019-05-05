class User
  def self.get_user_info
    begin
      user = Xfers::User.retrieve
    rescue Xfers::XfersError => e
      raise e
    end

    return user
  end

  def self.get_transfer_info
    begin
      transfer_info = Xfers::User.transfer_info
    rescue Xfers::XfersError => e
      raise e
    end

    return transfer_info
  end

  def self.charge(item)
    begin
      params = {
        'amount' => item[:price],
        'currency' => 'IDR',
        'order_id' => DateTime.now.to_i,
        'redirect' => false,
        'debit_only' => true
      }
      charge = Xfers::Charge.create params
    rescue Xfers::XfersError => e
      raise e
    end

    return charge
  end
end
