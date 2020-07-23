class BoardsController < ApplicationController
  def index
    @boards = Board.all     #如果不加區域變數的話，查完之後結果就會被蒸發沒辦法被取用
  end

  def new
    @board = Board.new
  end

  def create
    Board.create(title: params[:title], intro: params[:intro])
  end
end
