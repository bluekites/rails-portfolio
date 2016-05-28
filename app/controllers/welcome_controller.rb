class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order("created_at desc").limit(5)
    @projects = Project.all.order("created_at desc").limit(5)
  end
end
