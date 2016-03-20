class Customer
  attr_reader :name
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

  private

  def add_to_customers
    if Customer.find_by_name(@name).nil?
      @@customers << self
    else raise DuplicateCustomerError, "'#{@name}' already exists."
    end
  end

end
