class PicsController < ApplicationController
    before_action :find_pic, only: [:edit, :update, :show, :destroy, :upvote]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @pics = Pic.all()
    end

    def show
    end

    
    def new
        @pic = current_user.pic.build
    end
    
    def create
        @pic = current_user.pic.build(pic_params)
        
        if @pic.save
            redirect_to root_path, notice: "Yes! Successfully saved"
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @pic.update(pic_params)
            redirect_to root_path, notice: "Yes! Successfully saved"
        else
            render 'edit'
        end
    end

    def upvote
        @pic.upvote_by current_user
        redirect_back(fallback_location: root_path)
    end
    

    def destroy
        @pic.destroy
        redirect_to root_path, notice: "Yes! Succesfully removed"
    end

    private
        def pic_params
            params.require(:pic).permit(:title, :description, :image)
        end

        def find_pic
            @pic = Pic.find(params[:id])
        end
end
