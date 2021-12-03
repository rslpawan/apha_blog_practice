class CategoriesController < ApplicationController

    def new
        @category = Category.new
        @categories_list = Category.all
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category #{@category.name} created!"
            redirect_to articles_path
        else
            render "new"
        end
    end
    
    private

    def category_params
        params.require(:category).permit(:name)
    end

end