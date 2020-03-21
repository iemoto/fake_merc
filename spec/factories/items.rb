FactoryBot.define do
  factory :item do
    name { 'MyString' }
    description { 'MyString' }
    money 1000
    soldout false
    prefecture_address_id 1
    category_id 1
    item_condition_id 1
    shipping_fee_id 1
    shipping_method_id 1
    ship_date_id 1
    # brand_id 1
    size_id 1
    exhibition 1
    during_transaction 1
  end
end
