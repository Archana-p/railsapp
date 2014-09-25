class ArticlesController < ApplicationController
	before_filter :check_for_admin,only: [:new,:create]
  
	def index
   @articles = Article.all
	end 

	def new
   @article = Article.new
	end 

	def create
    @article = Article.new(params[:article])
	 
	   if  @article.save 
	   	
	    redirect_to articles_path
	   else
	   	 binding.pry
	   	 render('new')

	   end
	end 

	def show 


		@article = Article.find(params[:id])
		@comment = @article.comments.new
		#binding.pry
		@comments = @article.comments

	end

	def check_for_admin
		redirect_to root_url if !is_admin?
	end
end
