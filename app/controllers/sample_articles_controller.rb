class SampleArticlesController < ApplicationController
  before_action :set_sample_article, only: [:show, :edit, :update, :destroy]

  # GET /sample_articles
  def index
    @sample_articles = SampleArticle.all
  end

  # GET /sample_articles/1
  def show
  end

  # GET /sample_articles/new
  def new
    @sample_article = SampleArticle.new
  end

  # GET /sample_articles/1/edit
  def edit
  end

  # POST /sample_articles
  def create
    @sample_article = SampleArticle.new(sample_article_params)

    if @sample_article.save
      redirect_to @sample_article, notice: 'Sample article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sample_articles/1
  def update
    if @sample_article.update(sample_article_params)
      redirect_to @sample_article, notice: 'Sample article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sample_articles/1
  def destroy
    @sample_article.destroy
    redirect_to sample_articles_url, notice: 'Sample article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_article
      @sample_article = SampleArticle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sample_article_params
      params.require(:sample_article).permit(:title, :content)
    end
end
