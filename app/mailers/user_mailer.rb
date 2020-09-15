class UserMailer < ApplicationMailer
  default from: 'Сообщение с сайта Lada-Prime.ru <site@lada-prime.ru>'

  def question_email(message)
    @message = message
    mail(to: 'info@lada-prime.ru,l.raikova@lada-prime.ru,a.grishin@lada-prime.ru', subject: "Сообщение с сайта Lada-Prime.ru <site@lada-prime.ru>" )
  end

  def order_email(message)
    @message = message
    mail(to: 'info@lada-prime.ru,l.raikova@lada-prime.ru,a.grishin@lada-prime.ru', subject: "Сообщение с сайта Lada-Prime.ru <site@lada-prime.ru>" )
  end
  
  def write_email(message)
    @message = message
    mail(to: 'info@lada-prime.ru,l.raikova@lada-prime.ru,a.grishin@lada-prime.ru', subject: "Сообщение с сайта Lada-Prime.ru <site@lada-prime.ru>" )
  end
end
