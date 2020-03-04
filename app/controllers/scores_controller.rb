class ScoresController < ApplicationController
    before_action :authenticate, only: [:index, :show, :create, :destroy]

    def index
        @scores = Score.all
        render json: @scores 
    end

    def show
        @score = Score.find(params[:id])
        render json: @score
    end

    def create
        @score = Score.create(
            user_id: params[:user_id],
            score: params[:score] 
        )

        render json: @score
        #redirect_to "http://localhost.3000/game.html"
    end

    def destroy
        @score = Score.find(params[:id])
        @score.destroy
    end
end
