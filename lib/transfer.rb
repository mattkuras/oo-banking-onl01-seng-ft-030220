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
    self.sender.valid? && self.receiver.valid? == true 
  end
  
  def execute_transaction 
    if sender.valid? == false || receiver.valid? == false 
      self.status = "rejected" 
      puts "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      "Transfer was already executed."
  else 
    self.sender.balance -= amount
    self.receiver.balance += amount
    self.status = "complete"
  end 
end 

  
end
