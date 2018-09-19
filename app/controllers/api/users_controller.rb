# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    before_action :account_check_params, only: [:account_check]
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
      user = User.create!(user_params)
      if user
        render json: {
          user: user,
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
      user = if User.exists?(email_id: params[:user][:email_id])
               User.find_by_email_id(params[:user][:email_id])
             else
               false
             end
      render json: {
        user: user,
        status: 'success'
      }
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email_id,
                                   :phone, :admin, :about_user, :purpose)
    end

    def account_check_params
      params.require(:user).permit(:email_id)
    end
  end
end
