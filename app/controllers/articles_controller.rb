class ArticlesController < ApplicationController


  def index
    #retreive all the rows from the Article table. 
    @articles = Article.all    
  end

  def new   
    @article = Article.new 
  end  

  def create

    @article = Article.new(article_params)    

    if @article.save
      #this will call the show method from this controller which will display the article with the given id.
      redirect_to @article
    else
      #we show the same page for adding a new article with the errors. 
      render 'new'
    end   
  end

  #method that is supposed to display an article
  def show
    @article = Article.find(params[:id])    
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

    @article = Article.find(params[:id])

    if @article.update_attributes(article_params)
      redirect_to @article
    else
      render 'edit'
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "User deleted"
    redirect_to articles_path
  end


  private

    #we define which parameters are permitted to be accessed. We access all the parameters, and we choose the ones that are allowed. 
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def truncate(text, max_words = 2)            
      # Take first 50 words of the above
      shortened = text.split(' ').slice(0, max_words).join(' ')
      shortened += "..."
      return shortened # bah, explicit return is evil
    end

end
