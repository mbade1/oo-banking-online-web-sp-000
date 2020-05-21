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

  def execute_transaction
    #if the sender and receiver are valid; the sender's balance is large enough for the amount to be transferred; and the status is pending...
    if (@sender.valid? && @receiver.valid?) && (@sender.balance > @amount && @sender.status = "pending")
      #execute the transaction by taking the amount out of the sender and adding it to the receiver. Also change the status to complete so it doesn't execute multiple times.
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      #Otherwise, change the status to rejected and tell the user their account balance is too low.
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    #If the transfer is done and the status is already complete, send the $$ back to the sender and change the status.
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
