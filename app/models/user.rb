class User < ActiveRecord::Base 
  
  attr_accessible :email, :lastname, :name, :password, :password_confirmation, :email_confirmation, :score, :typeof
  attr_accessor :password_confirmation, :email_confirmation

  has_many :hints

  USER_TYPE = {
                ADMIN: {id: 1, name: 'Administrator'},
                PLAYER: {id: 2, name: 'Regular User'}                
              }

  validates :name, :presence => true
  validates :lastname, :presence => true

  validates :email, :presence => true, :uniqueness => true
  

  validates :email_confirmation, :presence => true
  
  validates :password, :presence => true, :length => { :in => 4..20 }
  validates :password_confirmation, :presence => true, on: :create

  validate :validatePassword, :reduce => true, on: :create
  validate :validateEmail

  def validatePassword
    if new_record? && !password.eql?(password_confirmation)
      errors.add(:password, ' e confirmacao devem ser iguais')
    end
  end
 
 def validateEmail
    if !email.eql?(email_confirmation)
      errors.add(:email, ' e confirmacao devem ser iguais')
    end
 end

 def self.authenticate email, password
    
    return false if email.nil?
    return false if password.nil?

    if !email.index('@').nil?
      user = User.find_by_email(email)
    end

    user && password.eql?(user.password) ? user : nil
  end
  
end
