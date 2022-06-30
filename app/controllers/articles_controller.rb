class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @data = {name:"pikachu", type:"electric",group:"pokemon",title:"titledayo"}
    render json: @data
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.UserID = current_account.id
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
    @article = Article.find(params[:format])
    @like = Like.new(account_id:current_account.id,article_id:params[:format])
    @like.save
    redirect_to article_path(@article)
  end

  def unlike
    @article = Article.find(params[:format])
    @like = Like.find_by(account_id:current_account.id,article_id:params[:format])
    @like.destroy
    redirect_to article_path(@article)
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body, :status,:like)
    end
end