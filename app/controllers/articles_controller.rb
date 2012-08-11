class ArticlesController < ApplicationController
  
  def index 
    @articles = Article.all 
    # @articles el arroba hace que una Variable sea persistente en la instancia
    # = Article.all return de table 
  end
  
  def show 
    if params.include? :id
      @article = Article.find(params[:id] )
    else
      @article = Article.find_by_slug(params[:slug] )
    end
  end
  
  def new 
    @article = Article.new
    #The comand render is implicit
  end
  
  def create
    puts params #print in server the hash
    @article = Article.new(params[:article]) #give me the new objects in this var
    
    if @article.save 
      flash[:success] = "Article was saved"
      redirect_to articles_path
    else
      flash[:error] = "Article was not saved"
      render :new 
    end

  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end 
  
end
