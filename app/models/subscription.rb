class Subscription < ActiveRecord::Base
  belongs_to :user
  
  attr_accessor :stripe_card_token
  attr_accessible :stripe_card_token, :user_id
  
def save_with_payment
    if valid?
      email = User.where(:id => user_id)[0]['email']
      customer = Stripe::Customer.create(description: user_id, email: email,  plan: 1, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end  