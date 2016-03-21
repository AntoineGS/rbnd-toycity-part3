class Transaction
  attr_reader :customer, :product, :id
  @@transactions = []

  def initialize(aCustomer,aProduct)
    @customer = aCustomer
    @product = aProduct
    @id =+ @@transactions.count + 1
    reduce_inventory #reduces inventory for each transactions
    add_to_transactions
  end

  def self.all #Returns all transactions
    @@transactions
  end

  def self.find(id) #returns object based on an id
    @@transactions[id-1]
  end


  private

  def reduce_inventory #reduces the inventory by calling Product.sale
    @product.sale
  end

  def add_to_transactions #adds the object to the master array
    @@transactions << self
    @customer.purchases << self ##allows creation of transactions both in Transaction and Customer objects ensuring the Customer.purcahses is updated for Feature 1/2
  end

end
