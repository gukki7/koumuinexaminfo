class Admins::TweetsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]
  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweets = Tweet.all
  end

  def new
    @tweets = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to admins_tweet_path(@tweet)
    else
      redirect_to new_admins_tweet_path
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
    redirect_to admins_tweet_path(@tweet.id), notice: 'successfully'
    else
    render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if tweet.delete
    redirect_to admins_tweets_path,
    notice: 'successfully'
    else
    render :index
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  private
  # ストロングパラメータ
  def tweet_params
    params.require(:tweet).permit(:title, :body)
  end
end
