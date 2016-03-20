class Transaction
  attr_reader :customer, :product, :id
  @@transactions = []

  def initialize(aCustomer,aProduct)
    @customer = aCustomer
    @product = aProduct
    @id =+ @@transactions.count + 1
    reduce_inventory
    add_to_transactions
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions[id-1]
  end

  private

  def reduce_inventory
    @product.sale
  end

  def add_to_transactions
    @@transactions << self
  end

end
