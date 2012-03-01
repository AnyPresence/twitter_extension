class TweetOptionsController < ApplicationController
  before_filter :find_available_objects, :except => [:index, :destroy]

  def index
    @tweet_options = current_account.tweet_options
  end
  
  def new
    @tweet_option = current_account.tweet_options.build
    tweet_options = current_account.tweet_options.all
    tweet_options.each do |x|
      @available_objects.delete(x.name)
    end
  end
  
  def create
    @tweet_option = current_account.tweet_options.build(params[:tweet_option])
    
    if @tweet_option.save
      flash[:notice] = "Tweet option has been created."
      redirect_to [current_account, @tweet_option]
    else
      flash[:alert] = "Tweet option has not been created."
      render "new"
    end
  end
  
  def edit
    @tweet_option = TweetOption.find(params[:id])
  end  
  
  def update
    @tweet_option =  TweetOption.find(params[:id])
    if @tweet_option.update_attributes(params[:tweet_option])
      flash[:notice] = "Tweet option has been updated."
      redirect_to [current_account, @tweet_option]
    else
      flash[:alert] = "Tweet option has not been updated."
      render :action => "edit"
    end
  end
  
  def show
    @tweet_option = TweetOption.find(params[:id])
  end
  
  def destroy
    @tweet_option = current_account.tweet_options.find(params[:id])
    @tweet_option.destroy
    flash[:notice] = "Tweet option has been deleted."
    redirect_to settings_path
  end
end
