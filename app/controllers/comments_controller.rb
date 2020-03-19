class CommentsController < ApplicationController
	before_action :find_post
	before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
	before_action :comment_owner, only: [:destroy, :edit, :update]
	def new
	end
	def create
		@comment = @article.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id
		@comment.save
		if @comment.save
			redirect_to article_path(@article)
		else
			flash[:error] = @comment.errors.full_messages
			render '_new'
		end
	end

	def destroy
		@comment.destroy
		redirect_to article_path(@article)
	end

	def edit
	end

	def update
		if @comment.update(params[:comment].permit(:comment))
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	private
	def find_post
		@article = Article.find(params[:article_id])
	end
	def find_comment
		@comment = @article.comments.find(params[:id])
	end
	def comment_owner
		unless current_user.id == @comment.user_id
			flash[:notice] = "you are not a comment owner to perform this!"
			redirect_to @article
			
		end
	end
end
