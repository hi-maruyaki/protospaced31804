class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validatable :name, presence: true
  validatable :profile, presence: true
  validatable :occupation, presence: true
  validatable :position, presence: true
end
