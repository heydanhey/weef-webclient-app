class WeefsController < ApplicationController
  def index
    @posts = Weef.all
  end

  def show
    @post = Weef.find(params[:id])
  end

  def new

  end

  def create
    @post = Unirest.post("https://obscure-plateau-60697.herokuapp.com/posts", 
                          headers:{ "Accept" => "application/json" }, 
                        parameters:{ :name => params[:name], :text => params[:text], :emotion_id => params[:emotion_id] }).body

    render :show
  end

  def edit
    @post = Weef.find(params[:id])
  end

  def update
    @post = Weef.find(params[:id])

    @post = Unirest.patch("https://obscure-plateau-60697.herokuapp.com/posts/#{params[:id]}", 
                          headers:{ "Accept" => "application/json" }, 
                        parameters:{ :name => params[:name], :text => params[:text], :emotion_id => params[:emotion_id] }).body

    redirect_to "/weefs/#{params[:id]}"
  end

  def destroy
    @post = Weef.find(params[:id])
    message = @post.destroy
   
    redirect_to '/weefs'
  end

end
