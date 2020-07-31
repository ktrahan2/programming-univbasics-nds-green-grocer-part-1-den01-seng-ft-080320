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
