module Api
  class SnakeCharmsController < ApplicationController
    def index
      snake_charms = SnakeCharm.all
      render json: { snake_charm: snake_charms,
                     status: 'success' }
    end

    def create
      user = User.find_by_id(params[:snake_charm][:user_id])
      if user.snake_charms.create!(snake_charm_params)
        render json: { status: 'success' }
      end
    end

    private

    def snake_charm_params
      params.require(:snake_charm).permit(:rescue_date_time, :address, :village,
                                          :pincode, :country, :caller_name,
                                          :caller_phone, :snake_length,
                                          :snake_length_unit,
                                          :snake_weight, :snake_weight_unit,
                                          :snake_sex, :snake_color,
                                          :snake_divided_sub_caudals,
                                          :snake_undivided_sub_caudals,
                                          :snake_behavior,
                                          :snake_macro_habitat,
                                          :snake_micro_habitat, :snake_condition,
                                          :release_date, :user_id, :snake_photo)
    end
  end
end
