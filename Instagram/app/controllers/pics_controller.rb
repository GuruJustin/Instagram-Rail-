class PicsController < ApplicationController
    before_action :find_pic, only: [:edit, :update, :show, :destroy]

    def index
        @pics = Pic.all()
    end

    def show
    end

    def edit
        if @pic.save
            redirect_to pics_path, notice: "Yes! Successfully saved"
        else
            render 'edit'
        end
    end

    def create
        @pic = Pic.new(pic_params)
        
        if @pic.save
            redirect_to pics_path, notice: "Yes! Successfully saved"
        else
            render 'new'
        end
    end
    
    def new
        @pic = Pic.new
    end

    def destroy
        if @pic.destroy
            redirect_to pic_path, notify: "Yes! Succesfully removed"
        else
            render 'edit'
        end
    end

    private
        def pic_params
            params.require(:pic).permit(:title, :description)
        end

        def find_pic
            @pic = Pic.find(params[:id])
        end
end
