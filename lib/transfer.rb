class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && receiver.valid? ? true : false
  end

  # def execute_transaction
  #   if @sender.balance < @amount && @sender.status == "closed"
  #     @status = "rejected"
  #     "Transation rejected. Please check your account balance."
  #   # elsif @status == "complete"
  #   #   puts "Transaction was already executed."
  #   else
  #     @sender.balance -= @amount
  #     @receiver.balance += @amount
  #     @status = "complete"
  #   end
  # end

  def execute_transaction
    if (@sender.valid? && @receiver.valid?) && (@sender.balance > @amount)
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transation rejected. Please check your account balance."
    end
  end
      
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
