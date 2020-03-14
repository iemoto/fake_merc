# json.set! :categories do
  json.array! @categories do |category|
    json.extract! category, :id, :name, :ancestry
  end
# end