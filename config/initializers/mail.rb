ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app2181483@heroku.com'],
  :password       => ENV['@##csa3141598'],
  :domain         => 'uhpartments.com'
}
ActionMailer::Base.delivery_method = :smtp