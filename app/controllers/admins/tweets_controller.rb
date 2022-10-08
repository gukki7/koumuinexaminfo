class Admins::TweetsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]
  def show
    @tweet = Tweet.find(params[:id])
    @customer = @tweet.customer
    @tweet_comment = TweetComment.new
    @tweet_comments = TweetComment.all
    @tweets = Tweet.where("created_at" === Date.today)
  end

  def index
    @tweets = Tweet.all
    @tweet_comments = TweetComment.all
    if params[:search].present?
      @section_title = "「#{params[:search]}」の検索結果"
      @tweets = Tweet.where('body LIKE ? OR title LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(12).order(:updated_at)
    end
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
