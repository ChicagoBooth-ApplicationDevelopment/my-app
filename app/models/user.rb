# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  alt_contact_info :text
#  email            :string
#  first_name       :string
#  last_name        :string
#  password_digest  :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  # has_many :books

  # validates(:alt_contact_info, { :uniqueness => { :allow_blank => true } })

  has_many(:books, { :class_name => "Book", :foreign_key => "seller_id", :dependent => :destroy })

end
