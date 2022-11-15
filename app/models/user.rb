class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, dependent: :destroy, foreign_key: 'user_id', class_name: 'Group'
  has_many :payments, dependent: :destroy

  # validates

  validates :name , presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }

end
