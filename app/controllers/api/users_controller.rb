# frozen_string_literal: true

module Api
  class UsersController < ApplicationController

    # fetch all profiles
    def index
      users = User.all
      render json: {
        users: users,
        status: 'success'
      }
    end

    # fetch profile
    def show
      user = User.find_by_id(params[:id])
      render json: {
        user: user,
        status: 'success'
      }
    end

    # create profile
    def create
      if User.create!(user_params)
        render json: {
          status: 'success'
        }
      end
    end

    # Update profile
    def update
      user = User.find_by_id(params[:id])
      if user.update(user_params)
        render json: {
          status: 'success'
        }
      end
    end

    # account check
    def account_check
      user = User.exists?(email_id: params[:email_id])
      render json: {
        user: user,
        status: 'success'
      }
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_id,
                                   :phone, :admin)
    end
  end
end
