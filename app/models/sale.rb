class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :discount
  has_many :product_quantities
  has_one :comission

  after_save do
    calc = 0
    # Sums up the prices multiplied by their quantity
    self.product_quantities.each {|p| calc += p.product.price * p.quantity}
    # Verify if there is a discount and applies if it exists
    if self.discount
      if self.discount.kind == :percent
        calc -= calc / self.discount.value
      elsif self.discount.kind == :money
        calc -= self.discount.value
      end
    end

    # Verifies if there is a commision if yes it updates if not creates a new one
    if self.comission.present?
      self.comission.update(value: (calc * 0.1), status: :pending)
    else
      Comission.create(value: (calc * 0.1), user: self.user, sale: self, status: :pending)
    end
  end
end