# encoding: utf-8
class ArticlesController < ApplicationController
  include Paginable

  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @categories = Category.name_order

    category = @categories.select { |c| c.name == params[:category] }[0] if params[:category].present?

    @highlights = Article
      .includes(:category, :user)
      .filter_by_category(category)
      .filter_by_archive(params[:month_year])
      .desc_order
      .first(3)

    highlight_ids = @highlights.pluck(:id).join(',')

    @articles = Article
      .includes(:category, :user)
      .without_highlights(highlight_ids)
      .filter_by_category(category)
      .filter_by_archive(params[:month_year])
      .desc_order
      .page(current_page)

    @archives = Article.group_by_month(:created_at, format: "%B %Y").count
  end

  def show; end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Artigo criado com sucesso!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Artigo atualizado com sucesso!'
    else
      render :new
    end
  end

  def destroy
    @article.destroy

    redirect_to @article, notice: 'Artigo excluido com sucesso!'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :category_id)
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end
end
