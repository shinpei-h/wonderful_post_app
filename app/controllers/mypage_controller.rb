class MypageController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[ edit update destroy ]

  def show
    articles = current_user.articles
    articles = articles.where("title LIKE ?", "%#{params[:title]}%") if params[:title].present?
    @articles = articles.page params[:page]
  end
end
 private
  #  #ストロングパラメーターの実装
  # def article_params
  #   params.require(:article).permit(:title, :content)
  # end

#   def set_article
#     @article = current_user.articles.find(params[:id])
#   end
# end
