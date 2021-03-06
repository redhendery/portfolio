class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :message
  attribute :ham_sandwich

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :message, presence: true, length: { minimum: 10 }

  def headers
    {
      subject: 'Contact from completed from your Portfolio',
      to: 'redhendery@gmail.com',
      from: %("#{name}" <#{email}>)
    }
  end
end
