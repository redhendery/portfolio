class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :message

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :message, presence: true, length: { minimum: 10 }

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => 'Contact from completed from your silly Latin Blog',
      :to => 'redhendery@gmail.com',
      :from => %("#{name}" <#{email}>)
    }
  end
end
