class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @album = Album.last
    @post = Post.last
    @posts = Post.all
  end

  def videos

  end

  def events

  end

  def about

  end

end

