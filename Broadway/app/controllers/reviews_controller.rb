class ReviewsController < ApplicationController
    before_action :find_play, only: [:new, :create]

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)

        @review.user_id = current_user.id
        @review.play_id = @play.id

        if @review.save
            redirect_to play_path(@play)
        else
            render 'new'
        end
    end

    def destroy
        @review.destroy
        redirect_back(fallback_location: root_path) 
    end

    private 
        def review_params
            params.require(:review).permit(:rating, :comment)
        end

        def find_play
            @play = Play.find(params[:play_id])
        end
end
