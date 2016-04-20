class UsersController < ApplicationController
    def index
    end

    def login
        flash[:errors] = []
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/posts'
        else
            flash[:login_errors] = "no user with those credentials"
            redirect_to '/'
        end
    end

    def register
        puts "register " * 10
        flash[:errors] = []
        @user = User.new(email: params[:email], name: params[:name], alias: params[:alias], password: params[:password], password_confirmation: params[:password_confirmation])
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/posts'
        else
            for x in @user.errors.messages
                flash[:errors].push(x)
            end
            redirect_to '/'
        end
    end

    def show
        @user = User.find(params[:id])
        posts = Post.where(user: @user)
        likes = Like.where(user: @user)
        @post_count = posts.count
        @like_count = likes.count
    end

    def logout
        session[:user_id] = nil
        redirect_to '/'
    end
end
