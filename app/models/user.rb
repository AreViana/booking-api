class User < ApplicationRecord
  has_secure_password
  has_secure_token

  enum role: {
    admin: 'admin',
    user: 'user',
  }
end
