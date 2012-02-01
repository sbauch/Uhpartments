class PagesController < ApplicationController
  require "twiliolib.rb"

  # your Twilio authentication credentials
  ACCOUNT_SID = 'AC549014803ae3473b901df389d252afac'
  ACCOUNT_TOKEN = '51b1dcb95e7634b58c2a066d0563a270'

  # version of the Twilio REST API to use - do not change
  API_VERSION = '2010-04-01'

  # Sandbox phone number
  # or Outgoing Caller ID you have purchased through Twilio
  CALLER_ID = "646-448-8598"

  #CALLER_PIN only needed to send using sandbox number. Looks like 9999-9999
  #CALLER_PIN = "4492-8049"
  
  def twilio
   @number = params[:phone_number]
    
    #Text message info
    t = {
     
      'From' => CALLER_ID,
      'To' => @number,
      'Body' => ("Visit uhpartments.com when you walk through an apartment")
    }

    begin
      account = Twilio::RestAccount.new(ACCOUNT_SID, ACCOUNT_TOKEN)
      resp = account.request("/#{API_VERSION}/Accounts/#{ACCOUNT_SID}/SMS/Messages",
                 'POST',
                 t)
      resp.error! unless resp.kind_of? Net::HTTPSuccess
    rescue StandardError => bang
      #This area will be called if an error happens with the Twilio API
      flash[:alert] = "Bad number."
      redirect_to({ :action => :home })
      
      return
    end

    redirect_to({ :action => :home, :alert => "SMS sent." })
  end
  
  def home
    if user_signed_in? 
      redirect_to "/brokers" 
      end
    
  end

  def about
  end

  def how
  end
  
  def brokers
  
  
  end 
end
