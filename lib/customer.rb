class Customer
  attr_reader :name, :purchases
  @@customers = []

  def initialize(options={})
    @name = options[:name]
    @purchases = []
    add_to_customers
  end

  def self.all #returns all customers
    @@customers
  end

  def self.find_by_name(aName) #returns the customer matchin the unique name (yes this is not a very good in the real world)
    @@customers.find{|x| x.name == aName}
  end

  def purchase(aProduct) #allows the Customer to create a new purchase
    @purchases << Transaction.new(self,aProduct)
  end

  def purchase_count #returns purchase count for said customer
    @purchases.nil? ? 0 : @purchases.count + 1
  end

  def self.customer_purchases_count #Feature 1/2
    @@customers.each{|x| puts "#{x.name} : #{x.purchase_count}"}
  end


  private

  def add_to_customers #adds to master list
    if Customer.find_by_name(@name).nil?
      @@customers << self
    else raise DuplicateCustomerError, "'#{@name}' already exists."
    end
  end

end
