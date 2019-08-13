def price
  # price is base price - quantity discount + shipping
  base_price = @quantity * @item_price
  quantity_discount = [0, @quantity - 500].max * @item_price * 0.05
  return base_price -
      [quantity_discount +
      [base_price * 0.1, 100.0].min
end
