class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_article, only: %i[ edit update destroy ]

  def index
    articles = Article.all
    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @articles = articles.page params[:page]
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article, notice: "#{t('activerecord.models.article')}を作成しました!!"
    else
      render :new
    end
  end

  def edit
  end

  def update
   if @article.update!(article_params)
    redirect_to @article, notice: "#{t('activerecord.models.article')}を編集しました。"
   else
    render :edit
   end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "#{t('activerecord.models.article')}を削除しました。"
  end

 private
   #ストロングパラメーターの実装
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end
end
