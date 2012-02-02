class Confirmation < ActionMailer::Base  
  default from: "clients@uhpartments.com"
  
   def welcome_email(subscription)
      userid = subscription.user_id
      user = User.find_by_id(userid)
      mail(:to => user.email, :subject => "Welcome to Uhpartments - Subscription Confirmation")
    end
end
