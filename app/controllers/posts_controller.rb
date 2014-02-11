class PostsController < ApplicationController

def new
@post = Post.new
end
def index
  @posts = Post.order('created_at DESC').where.not(typeOfPost: 2)
end
def hidden
  @posts = Post.order('created_at DESC').where(typeOfPost: 2)
end
def challenges
  @posts = Post.order('created_at DESC').where(typeOfPost: 0)
end
def succeses
  @posts = Post.order('created_at DESC').where(typeOfPost: 1)
end
def create
  @post = Post.new(post_params)
 if @post.save
    redirect_to @post
  else
    render 'new'
  end
end
def show
  @post = Post.find(params[:id])
end

def edit
  @post = Post.find(params[:id])
end
def update
  @post = Post.find(params[:id])
  if @post.update(params[:post].permit(:title, :text, :typeOfPost))
    redirect_to @post
  else
    render 'edit'
  end
end
def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end
private
  def post_params
    params.require(:post).permit(:title, :text, :typeOfPost)
  end
end
