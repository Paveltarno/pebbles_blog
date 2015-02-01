# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  password_digest :string
#  sign_in_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

end
