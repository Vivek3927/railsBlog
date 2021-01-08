class ArticlesController < ApplicationController
  before_action :authenticate_user!

  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
  	# fetching all articles from the database
  	@articles = Article.page params[:page]
  end
  
  def show
  	@article = Article.find(params[:id])
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)

  	if @article.save
  		redirect_to @article
  	else
  		render :new
  	end
  end

  	def edit
  		@article = Article.find(params[:id])
  	end

  	def update
  		@article = Article.find(params[:id])

  		if @article.update(article_params)
  			redirect_to @article
  		else
  			render :edit
  		end
  		
  	end

  	def destroy
      byebug
  		@article = Article.find(params[:id])
      @article.destroy

  		redirect_to @article
  	end

  	private 
  		def article_params
  			params.require(:article).permit(:title, :body, :logo)
  		end
end
