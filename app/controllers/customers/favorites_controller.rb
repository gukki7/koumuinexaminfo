class Customers::FavoritesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    favorite = current_customer.favorites.new(tweet_id: tweet.id)
    favorite.save
    redirect_to customers_tweet_path(tweet)
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    favorite = current_customer.favorites.new(tweet_id: tweet.id)
    favorite.destroy
    redirect_to customers_tweet_path(tweet)
  end
end
