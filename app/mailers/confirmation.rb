class Confirmation < ActionMailer::Base  
  default from: "Upartments@uhpartments.com"
  
   def welcome(subscription)
      @chargedate = (Date.today + 30.days).to_formatted_s(:long_ordinal)
      userid = subscription.user_id
      @user = User.find_by_id(userid)
      mail(:to => @user.email, :subject => "Welcome to Uhpartments - Subscription Confirmation")
    end
end
