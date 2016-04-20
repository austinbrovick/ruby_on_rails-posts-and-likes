class LikesController < ApplicationController
    def like
        post = Post.find(params[:id])
        user = User.find(session[:user_id])



        puts "**" * 30
        like = Like.where(post:post, user:user)
        if like.count > 0
            redirect_to '/posts'
        else
            like = Like.create(post:post, user: user)
            redirect_to '/posts'
        end
    end
end
