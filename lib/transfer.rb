class Transfer
  attr_accessor :sender, :receiver, :status, :transfer_amount


  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @transfer_amount = transfer_amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

end
