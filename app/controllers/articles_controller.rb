class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def myarticles
    @articles = Article.all
  end

  def mytags
    @articles = Article.all
    @tags = Tag.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      @article.id
      @users= User.all
      @users.each do |user|
        if @article.description.include? "@"+(user.username)
          UserMailer.tag_email(user,@article).deliver_now
          Tag.create(user: user, article: @article )
        end
      end
        flash[:notice] = "Article was successfully created"
        redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
     flash[:notice] = "Article was updated"
     redirect_to article_path(@article)
    else
     flash[:notice] = "Article was not updated"
     render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was deleted"
    redirect_to myarticles_path
  end

  private
  def article_params
   params.require(:article).permit(:title, :description)
  end
end
 