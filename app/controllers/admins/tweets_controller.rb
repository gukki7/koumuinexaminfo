class Admins::TweetsController < ApplicationController
  before_action :if_not_admin
  before_action :set_tweet, only: [:index, :new, :create, :show, :edit, :destroy]
  
  
  
  
  private
    def if_not_admin
    　redirect_to customers_root_path unless current_customer.admin?
  　end

  　def set_tweet
    　@tweet = Tweet.find(params[:id])
  　end
    end
end
