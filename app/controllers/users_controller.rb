class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user, include: [:scores]
    end

    def create
        @user = User.new(
            username: params[:username],
            password: params[:password]
        )

        if @user.save
            render json: @user, status: :created
        else
            render json: {error: "password needs to be 5 characters or more"}, status: :bad_request
        end
    end
end
