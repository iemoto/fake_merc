FactoryBot.define do
  factory :sell_item do
    sell_item_id 1
    user_id nil
    item_id nil
    delibery_for false
    arrival_to false
    commition_fee 1
    name { 'MyString' }
    description { 'MyString' }
    money 1
    soldout false
    prefecture_address_id 1
    category_id 1
    item_condition_id 1
    shipping_fee_id 1
    shipping_method_id 1
    ship_date_id 1
    brand_id 1
    size_id 1
    exhibition 1
    during_transaction 1
  end
end
