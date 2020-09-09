class UsersController < ApplicationController
    # skip_before_action :verify_authenticity_token
    before_action :authorized, only: [:stay_logged_in]

    
    def index
        @users = User.all
        render :json => @users
    end
    
    def create
        @user = User.create(user_params)
        if @user.valid?
            wristband = encode_token({user_id: @user.id})
            render json: {
                user: @user,
                token: wristband
            }
        else
            render json: {message: "Failed to create a new user"}, status: 403
        end
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            # byebug
            wristband = encode_token({user_id: @user.id})
            render json: {user: @user, token: wristband}
        elsif @user && !@user.authenticate(params[:password])
            render json: {message: "Incorrect password"}
        else
            render json: {message: "User not found"}
        end
    end

    def stay_logged_in
        wristband = encode_token({user_id: @user.id})
        render json: {user: @user, token: wristband}
    end
    
    

    def show
        @user = User.find(params[:id])
        render :json => @user
    end
    
    private

    def user_params
        params.permit(:username, :password)
    end
end
