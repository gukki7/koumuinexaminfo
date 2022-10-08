class Customers::TweetsController < ApplicationController

  def show
    @tweet = Tweet.find(params[:id])
    @customer = @tweet.customer
    @tweet_comment = TweetComment.new
    @tweet_comments = @tweet.tweet_comments
    @tweets = Tweet.where("created_at" === Date.today)
  end

  def index
    @tweets = Tweet.all
    @customer = current_customer
    if params[:search].present?
      @section_title = "「#{params[:search]}」の検索結果"
      @tweets = Tweet.where('body LIKE ? OR title LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(12).order(:updated_at)
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @tweets = @tag.tweets.order(created_at: :desc)
    else
      @tweets = Tweet.all.order(created_at: :desc)
    end
      @tag_lists = Tag.all
      @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(10)
  end

  def new
    @tweets = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tag_list = params[:tweet][:tag_name_list].split(' ')
    @tweet.customer_id = current_customer.id
    if @tweet.save
       @tweet.save_tweets(@tag_list)
       redirect_to customers_tweets_path(@tweet)
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
    if @tweet.delete
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
