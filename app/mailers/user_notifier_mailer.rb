class UserNotifierMailer < ApplicationMailer
    default :from => 'eds@eds.com'

    def send_signup_email(user)
      @user = user
      mail( to: @user.email,
      subject: 'Thanks for signing up for Eds Kingdom!' )
    end

    def send_purchase_confirmation_email(user, order)
        @user = user
        @order = order
        mail( to: @user.email,
        subject: 'Thank you for your purchase at Eds Kingdom' )
      end
end
