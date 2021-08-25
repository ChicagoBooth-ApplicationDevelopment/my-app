desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
    User.destroy_all
    Book.destroy_all

    require 'faker'

    #  alt_contact_info :text
    #  email            :string
    #  first_name       :string
    #  last_name        :string

    10.times do
        user = User.new
        user.alt_contact_info = Faker::PhoneNumber.phone_number
        user.first_name = Faker::Name.first_name
        user.last_name = Faker::Name.last_name
        user.email = "#{user.first_name}@email.com"
        user.password = "password" 

        user.save
        p user.errors.full_messages
    end

    users = User.all

    p "You have #{User.count} users."
    p "Login user = #{users.sample.email}"


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

    20.times do
        book = Book.new
        book.author = Faker::Book.author
        book.course_info = Faker::Book.genre
        book.cover = open(Faker::Avatar.image)
        #p Faker::Avatar.image
        #p book.cover
        book.description = Faker::Book.publisher
        book.isbn = rand.to_s[2..14]
        book.list_price = rand(0.00 ... 399.99).round(2)
        book.title = Faker::Book.title
        book.seller_id = users.sample.id

        book.save
        p book.errors.full_messages
    end

    p "You have #{Book.count} books."
end
