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
    if @sender.balance > @transfer_amount && @status == "pending"
      @sender.balance -= @transfer_amount
      @receiver.balance += @transfer_amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @transfer_amount
      @receiver.balance -= @transfer_amount
      @status = "reversed"
    end
  end

end
