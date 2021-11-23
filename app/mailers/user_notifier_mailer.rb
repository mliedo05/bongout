class UserNotifierMailer < ApplicationMailer
    default :from => 'mliendo05@gmail.com'

    def send_signup_email(user,order)
      @user = user
      @order = order
      mail( :to => @user.email,
      :subject => "¡Gracias por tu compra #{user.name}!" )
    end
end