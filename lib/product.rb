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

  def self.all
    @@products
  end

  def self.find_by_title(aTitle)
    @@products.find{|x| x.title == aTitle}
  end

  def in_stock?
    @stock > 0
  end

  def self.in_stock
    @@inStock = @@products.select{|x| x.in_stock?}
  end

  def sale
    @stock -= 1
  end

  private

  def add_to_products
    if Product.find_by_title(@title).nil?
      @@products << self
    else raise DuplicateProductError, "'#{@title}' already exists."
    end
  end

end
