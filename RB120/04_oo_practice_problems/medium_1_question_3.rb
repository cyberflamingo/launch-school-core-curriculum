class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end
end

=begin
The proposed solution by Alyssa is to change `attr_reader` to `attr_accessor`
and change `quantity` to `self.quantity`. While it works, it makes
`product_name` writtable for everyone. This is probably not wanted and we had
better define the accessors like this:
  attr_reader :product_name
  attr_accessor :quantity

Even better, we should put the two accessors behind `private` to make it
accessible only by the object methods.
=end
