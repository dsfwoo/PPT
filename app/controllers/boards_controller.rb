class BoardsController < ApplicationController

  before_action :find_board, only: [:show, :edit, :destroy, :update]

  def index
    # @boards = Board.where(deleted_at: nil) #如果不加區域變數的話，查完之後結果就會被蒸發沒辦法被取用，因為下面的update方法是使用軟刪除的方式，所以不能使用all方法要使用where去篩選deleted_at欄位是空的
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def show
  end

  def edit
  end

  #where找出來的東西都會用陣列包起來，要取用裡面的值需要在下.first比find方法多麻煩一點，取出的形式為 [1]
  #find and find_by 只會找到一筆資料 取出的形式為 1，另外find只能接id，find_by可以換成其他params

  def create
    @board = Board.new(board_params) #HTTP 沒有狀態所以需要在這邊在下一次new後面塞入params接住String

    if @board.save
      #flash[:notice] = 'Board Created !' 下面是二合一版本
      redirect_to boards_path, notice: 'Board Created !' #好處是只要在routes.rb改變首頁之後全站的root_path就會被套用
    else
      render :new  #借new的頁面重新渲染
    end

  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: 'Board Updated !'
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    # @board.update(deleted_at: Time.now, abc: false)
    redirect_to boards_path, notice: 'Board Deleted !'
  end

  

  private
#清洗資料的方法
  def board_params
    params.require(:board).permit(:title, :intro) #寫入資料庫的資料需要清過清洗確保不會被上一個頁面的有心人士塞入奇怪的資料
  end

  def find_board
    @board = Board.find(params[:id])
  end
end
