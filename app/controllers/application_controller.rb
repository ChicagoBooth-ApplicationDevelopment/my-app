class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment this if you want to force users to sign in before any other actions
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  def homepage
    @list_of_books = Book.all.order({ :created_at => :desc })

    # @booklist_5 = Array.new
    # for i in 0...5 do
    #   @booklist_5 = @booklist_5 + @list_of_books.at(i).to_a
    # end
    @booklist_6 = @list_of_books.at(0...6)

    render({ :template => "misc/homepage.html.erb" })
  end

end
