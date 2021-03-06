class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, class_name: "Booking", foreign_key: "customer_id"
  has_many :experiences, class_name: "Experience", foreign_key: "host_id"
  has_many :favorites, class_name: "Favorite", foreign_key: "customer_id"
  has_many :guest_bookings

  has_one_attached :photo, dependent: :destroy
end
