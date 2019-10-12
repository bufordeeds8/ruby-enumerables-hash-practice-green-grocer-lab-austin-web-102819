def consolidate_cart(cart)
  new_cart = {}
  cart.each do |items_array|
    items_array.each do |item, attribute_hash|
      new_cart[item] ||= attribute_hash
      new_cart[item][:count] ? new_cart[item][:count] += 1 :
      new_cart[item][:count] = 1
  end
end
new_cart
end

def apply_coupons(cart, coupons)

  coupons.each do |coupon|
    coupon.each do |attribute, value|
      name = coupon[:item]

      if cart[name] && cart[name][:count] >= coupon[:num]
        if cart["#{name} W/COUPON"]
          cart["#{name} W/COUPON"][:count] += 1
        else
          cart["#{name} W/COUPON"] = {:price => coupon[:cost],
          :clearance => cart[name][:clearance], :count => 1}
        end

      cart[name][:count] -= coupon[:num]
    end
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
