class Admin::PostsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    @post = Post.new(params[:post])
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        redirect_to([:admin, @post])
      else
        render "new" 
      end
  end

  # PUT /posts/1
  def update
      @post = Post.find(params[:id])
      if @post.update_attributes(params[:post])
        flash[:success] = 'Post was successfully updated.'
        redirect_to([:admin, @post])
      else
        render "edit" 
      end
  end

  # DELETE /posts/1
  def destroy
    if Post.find(params[:id]).destroy
      flash[:notice] = 'Post was successfully deleted.'
   	else 
      flash[:error] = 'Problem - Post still exists.'
		end
    	redirect_to admin_posts_path
  end

end
