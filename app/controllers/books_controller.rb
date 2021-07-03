class BooksController < ApplicationController
  
  def new
   
  end
  def create
    
  end
  
  def index
   
  end
  
  def show
  
  end
  
  def edit
    @model_class_name = ModelClassName.find(params[:id])
  end 
  
  def update

  end
  
  def destroy
  end
  
end
