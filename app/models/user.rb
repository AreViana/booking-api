class User < ApplicationRecord
  has_secure_password

  enum role: {
    admin: 'admin',
    user: 'user',
  }
end
