# Preview all emails at http://localhost:3000/rails/mailers/listing_mailer
class ListingMailerPreview < ActionMailer::Preview
  def listing_mail
    ListingMailer.listing_mail
  end
end