class Product
  attr_reader :title, :price, :stock

  @@products = []
  @@inStock = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all #Returns all product objects
    @@products
  end

  def self.find_by_title(aTitle) #returns product object with matching title (unique thus we can use it to search knowing it will return only 1 object)
    @@products.find{|x| x.title == aTitle}
  end

  def in_stock? #Returns true if stock > 0
    @stock > 0
  end

  def self.in_stock #Returns an array of all products with stock>0
    @@inStock = @@products.select{|x| x.in_stock?}
  end

  def sale #Reduces inventory by 1 for each sale (assumes a sale of qty of 1)
    raise OutOfStockError, "'#{@title}' is out of stock." unless (@stock -= 1) > 0
  end

  def purchase(aQty) #Feature 2/2
    @stock += aQty
  end


  private

  def add_to_products #adds product to products array and validates title is unique
    if Product.find_by_title(@title).nil?
      @@products << self
    else raise DuplicateProductError, "'#{@title}' already exists."
    end
  end

end
