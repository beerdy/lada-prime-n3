ActionMailer::Base.default_url_options = { host: 'lada-prime.ru' }
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  address: 'beta-term.avtolip.loc',
  port: 587,
  domain: 'mx.lada-prime.ru',
  authentication: 'plain',
  user_name: 'site@lada-prime.ru',
  password: Rails.application.secrets.mail
}