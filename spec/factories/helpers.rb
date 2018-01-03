module FactoryHelpers
  extend self

  def get_tax_category
    # if less than 3 tax categories (make new ones)
    return FactoryBot.create :tax_category      if TaxCategory.count < 3
    # if 3 tax categories - return an exising tax category
    # pp TaxCategory.all.inspect
    # https://ducktypelabs.com/retrieving-random-records-in-rails/
    return TaxCategory.offset( rand(TaxCategory.count) ).first
    # return TaxCategory.all.sample
    # Couldn't find TaxCategory with 'id'=2
    # return TaxCategory.find( rand(1..3) )
    # return TaxCategory.find( rand(1..TaxCategory.count) )
  end

  def get_product_category
    # if less than 5 product categories (make new ones)
    return FactoryBot.create :product_category      if ProductCategory.count < 5
    # if 3 product categories - return an exising product category
    return ProductCategory.find( rand(1..5) )
    # return ProductCategory.find( rand(1..ProductCategory.count) )
  end

  def get_supplier
    # if only one supplier generate and return a new one
    return FactoryBot.create :supplier      if Supplier.count <= 3

    # Generate a random number between 1 and 100
    random_number = rand(1 .. 100)
    # 10% return a random new supplier
    return FactoryBot.create :supplier      if random_number <= 10
    # 90% of the time pick a random existing supplier
    return Supplier.find( rand(1..Supplier.count) )
  end

  def get_product
    # if only one supplier generate and return a new one
    return FactoryBot.create :product       if Product.count <= 3

    # Generate a random number between 1 and 100
    random_number = rand(1 .. 100)
    # 105% return a random new supplier
    return FactoryBot.create :product       if random_number <= 10
    # 90% of the time pick a random existing supplier
    return Product.find( rand(1..Product.count) )
  end

  def get_order
    # if only one supplier generate and return a new one
    return FactoryBot.create :order         if Order.count <= 3

    # Generate a random number between 1 and 100
    random_number = Faker::Number.between(1, 100)
    # 10% return a random new supplier
    return FactoryBot.create :order         if random_number <= 10
    # 90% of the time pick a random existing supplier
    return Order.find( rand(1..Order.count) )
  end

  def get_order_line
    # if only one supplier generate and return a new one
    return FactoryBot.create :order_line    if OrderLine.count <= 3

    # Generate a random number between 1 and 100
    random_number = Faker::Number.between(1, 100)
    # 10% return a random new supplier
    return FactoryBot.create :order_line         if random_number <= 10
    # 90% of the time pick a random existing supplier
    return OrderLine.find( rand(1..OrderLine.count) )
  end

  def get_stock_item
    # if only one supplier generate and return a new one
    return FactoryBot.create :stock_item    if StockItem.count <= 3

    # Generate a random number between 1 and 100
    random_number = Faker::Number.between(1, 100)
    # 10% return a random new supplier
    return FactoryBot.create :stock_item         if random_number <= 10
    # 90% of the time pick a random existing supplier
    return StockItem.find( rand(1..StockItem.count) )
  end

  def get_sale
    # if only one supplier generate and return a new one
    return FactoryBot.create :sale           if Sale.count <= 3

    # Generate a random number between 1 and 100
    random_number = Faker::Number.between(1, 100)
    # 10% return a random new supplier
    return FactoryBot.create :sale         if random_number <= 10
    # 90% of the time pick a random existing supplier
    return Sale.find( rand(1..Sale.count) )
  end

  def get_register
    # if only one supplier generate and return a new one
    return FactoryBot.create :register           if Register.count <= 3

    # Generate a random number between 1 and 100
    random_number = Faker::Number.between(1, 100)
    # 10% return a random new supplier
    return FactoryBot.create :register         if random_number <= 10
    # 90% of the time pick a random existing supplier
    return Register.find( rand(1..Register.count) )
  end

  def get_user
    # if only one supplier generate and return a new one
    return FactoryBot.create :user          if User.count <= 3

    # Generate a random number between 1 and 100
    random_number = Faker::Number.between(1, 100)
    # 10% return a random new supplier
    return FactoryBot.create :user          if random_number <= 10
    # 90% of the time pick a random existing supplier
    user = User.find( rand(1..User.count) )
    # do not return an itadmin user
    while supplier.user_role == "itadmin"
      user = User.find( rand(1..User.count) )
    end
    return user
  end

  def get_cashier
    # if only one supplier generate and return a new one
    return FactoryBot.create :cashier       if User.count <= 3

    # Generate a random number between 1 and 100
    random_number = Faker::Number.between(1, 100)
    # 10% return a random new supplier
    return FactoryBot.create :cashier       if random_number <= 10
    # 90% of the time pick a random existing supplier
    return User.where( user_role: 'cashier' ).sample
    # # do not return an itadmin user
    # while supplier.user_role == "itadmin"
    #   user = User.find( rand(1..User.count) )
    # end
    # return user
  end

  def get_sourcer
    # if only one supplier generate and return a new one
    return FactoryBot.create :sourcer       if User.count <= 3

    # Generate a random number between 1 and 100
    random_number = Faker::Number.between(1, 100)
    # 10% return a random new supplier
    return FactoryBot.create :sourcer       if random_number <= 10
    # 90% of the time pick a random existing supplier
    return User.where( user_role: 'sourcer' ).sample
    # # do not return an itadmin user
    # while supplier.user_role == "itadmin"
    #   user = User.find( rand(1..User.count) )
    # end
    # return user
  end

end
