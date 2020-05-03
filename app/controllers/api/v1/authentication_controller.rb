class Api::V1::AuthenticationController < ApplicationController
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
                @scores = Score.all.map do |score|
                    {
                        score: score.score,
                        user_id: score.user_id,
                        username: score.user.username
                    }
                end

                render json: { token: token, user_id: @user.id, scores: @scores }
            end
        end
    end
end
