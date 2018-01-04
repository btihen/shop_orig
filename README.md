[![Build Status](https://travis-ci.org/btihen/shop.svg?branch=master)](https://travis-ci.org/btihen/shop)

# README

## Features

* allows supplier management
* allows product ordering management
* allows product inventory management
* allows bulk/bundled orders (of diverse products)
* allows bulk/bundled sales (for now with override)
* allows sales register tracking (in multiple currencies)
* allows simple sales tax recording (in multiple categories)
* allows sales and order tracking / recommendations
* allows stock value and sales reporting to ownership

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - ruby 2.4.2, rails 5.1.4

* System dependencies - see Gemfile - primarily rails-money (handling money and currency conversion), cocoon (nested forms), axlsx (for reporting)
  - # http://app.forestadmin.com/welcome/btihen@las.ch/install
    # https://github.com/ForestAdmin/forest-rails
  ```ruby
  # Add the liana to your application's Gemfile
  gem 'forest_liana'
  # Bundle it
  bundle install

  # Install it with the environment secret
  rails g forest_liana:install 61b83f7a5284adec9761519ba60e37c6c6b022a1d1280852934560c5ce1b59f2

  # Restart your server
  rails s
  ```
  - #### https://github.com/thoughtbot/administrate/
  - #### https://github.com/activeadmin/activeadmin (has graphs)
  - #### https://github.com/TrestleAdmin/trestle/graphs/contributors
  - #### https://github.com/sferik/rails_admin (upgrade RailsAdmin to 1.1.1)

* Configuration
  - default currency & exchange bank: in *config/initializers/money.rb*
  - https://richonrails.com/articles/currency-validation-in-ruby-on-rails - better money validation (use default money config - otherwise validation error messages stop working):
  ```ruby
  validates :price, :presence => true,
            :numericality => true,
            :format => { :with => /^\d{1,4}(\.\d{0,2})?$/ }
  ```
  This will allow values of up to $9999.99 with an optional decimal place (if the decimal is present, no more than 2 digits must follow.) Tweak as needed.


* Database creation - normal rails way (must use postgres)

* Database initialization - seed database with current suppliers (add inventory & historical data from past years with bulk orders and sales)

* How to run the test suite - rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


#### Tricky Product Bundling


#### HAS MANY THROUGH (best method)

#### https://collectiveidea.com/blog/archives/2015/07/30/bi-directional-and-self-referential-associations-in-rails

**Code to USED TO CREATE this feature:**

```ruby
rails g model Product username:citext oa_id:integer oa_user_role:string oa_record:jsonb oa_sync_date:datetime
rails g model CreateSupplierPackage product:references included_product:references

class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|

      t.string   :product_name
      t.text     :product_added_info
      t.monetize :product_supplier_price
      t.monetize :product_resell_item_price
      t.jsonb    :product_details, null: false, default: '{}'

      t.timestamps
    end
    # https://nandovieira.com/using-postgresql-and-jsonb-with-ruby-on-rails
    add_index :products, :product_details, using: :gin
  end
end

class CreateBundles < ActiveRecord::Migration[5.1]
  def change
    create_table :bundles do |t|
      t.references :bundle,          index: true, foreign_key: true
      t.references :bundled_product, index: true
      t.integer    :bundled_quantity

      t.timestamps null: false
    end

    # add add_foreign_key is a new improvement!
    # https://collectiveidea.com/blog/archives/2015/07/30/bi-directional-and-self-referential-associations-in-rails
    add_foreign_key :bundles, :product,     column: :bundled_product_id
    add_index       :bundles, [:product_id, :bundled_product_id], unique: true
  end
end


class Product < ApplicationRecord

  has_many :bundles

  # doesn't destroy reverse relations
  # has_many :bundled_products, through: :bundles
  # ensures reverse relations are also destroyed
  has_many :bundled_products, through: :bundles, dependent: :destroy do

    def with_bundle_data
      select('products.*, bundles.created_at AS bundle_created_at')
    end

    def count(column_name = :all)
      super
    end
  end

  def bundle_created_at
    #https://stackoverflow.com/questions/23022656/why-cant-i-parse-a-date-string-saved-to-a-variable-in-ruby
    Time.zone.parse(self[:relation_created_at].to_s)   if self[:relation_created_at]
  end

end



class Bundle < ApplicationRecord

  belongs_to :product
  belongs_to :bundled_product, class_name: "Product"

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_bundle_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_bundle_options)
  end

  def inverses
    self.class.where(inverse_bundle_options)
  end

  def inverse_bundle_options
    { bundled_product_id: product_id, product_id: bundled_product_id }
  end

end


# TESTING
# by hand

rails c

Product.create(  )
Product.create(  )
Product.create(  )

it1 = Product.first
it2 = Product.second
bun = Product.last


bun.bundled_products << it1
bun.bundled_products << it2
# bundle should have both items
bun.bundled_products
# ? - maybe nit!
it1.bundled_products

bun.bundled_products.destroy_all

# father should NOT display - works
it1.bundled_products

# son should NOT display - NOT what I expect (when NOT reloaded)
it2.bundled_products
# son should NOT display - NOW - eith reload it works!
it2.reload.bundled_products


# RSPEC TESTING
###############
# https://github.com/shekibobo/user-to-user-example
# file: spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#bundled_products' do
    context 'create bundles' do
      let(:item1)   { FactoryBot.create(:product) }
      let(:item2)   { FactoryBot.create(:product) }
      let(:bundle)  { FactoryBot.create(:bundle) }

      it "adds a product to a bundle" do
        expect(parent.related_persons).to be_empty
        parent.related_persons.replace [child]
        expect(parent.reload.related_persons).to match_array [child]
      end

      it "adds parent to the child's related_persons collection" do
        expect(child.related_persons).to be_empty
        parent.related_persons.replace [child]
        expect(child.reload.related_persons).to match_array [parent]
      end
    end

    context 'when removing users' do
      let(:parent) { FactoryBot.create(:person, related_persons: [child]) }
      let(:child)  { FactoryBot.create(:person) }

      it "removes the child from the parent's related_persons collection" do
        expect(parent.related_persons).to eq [child]
        parent.related_persons.replace []
        expect(parent.reload.related_persons).to be_empty
      end

      it "removes parent from the child's related_persons collection" do
        expect(child.related_persons).to eq [parent]
        parent.related_persons.replace []
        expect(child.reload.related_persons).to be_empty
      end
    end

    describe '.with_relation_data' do
      let!(:parent)   { FactoryBot.create(:person) }
      let!(:child)    { FactoryBot.create(:person) }
      let!(:relation) { FactoryBot.create(:relation, person: parent, related_person: child, created_at: 3.days.ago) }

      let(:related_persons) { parent.related_persons.with_relation_data }

      describe '#relation_created_at' do
        it 'provides access to relation_created_at' do
          expect(related_persons.first.relation_created_at)
            .to be_within(1).of(relation.created_at)
        end

        it 'is a timestamp object' do
          expect(related_persons.first.relation_created_at).to be_a(relation.created_at.class)
        end

        it 'is nil on a user pulled from a different query' do
          expect(Person.find(child.id).relation_created_at).to be_nil
        end

        it 'can still be counted' do
          expect(related_persons.with_relation_data.count).to eq 1
        end
      end
    end
  end
end
```
