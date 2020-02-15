FactoryBot.define do
  factory :sell_item do
    name "MyString"
    despriction "MyString"
    money 1
    sold_out false
    prefecture_address_id nil
    categorie_id nil
    item_condition_id nil
    shippong_fee_id nil
    shipping_fee_side nil
    shipping_method_id nil
    ship_date_id nil
    brand_id nil
    size_id nil
  end
end
