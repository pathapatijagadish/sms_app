class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :problems,:dependent => :destroy
  has_many :questions,:dependent => :destroy
  has_many :ideas,:dependent => :destroy
  has_many :praises,:dependent => :destroy
  has_many :comments,:dependent => :destroy
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name,:mobile_number,:image
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "15x15>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
