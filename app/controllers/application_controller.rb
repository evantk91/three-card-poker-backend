class ApplicationController < ActionController::API
    def authenticate
        #grab token
        token = request.headers['Authorization'].split(' ')[1]

        if !token
            render json: { message: "no token, braddah" }, status: :unauthorized
        else
            #get secret
            secret = Rails.application.secret_key_base
            #get payload, throw error if fails
            begin
                payload = JWT.decode(token, secret)[0]
                @user = User.find(payload["user_id"])
            rescue
                render json: { message: "couldn't decode it braddah"}, status: :unauthorized
            end
        end
    end
end
