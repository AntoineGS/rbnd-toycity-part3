class Customer
  attr_reader :name, :purchases
  @@customers = []

  def initialize(options={})
    @name = options[:name]
    @purchases = []
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(aName)
    @@customers.find{|x| x.name == aName}
  end

  def purchase(aProduct)
    @purchases << Transaction.new(self,aProduct)
  end

  def purchase_count
    @purchases.nil? ? 0 : @purchases.count + 1
  end

  def self.customer_purchases_count
    @@customers.each{|x| puts "#{x.name} : #{x.purchase_count}"}
  end

  private

  def add_to_customers

    if Customer.find_by_name(@name).nil?
      @@customers << self
    else raise DuplicateCustomerError, "'#{@name}' already exists."
    end

  end

end
