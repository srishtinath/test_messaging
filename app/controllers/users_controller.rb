class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized, only: [:stay_logged_in]

    
    def index
        @users = User.all
        render :json => @users
    end
    
    # def new
    
    # end
    
    def create
        @user = User.create(user_params)
        ClueList.create(user: @user)
        if @user.valid?
            wristband = encode_token({user_id: @user.id})
            render json: {
                user: UserSerializer.new(@user),
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
            render json: {user: UserSerializer.new(@user), token: wristband}
        elsif @user && !@user.authenticate(params[:password])
            render json: {message: "Incorrect password"}
        else
            render json: {message: "User not found"}
        end
    end

    def stay_logged_in
        wristband = encode_token({user_id: @user.id})
        render json: {user: UserSerializer.new(@user), token: wristband}
    end
    
    
    def wrongGuess
        @user = User.find(params[:user_id])
        UserRoom.where(user_id: @user.id).destroy_all
        render json: {message: "All user rooms have been removed"}
    end

    def show
        @user = User.find(params[:id])
        render :json => @user
    end
    
    # def destroy
    
    # end
    private

    def user_params
        params.permit(:username, :password)
    end
end
