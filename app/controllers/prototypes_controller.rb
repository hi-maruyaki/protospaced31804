class PrototypesController < ApplicationController
  def index
    @prototype = Prototype.new
    @prototypes = Prototype.includes(:user)
  end

  before_action :authenticate_user!, only: :new
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end
  

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end



  def edit  
    @prototype = Prototype.find(params[:id])
    if user_signed_in? && current_user.id == @prototype.user_id
      @prototype = Prototype.find(params[:id])
    else
      redirect_to prototype_path(@prototype.id)
    end
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
      if @prototype.save
        redirect_to prototype_path(@prototype.id)
      else
        render :edit
      end
  end


  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    if prototype.destroy
      redirect_to root_path
    else
    end
  end
  

  private
  def prototype_params
      params.require(:prototype).permit(:concept, :catch_copy, :title, :image).merge(user_id: current_user.id)
  end

end

