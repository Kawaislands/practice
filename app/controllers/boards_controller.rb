class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]

  def index
    @boards = Board.all.includes(:user)
  end

  def new
    @board = Board.new
  end

  def create; end

  def show; end

  def edit; end

  def update
    @board.update(board_params)
    redirect_to @board
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
