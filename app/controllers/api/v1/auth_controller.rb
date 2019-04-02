class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create, :show]

    def create
      @user = User.find_by(username: user_login_params[:username])
      if @user && @user.authenticate(user_login_params[:password])
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, jwt: token}
      else
        render json: {error: "Invalid username or password"}, status: 422
      end
    end

    def show
      string = request.authorization
      token = JWT.decode(string, PlantSitterBackend::Application.credentials.secret_key_base)[0]
      id = token["user_id"].to_i
      @user = User.find(id)
      if @user
          user = UserSerializer.new(@user)
          render json: {user: user}
      else
          render json: {error: ''}, status: 422
    end
  end

    private

    def user_login_params
      params.require(:user).permit(:username, :password)
    end
end
