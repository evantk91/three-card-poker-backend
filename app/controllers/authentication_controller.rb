class AuthenticationController < ApplicationController
    def login
        #look up the user
        @user = User.find_by( username: params[:username] )

        #authenticate the username
        if !@user
            render status: :unauthorized
        else
            #authenticate the password
            if !@user.authenticate(params[:password])
                render status: :unauthorized
            else
                secret = Rails.application.secret_key_base
                payload = { user_id: @user.id }
                #create token
                token = JWT.encode(payload, secret) 

                render json: { token: token }
            end
        end
    end
end
