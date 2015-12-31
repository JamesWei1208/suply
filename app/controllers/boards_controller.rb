class BoardsController < ApplicationController
	
	before_action :set_board, :only => [ :show, :edit, :update, :destroy]

	def index
		@boards = Board.page( params[:page] )
	end

	def new
		@board = Board.new
	end

	def create
		@board = Board.new( board_params )
		@board.user = current_user
		
		if @board.save
			flash[:notice] = "Board was successfully created"
			redirect_to boards_url
		else
			render :action => :new
		end
	end

	def show
		@messages = @board.messages.all
		@message = Message.new
	end

	def edit
	end

	def update
		if @board.update(board_params)
			redirect_to board_url(@board)
			flash[:notice] = "board was successfully updated"
		else
			render :action => :edit
		end
	end

	def destroy
		@board.destroy
		flash[:notice] = "board was successfully destroyed"
		redirect_to boards_url
	end

	private

	def board_params
		params.require(:board).permit(:title, :content)
	end

	def set_board
		@board = Board.find(params[:id])
	end

end
