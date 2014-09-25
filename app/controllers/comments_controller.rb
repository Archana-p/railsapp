class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def create
		@article = Article.find(params[:article_id])
   @comment = @article.comments.new(params[:comment])
	 
	   if @comment.save 
	   	
	    redirect_to article_path(@article)
	   else
	   	@comments = @article.comments
	   	render template: '/articles/show'
	   end
	end

	def destroy
		@article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
   @comment.destroy
   redirect_to article_path(@article)
	end 
end
