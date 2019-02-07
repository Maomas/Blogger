class ArticlesController < ApplicationController
	include ArticlesHelper
	before_filter :require_login, only: [:new, :create, :edit, :update]
     def index
          @articles = Article.all

	  @popular = Article.order(:view_count).last(3);
     end

     def show
	  @article = Article.find(params[:id])
      	  @comment = Comment.new
          @comment.article_id = @article_id
	  @article.view_count = @article.view_count.to_i + 1
	  @article.save
     end

     def new
	@article = Article.new
     end

     def create
	 @article = Article.new(article_params)
	 @article.save
	 redirect_to article_path(@article)
     end

     def destroy
	 @article = Article.find(params[:id])
	 @article.destroy
	 redirect_to "/articles"
     end

     def edit
	 @article = Article.find(params[:id])
     end

     def update
	 @article = Article.find(params[:id])
	 @article.update(article_params)

	 flash.notice = "Article '#{@article.title}' updated!"

	 redirect_to article_path(@article)
     end

end
