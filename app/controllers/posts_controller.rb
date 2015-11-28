class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each_with_index do |post, index|
      if index = (index % 5 == 0)
        Post.title: SPAM
      end
  end

  def show
  end

  def new
  end

  def edit
  end

end
