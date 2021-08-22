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
    mount_uploader :cover, CoverUploader
end
