class Transaction
  attr_reader :customer, :product, :id
  @@transactions = []

  def initialize(aCustomer,aProduct)
    @customer = aCustomer
    @product = aProduct
    @id += @@transactions.count
    add_to_transactions
  end

  def self.all
    @@transactions
  end


  private

  def add_to_transactions
    @@transactions << self
  end

end
