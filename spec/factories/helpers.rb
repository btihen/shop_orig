module FactoryHelpers
  extend self

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
    while supplier.role == "itadmin"
      user = User.find( rand(1..User.count) )
    end
    return user
  end

end
