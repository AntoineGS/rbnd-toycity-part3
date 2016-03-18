class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def find_by_title

  end

  def in_stock?
    @stock > 0
  end

  def in_stock
    #returns all products with in_stock == true
  end

  private

  def add_to_products

    @@products << self
  end

end
