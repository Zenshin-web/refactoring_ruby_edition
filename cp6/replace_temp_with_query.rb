def price
  base_price * discount_factor
end

def discount_factor
  base_price > 1000 ? 0.95 : 0.98
end

def base_price
  @quantity * @item_price
end
