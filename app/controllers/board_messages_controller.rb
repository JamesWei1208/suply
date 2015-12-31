class BoardMessagesController < ApplicationController

	before_action :find_board

	def index
		@messages = @board.messages
	end

	def show
		@message = @board.messages.find( params[:id] )
	end

	def new
		@message = @board.messages.build
	end

	def create
		@message = @board.messages.build( message_params )
		if @message.save
			redirect_to board_path( @board )
		else
			render :action => :new
		end
	end

	def edit
		@message = @board.messages.find( params[:id] )
	end

	def update
		@message = @board.messages.find( params[:id] )

		if @message.update
			redirect_to board_path( @board )
		else
			render :action => 'edit'
		end
	end

	def destroy
		@message = @board.messages.find( params[:id] )
		@message.destroy

		redirect_to board_messages_url( @board )
	end

	protected

	def find_board
		@board = Board.find( params[:board_id] )
	end

	def message_params
  	params.require( :message ).permit( :word )
	end
	
end
