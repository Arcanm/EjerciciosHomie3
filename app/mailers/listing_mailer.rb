class ListingMailer < ApplicationMailer
  layout 'listings_mailer_layout'
  def listing_mail
    mail(to: 'anmac96@hotmail.com', subject: 'Continuar proceso')
  end
end