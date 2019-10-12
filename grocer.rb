require 'pry'

cartArr = [
{"AVOCADO" => {:price => 3.00, :clearance => true}},
{"AVOCADO" => {:price => 3.00, :clearance => true}},
{"AVOCADO" => {:price => 3.00, :clearance => true}},
{"KALE" => {:price => 3.00, :clearance => false}},
{"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
{"ALMONDS" => {:price => 9.00, :clearance => false}},]

def consolidate_cart(cart)
  cart_hash = {}

  cart.each do |item_hash|
    item_name = item_hash.keys[0]
    item_attr = item_hash.values[0]
    if cart_hash[item_name]
      cart_hash[item_name][:count] += 1
    else
      item_attr[:count] = 1
      cart_hash[item_name] = item_attr
    end
  end
  return cart_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
    if cart.has_key?(item)
       if cart[item][:count] >= coupon[:num] && !cart.has_key?(["#{item} W/COUPON"])
        cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[:item][:clearance], count: coupon[:num]}
    elsif cart[item][:count] >= coupon[:num] && cart.has_key?(["#{item} W/COUPON"])
      cart["#{item} W/COUPON"][:count] += coupon[:num]
      end
      cart[item][:count] -= coupon[:num]
    end
  end
    cart
end

# def apply_coupons(cart, coupons)
#   coupons.each do |coupon|
#     item_name = coupon[:item] # "AVOCADO"
#
#     if cart.key?(item_name)
#       if cart[item_name][:count] >= coupon[:num]
#         # vars
#         new_price = coupon[:cost] / coupon[:num]
#
#         # actions
#         cart[item_name][:count] -= coupon[:num]
#         cart["#{item_name} W/COUPON"] = {:price=>new_price,:clearance=>cart[item_name][:clearance], :count=>coupon[:num]}
#       end
#       p cart
#     end
#   end
# end

# apply_coupons(consolidate_cart(cartArr), [{:item => "AVOCADO", :num => 2, :cost => 5.00}])

# consolidated_cart = {
#   "AVOCADO"=> {
#     :price=>3.0,
#     :clearance=>true,
#     :count=>0
#   },
#   "KALE"=> {
#     :price=>3.0,
#     :clearance=>false,
#     :count=>1
#   },
#   "BLACK_BEANS"=> {
#     :price=>2.5,
#     :clearance=>false,
#     :count=>1
#   },
#   "ALMONDS"=> {
#     :price=>9.0,
#     :clearance=>false,
#     :count=>1
#   }
# }


def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
