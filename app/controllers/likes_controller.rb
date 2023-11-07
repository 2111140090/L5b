class LikesController < ApplicationController
    def create
        logger.debug("aaaaaaaaaaaaaaaaaaaaaaa")
        tweet = Tweet.find(params[:tweet_id])
        logger.debug("bbbbbbbbbbbbbbbbbbbbbbb")
        #user = User.find_by(uid: session[:login_uid])
        #user.like_tweets << tweet
        logger.debug("ccccccccccccccccccccccc")
        unless tweet.liked?(current_user)
            logger.debug("dddddddddddddddddddd")
            tweet.like(current_user)
            logger.debug("eeeeeeeeeeeeeeeeeeeeeeee")
        end
        redirect_to root_path
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        #user = User.find_by(uid: session[:login_uid])
        #tweet.likes.find_by(user_id: user.id).destroy
        if tweet.liked?(current_user)
            tweet.unlike(current_user)
        end
        redirect_to root_path
    end
end
