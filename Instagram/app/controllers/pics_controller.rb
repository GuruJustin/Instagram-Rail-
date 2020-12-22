class PicsController < ApplicationController
    before_action :find_pic, only: [:edit, :update, :show, :destroy]

    def index
        @pics = Pic.all()
    end

    def show
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

    def create
        @pic = Pic.new(pic_params)
        
        if @pic.save
            redirect_to root_path, notice: "Yes! Successfully saved"
        else
            render 'new'
        end
    end
    
    def new
        @pic = Pic.new
    end

    def destroy
        @pic.destroy
        redirect_to root_path, notice: "Yes! Succesfully removed"
    end

    private
        def pic_params
            params.require(:pic).permit(:title, :description)
        end

        def find_pic
            @pic = Pic.find(params[:id])
        end
end
