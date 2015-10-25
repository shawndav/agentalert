class User < ActiveRecord::Base
  after_create :test_number

  validates_presence_of :name
  validates_presence_of :email,:on => :create
  validates_presence_of :phone_number
  validates_format_of :phone_number, with: /\d{10}/, message: 'Incorrect Number Format.'
  validates_presence_of :panic_word
  validates_presence_of :password,:on => :create

  has_many :contacts
  has_many :notifications

  has_secure_password

  def test_number
    Interface.text_new_user(self.name,self.phone_number)
  end

end
