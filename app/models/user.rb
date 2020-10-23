class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true,
                  length: {minimum:2, maximum:20} 
  validates :introduction, length: {maximum:50}
  validates :email, presence: true, on: :sign_up # only signup
  validates :password, presence: true, on: :sign_up #only signup
  
  attachment :profile_image
  
  has_many :books, dependent: :destroy
end
