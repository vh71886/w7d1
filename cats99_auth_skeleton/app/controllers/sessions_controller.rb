class SessionsController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:destroy]

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
            login(@user)
            redirect_to cats_url
        end


    end
    
    def destroy
        @current_user.reset_session_token! if self.current_user
        session[:session_token] = nil
        @current_user = nil
        redirect_to cats_url
    end
    
end
