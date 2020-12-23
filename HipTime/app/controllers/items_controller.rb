class ItemsController < ApplicationController
    before_action :find_item, only: [:edit, :update, :show, :destroy, :complete]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        if user_signed_in?
            @items = current_user.items.all.order('created_at DESC')
        end
    end

    def new
        @item = current_user.items.build
    end

    def create
        @item = current_user.items.build(item_params)

        if @item.save
            redirect_to @item
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @item.update(item_params)
            redirect_to item_path, notice: "Removed Successfully"
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @item.destroy
        redirect_to root_path, notice: "Removed Successfully"
    end

    def complete
        @item = Item.find(params[:id])
        @item.update_attribute(:completed_at, Time.now)
        redirect_to root_path
    end

    private
        def item_params
            @item = params.require(:item).permit(:title, :description)
        end

        def find_item
            @item = Item.find(params[:id])
        end
end
