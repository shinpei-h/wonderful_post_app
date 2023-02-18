class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(
      title: params[:title],
      content: params[:content],
    )
    @article.save!

  end

end
