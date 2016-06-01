class DreamsController < ApplicationController
	def index
	end

	def new
		@dream = Dream.new
	end

	def create
		@dream = Dream.new(dream_params)

		if @dream.save
			flash[:notice] = "Dream created."
			redirect_to @dream
		end
	end
	
	def show
		@dream = Dream.find(params[:id])
	end

	private

	def dream_params
		params.require(:dream).permit(:title, :content)
	end
end
