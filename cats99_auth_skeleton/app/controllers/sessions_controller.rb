class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )

        if @user.nil?
            # render json: 'Credentials are wrong'
            render :new
        else
            session[:session_token] == @user.reset_session_token!
            redirect_to cats_url
        end


    end
    
    def destroy

    end
    
end
