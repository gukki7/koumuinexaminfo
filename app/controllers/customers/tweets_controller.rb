class Customers::TweetsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
    @customer = @tweet.customer
  end

  def index
    @tweets = Tweet.all
    @customer = current_customer
  end

  def new
    @tweets = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.customer_id = current_customer.id
    if @tweet.save
      redirect_to customers_tweet_path(@tweet)
    else
      @customer = current_customer
      redirect_to new_customers_tweet_path
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
    redirect_to customers_tweet_path(@tweet.id), notice: 'successfully'
    else
    render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if tweet.delete
    redirect_to customers_tweets_path,
    notice: 'successfully'
    else
    render :index
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
    if @tweet.customer != current_customer
      redirect_to customers_tweet_path
    end
  end

  private
  # ストロングパラメータ
  def tweet_params
    params.require(:tweet).permit(:title, :body)
  end
end
