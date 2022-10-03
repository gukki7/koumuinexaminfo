class Customers::TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end
end
