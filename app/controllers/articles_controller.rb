class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "pikachu", password: "dragon", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    if @article.like.nil? then
      @article.like = 0
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    logger.debug "editediteditediteditediteditediteditediteditediteditediteditediteditediteditediteditediteditediteditediteditedit"
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path, status: :see_other
  end

  def like
    @article = Article.find(params[:id])
    if @article.like.nil? then
      @article.like = 0
    end
    @article.like = @article.like+1
    @article.save
    redirect_to article_path(@article)
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body, :status,:like)
    end
end