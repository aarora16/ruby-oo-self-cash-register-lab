require 'pry'
class CashRegister
  attr_accessor :total

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def discount
    @discount
  end

  def add_item(item, price, quantity = 0)
    item_identifier(item, quantity)
    get_last_price(price, quantity)
    if quantity != 0
      @total += price * quantity
    else
      @total += price
    end
  end

  def item_identifier(item, quantity)
    if quantity != 0
      @items.concat([item] * quantity)
    else
      @items << item
    end
  end

  def get_last_price(price, quantity)
    @last_price = 0
    if quantity != 0
      @last_price = price * quantity
    else
      @last_price = price
    end
  end

  def apply_discount
    if @discount != 0
      discount = 1 - @discount.to_f / 100
      @total *= discount
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_price
  end 
end
