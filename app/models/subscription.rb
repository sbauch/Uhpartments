class Subscription < ActiveRecord::Base
  belongs_to :user
  
  attr_accessor :stripe_card_token
  attr_accessible :stripe_card_token, :user_id
  
def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: user_id, plan: 1, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end  