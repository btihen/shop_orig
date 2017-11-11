module FactoryHelpers
  extend self

  ROLES = %w[itadmin owner manager cachier user]

  def get_supplier
    random_number = rand(1 .. 100)
    # random_number = Faker::Number.between(1, 100)

    # if only one supplier generate and return a new one
    return FactoryBot.create :supplier     if Supplier.count <= 3

    # 25% return a random new supplier
    return FactoryBot.create :supplier     if random_number > 75

    # 75% of the time pick a random existing supplier
    # pick_id  = rand(Supplier.count) # this is wrong includes zero -
    #            there is no zeroth record (use 1..n)
    return Supplier.find( rand(1..Supplier.count) )
    # why offset -- can be sure with 1..n that the id will exist
    # return Supplier.offset( rand(1..Supplier.count) ).first
  end

  # # TODO: refactor random number calculations
  def get_user
    random_number = Faker::Number.between(1, 100)

    # if only one supplier generate and return a new one
    return FactoryBot.create :user     if User.count <= 4

    # 25% return a random new supplier
    return FactoryBot.create :user     if random_number > 75

    # 75% of the time pick a random existing supplier
    user = User.find( rand(1..Supplier.count) )
    # do not return managing organisation
    while supplier.user_name == "CMB4"
      user = User.find( rand(1..Supplier.count) )
    end
    return user
  end

end
