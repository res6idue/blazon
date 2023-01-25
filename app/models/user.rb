class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blazos
  has_many :relationships
  # https://web.sfc.keio.ac.jp/~hattori/script-lang/image.html#active-storageを参考にした
  has_one_attached :profile_pic
  
  attr_accessor :following, :followers, :followings
end
