class UsersController < ApplicationController
    def new 
        @user = User.new 
    end
    
    def index
        @users = User.all
    end  
end
