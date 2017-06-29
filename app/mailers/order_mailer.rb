class OrderMailer < ApplicationMailer
  def confirm_order order, user
    @order = order
    @user = user
    mail to: @user.email
  end
end
