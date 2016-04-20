class PostsController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        posts = Post.all
        @posts = []
        for post in posts
            likes = Like.where(post: post)
            @posts.push({likes: likes, post: post, like_count: likes.count})
        end
    end


    def create
        user = User.find(session[:user_id])
        post = Post.new(user: user, content: params[:content])
        post.save
        redirect_to '/posts'
    end

    def show
        @post = Post.find(params[:id])
        @likers = Like.where(post: @post)
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to '/posts'
    end
end
