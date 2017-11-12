module FactoryHelpers
  extend self

  ROLES = %w[itadmin owner manager cachier user]

  def get_supplier
    random_number = rand(1 .. 100)

    # if only one supplier generate and return a new one
    return FactoryBot.create :supplier     if Supplier.count <= 3

    # 25% return a random new supplier
    return FactoryBot.create :supplier     if random_number > 75

    # 75% of the time pick a random existing supplier
    return Supplier.find( rand(1..Supplier.count) )
  end

  def get_product
    random_number = rand(1 .. 100)

    # if only one supplier generate and return a new one
    return FactoryBot.create :product     if Product.count <= 3

    # 25% return a random new supplier
    return FactoryBot.create :product     if random_number > 75

    # 75% of the time pick a random existing supplier
    return Product.find( rand(1..Product.count) )
  end

  def get_user
    random_number = Faker::Number.between(1, 100)

    # if only one supplier generate and return a new one
    return FactoryBot.create :user     if User.count <= 4

    # 25% return a random new supplier
    return FactoryBot.create :user     if random_number > 75

    # 75% of the time pick a random existing supplier
    user = User.find( rand(1..User.count) )
    # do not return an itadmin user
    while supplier.role == "itadmin"
      user = User.find( rand(1..User.count) )
    end
    return user
  end

end
