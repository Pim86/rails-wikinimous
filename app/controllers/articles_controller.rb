class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'New article was successfully created.'
    else
      render :new, status: :unprocessable_entity # 422
    end
  end

  def update
    edit
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit, status: :unprocessable_entity # 422
    end
  end

  def edit
    show
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    show
    @article.destroy!
    redirect_to root_path, notice: 'Article was successfully deleted.', status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
