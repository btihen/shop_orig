# ruby encoding: utf-8

# http://www.xyzpub.com/en/ruby-on-rails/3.2/seed_rb.html

User.destroy_all

user_list = [
  [ "btihen", "Bill Tihen", "itadmin" ],
  [ "gabriela", "Gabriela Grimm", "inventory" ],
  [ "barbara", "Barbara", "source" ],
  [ "bigogna", "Bigogna", "finance" ],
  ["volunter", "Volunter", "cashier"],
]

user_list.each do |username, full_name, user_role |
  User.create(
              username: username,
              full_name: full_name,
              user_role: user_role
             )
end
