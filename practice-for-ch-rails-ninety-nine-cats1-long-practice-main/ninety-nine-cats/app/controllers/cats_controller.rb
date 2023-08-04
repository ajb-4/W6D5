class CatsController < ApplicationController
  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.find(params[:id])
    if @cat.save(params[:id])
      redirect_to cat_url(@cat)
    else
      @cat.errors.full_messages, status: 422
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      @cat.errors.full_messages, status: 422
    end
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def index
    @cats = Cat.all
    render :index
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  private

  def cat_params
    params.require(:cats).permits(:name, :birth_date, :sex, :color)
  end

end
