class ImgsController < ApplicationController
  def edit
    @img = Img.find(params[:id])
  end

  def index
    @imgs = Img.all
  end

  def new
    @img = Img.new
  end

  def show
    @img = Img.find(params[:id])
  end
end
