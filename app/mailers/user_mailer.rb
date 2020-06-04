class UserMailer < ApplicationMailer
  default from: 'Сообщение с сайта SolidCreators <solidcreators@yandex.ru>'

  def question_email(message)
    @message = message
    mail(to: 'solidcreators@yandex.ru', subject: "Сообщение с сайта SolidCreators <solidcreators@yandex.ru>" )
  end

  def order_email(message)
    @message = message
    mail(to: 'solidcreators@yandex.ru>', subject: "Сообщение с сайта SolidCreators <solidcreators@yandex.ru>>" )
  end
end
