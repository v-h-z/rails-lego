require 'open-uri'

class GamesetsController < ApplicationController
  before_action :find_gameset, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: :index
  def index
    @gamesets = Gameset.all
  end

  def show
  end

  def new
    @gameset = Gameset.new
  end

  def create
    @gameset = Gameset.new(gameset_params)
    url = "https://brickset.com//api/v3.asmx/getSets?apiKey=3-qokZ-lzv7-6HvfX&userHash=gXue3LT9UC&params={'setNumber':'#{@gameset.ref}'}"
    lego = JSON.parse(open(url).read)
    render :new and return if lego["sets"].empty?

    @gameset.name = lego["sets"].first["name"]
    @gameset.img = lego["sets"].first["image"]["imageURL"]
    if @gameset.save
      redirect_to gamesets_path
    else
      render :new
    end
  end

  def destroy
    @gameset.destroy
    redirect_to gamesets_path
  end

  private

  def find_gameset
    @gameset = Gameset.find(params[:id])
  end

  def gameset_params
    params.require(:gameset).permit(:ref)
  end
end
