require 'pry'


def find_item_by_name_in_collection(name, collection)
  answer = nil
  collection.each do |hashes|
    if name == hashes[:item]
      answer = hashes
    end
  end
  return answer
end



def consolidate_cart(cart)
  new_cart = []
  counter = 0
  while counter < cart.length
    new_cart_item = find_item_by_name_in_collection(cart[counter][:item], new_cart)
    if new_cart_item
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        :item => cart[counter][:item],
        :price => cart[counter][:price],
        :clearance => cart[counter][:clearance],
        :count => 1
      }
    counter += 1
  end
end

#return [{:item => "avacado", :price => "3.00", :clearance => "true/false", :count=> "3"}]
# item: {:item => "avacado", :price => "3.00", :clearance => "true/false", :count=> "3"}


  new_cart = []
  cart.each do |items_hash|
    i = 0
    found_item = find_item_by_name_in_collection(items_hash[:item], new_cart)
    while i < new_cart.length do
      found_item = find_item_by_name_in_collection(items_hash[:item], new_cart)
      if found_item
        found_item[:count] += 1
        binding.pry
      else
        found_item[:count] = 1
        new_cart << found_item
      end
      i =+ 1
    end
  end
  return new_cart
end

# found_item = find_item_by_name_in_collection(items_array[:item], new_cart)
#         if found_item
#           found_item[:count] += 1
#           binding.pry
