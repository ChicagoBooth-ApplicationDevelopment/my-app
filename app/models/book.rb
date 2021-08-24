# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  author      :string
#  course_info :text
#  cover       :string
#  description :text
#  isbn        :string
#  list_price  :float
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  seller_id   :integer
#
class Book < ApplicationRecord
    validates :list_price, :presence => true
    validates :title, :presence => true
    validates :author, :presence => true
    validates :cover, :presence => false

    mount_uploader :cover, CoverUploader

    # belong_to :users

    # belongs_to(:seller, { :required => true, :class_name => "User", :foreign_key => "seller_id" })

    # belongs_to(:seller_name, { :class_name => "User", :foreign_key => "seller_id" })
    # def seller_name
    #     seller_id = self.seller_id
    #     matching_set = User.where({:id => seller_id})
    #     the_one = matching_set.at(0)
    #     return the_one
    # end
end
