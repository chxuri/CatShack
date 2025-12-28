class CatsController < ApplicationController
  before_action :set_cat, only: %i[ show edit update destroy ]
  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to @cat
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      redirect_to @cat
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cat.destroy
    redirect_to cats_path
  end

  private
    def set_cat
      @cat = Cat.find(params[:id])
    end
    def cat_params
      params.expect(cat: [ :name ])
    end
end
