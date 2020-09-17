class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end
    
    def create
        user = User.new(username: user_params['username'], password: user_params['password'])
        if user.save
            payload = {'user_id': user.id}
            token = encode(payload)
            render json: {
                user: UserSerializer.new(user),
                token: token,
                authenticated: true
            }
        else 
            render json: { message: 'There was an error creating your account' }
        end
    end

    def show
        token = request.headers['Authentication'].split(' ')[1]
        payload = decode(token)
        user = User.find(payload['user_id'])
        if user
            render json: UserSerializer.new(user)
        else 
            render json: { message: 'Error', authenticated: false }
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
