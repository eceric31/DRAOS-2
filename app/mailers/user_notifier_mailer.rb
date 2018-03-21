class UserNotifierMailer < ApplicationMailer
    default :from => 'abhshoes@abh.com'

    def send_signup_email(user)
      @user = user
      mail( to: @user.email,
      subject: 'Thanks for signing up for abhShoes!' )
    end

    def send_purchase_confirmation_email(user, order)
        @user = user
        @order = order
        mail( to: @user.email,
        subject: 'Thank you for your purchase at abhShoes' )
      end
end
