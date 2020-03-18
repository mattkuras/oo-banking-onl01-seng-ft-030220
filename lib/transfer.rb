require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount 
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @amount = amount 
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid? 
  end
  
  def execute_transaction 
    if !valid? || sender.balance < amount || @status == "complete"
      self.status = "rejected" 
      "Transaction rejected. Please check your account balance."
  else 
    self.sender.balance -= amount
    self.receiver.balance += amount
    self.status = "complete"
  end 
end 

  def reverse_transfer
    if @status == "completed"
    self.sender.balance += amount
    self.receiver.balance -= amount
    self.status = "reversed"
  end
  
end
