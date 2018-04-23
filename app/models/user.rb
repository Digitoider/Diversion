class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable#, :validatable

  validates :login, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true

  validates :email,
                    presence: true,
                    uniqueness: true

  validates :password,
                    presence: true,
                    length: { minimum: 3 }
end
