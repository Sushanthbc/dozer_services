# frozen_string_literal: true

module Api
  class SnakeCharmsController < ApplicationController
    def all_snake_charms
      if admin_access(params[:user_id])
        snake_charms_hash = SnakeCharm.fetch_snake_charms
        snake_charms_processed =
          SnakeCharm.caudals_processing snake_charms_hash
      else
        snake_charms_processed = 'Not Authorized to view results'
      end
      render json: { snake_charm: snake_charms_processed,
                     status: 'success' }
    end

    def single_snake_charm
      snake_charm_hash = SnakeCharm.fetch_snake_charm_user_id params[:user_id]
      snake_charm_processed = SnakeCharm.caudals_processing snake_charm_hash
      render json: { snake_charm: snake_charm_processed,
                     status: 'success' }
    end

    def create
      user = User.find_by_id(params[:snake_charm][:user_id])
      snake_charm_inst = user.snake_charms.create!(snake_charm_params)
      if snake_charm_inst
        render json: { snake_charm_details: snake_charm_inst,
          status: 'success' }
      end
    end

    def admin_access(user_id)
      User.where(id: user_id).first.admin == '1'
    end

    private

    def snake_charm_params
      params.require(:snake_charm).permit(:rescue_date_time, :address, :village,
                                          :pincode, :country, :caller_name,
                                          :caller_phone, :snake_length,
                                          :snake_length_unit,
                                          :snake_weight, :snake_weight_unit,
                                          :snake_sex, :snake_color,
                                          :snake_caudals,
                                          :snake_behavior,
                                          :snake_macro_habitat,
                                          :snake_micro_habitat,
                                          :snake_condition,
                                          :release_date, :user_id,
                                          snake_photos: [])
    end
  end
end
