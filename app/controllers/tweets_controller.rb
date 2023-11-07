class TweetsController < ApplicationController
    def index
      @tweets = Tweet.all
    end
    
    def new
      @tweet = Tweet.new
    end
    
    
    def create
      @tweet = Tweet.create(message: params[:tweet][:message])
      @tweet.user = current_user
      @tweet.save
      redirect_to root_path
    end
    
    def destroy
      tweet = Tweet.find(params[:id])
      tweet.destroy
      redirect_to root_path
    end
end
