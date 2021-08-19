class GeneralController < ApplicationController

    def homepage
        render({ :template => "misc/homepage.html.erb" })
    end
    
end