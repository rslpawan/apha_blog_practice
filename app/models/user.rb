class User < ApplicationRecord 
    before_save {self.email = email.downcase}
    has_many :articles   
    validates :username, presence: true,
                        length: { minimum: 3, maximum: 20 },
                        uniqueness: { case_sensitive: false }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    validates :email, presence: true,
                    length: { minimum: 3, maximum: 20 },
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX

    has_secure_password
    
end