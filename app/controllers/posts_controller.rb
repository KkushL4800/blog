class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]


	def index
		@posts=Post.all
	end

	def new
		@post=Post.new
	end 

	def create
		@post=Post.new(post_params)
		@post.user_id=current_user.id
		
		if @post.save
			redirect_to posts_path, :notice => "Your post was saved"
		else
			render "new"
		end	
	end

	def update
		@post=Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to posts_path, :notice => "Your post has been updated"
		else
			render "edit"
		end

	end

	def destroy
		@post=Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post has been deleted"

	end

	def show
		@post=Post.find(params[:id])
	end

	def edit
		@post=Post.find(params[:id])
	end

	private

    def post_params
     params.require(:post).permit!
    end

    

end
