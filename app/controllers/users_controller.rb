class UsersController < ApplicationController
    def sign_up_form
        render({ :template => "user_templates/sign_up.html.erb" })
    end

    def new_user_signup
        # user = User.new

        # user.username = params.fetch("input_username")
        # user.password = params.fetch("input_password")
        # user.password_confirmation = params.fetch("input_password_confirmation")
    
        # save_status = user.save
    
        # if save_status == true
        #   session.store(:user_id, user.id)
    
        #   redirect_to("/users/#{user.username}", { :notice => "Welcome, " + user.username + "!" })
        # else
        #   redirect_to("/user_sign_up", { :alert => user.errors.full_messages.to_sentence })
        # end
    end

end