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
	
	def edit
		@dream = Dream.find(params[:id])

	end

	def update
		@dream = Dream.find(params[:id])
		if @dream.update(dream_params)
			flash[:notice] = "Dream updated."
		else
			flash[:alert] = "Update failed"
			flash[:alert] = @dream.errors
		end
		redirect_to @dream
	end

	def destroy
		Dream.find(params[:id]).destroy

		flash[:success] = "Dream forgotten."
		redirect_to dreams_path
	end

	private

	def dream_params
		params.require(:dream).permit(:title, :content)
	end
end
