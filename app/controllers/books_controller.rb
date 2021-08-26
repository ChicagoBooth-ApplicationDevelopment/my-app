class BooksController < ApplicationController

  skip_before_action(:force_user_sign_in, { :only => [:index] })

  def index
    #matching_books = Book.all
    #@list_of_books = matching_books.order({ :created_at => :desc })

    @q = Book.ransack(params[:q])
    @books = @q.result.order({ :created_at => :desc })

    render({ :template => "books/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_books = Book.where({ :id => the_id })
    @the_book = matching_books.at(0)

    @seller = User.where({ :id => @the_book.seller_id}).at(0)
    @seller_first_name = @seller.first_name
    @seller_last_name = @seller.last_name
    @seller_contact = @seller.email
    @seller_alt_contact = @seller.alt_contact_info

    render({ :template => "books/show.html.erb" })
  end

  def add_book_form
    render({ :template => "books/add_book_form.html.erb"})
  end

  def create
    the_book = Book.new
    the_book.title = params.fetch("query_title")
    the_book.author = params.fetch("query_author")
    the_book.isbn = params.fetch("query_isbn")
    the_book.list_price = params.fetch("query_list_price")
    the_book.description = params.fetch("query_description")
    the_book.seller_id = params.fetch("query_seller_id")
    the_book.course_info = params.fetch("query_course_info")
    the_book.cover = params.fetch("query_cover_image", "")

    #what about combinations?
    # if the_book.title.present? == false
    #   redirect_to("/add_book_form" , { :alert => "Missing info: Please enter a book title." })
    # elsif the_book.list_price.present? == false
    #   redirect_to("/add_book_form", { :alert => "Missing info: Please enter a price." })
    # elsif the_book.author.present? == false
    #   redirect_to("/add_book_form", { :alert => "Missing info: Please enter an author." })
    # elsif the_book.valid?
    #   the_book.save
    #   redirect_to("/books", { :notice => "Book created successfully." })
    # else
    #   redirect_to("/books", { :notice => "Book failed to create successfully." })
    # end

    if the_book.valid?
      the_book.save
      redirect_to("/books", { :notice => "Book created successfully." })
    else
      redirect_to("/add_book_form", { :alert => "Error! Please make sure that book image, title, price, and author(s) are filled out!" })
    end
  end

  def edit_book
    the_id = params.fetch("path_id")
    @the_book = Book.where({ :id => the_id }).at(0)
    ##@the_book.cover.cache!

    render({ :template => "books/edit_book_form.html.erb" })
  end

  def update
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    if params.fetch("query_cover_image", "") != ""
    the_book.cover = params.fetch("query_cover_image", "")
    end
    the_book.title = params.fetch("query_title")
    the_book.author = params.fetch("query_author")
    the_book.isbn = params.fetch("query_isbn")
    the_book.list_price = params.fetch("query_list_price")
    the_book.description = params.fetch("query_description")
    the_book.seller_id = params.fetch("query_seller_id")
    the_book.course_info = params.fetch("query_course_info")

    p the_book.cover
    p the_book.list_price

    if the_book.valid?
      the_book.save
      redirect_to("/books/#{the_book.id}", { :notice => "Book updated successfully."} )
    else
      redirect_to("/books/#{the_book.id}", { :alert => "Book update failed!" })
      #the_book.errors.full_messages
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_book = Book.where({ :id => the_id }).at(0)

    the_book.destroy

    redirect_to("/books", { :notice => "Book deleted successfully."} )
  end

  # def seller_name
  #   seller_id = self.seller_id
  #   matching_set = User.where({:id => seller_id})
  #   the_one = matching_set.at(0)
  #   return the_one
  # end

  #belongs_to(:seller, {:class_name => "User", :foreign_key => "seller_id"})


  #belongs_to(:seller, { :required => true, :class_name => "User", :foreign_key => "seller_id" })
  
end
