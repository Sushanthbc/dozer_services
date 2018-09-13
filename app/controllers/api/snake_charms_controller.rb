# frozen_string_literal: true

module Api
  class SnakeCharmsController < ApplicationController
    def index
      snake_charms = SnakeCharm.all
      caudals_processing snake_charms
      render json: { snake_charm: snake_charms,
                     status: 'success' }
    end

    def create
      user = User.find_by_id(params[:snake_charm][:user_id])
      if user.snake_charms.create!(snake_charm_params)
        render json: { status: 'success' }
      end
    end

    def caudals_processing(snake_charms)
      caudals_hash = snake_charms.map { |e| e.attributes.symbolize_keys }
      caudals_hash.each do |caudal|
        if (caudal[:snake_caudals]).include?('D') || (caudal[:snake_caudals]).include?('U')
          caudal_string = caudal[:snake_caudal]
          #TODO: Keep parsing and adding it to hash of objects
          
        end
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
                                          :snake_caudals,
                                          :snake_behavior,
                                          :snake_macro_habitat,
                                          :snake_micro_habitat, :snake_condition,
                                          :release_date, :user_id, :snake_photo)
    end
  end
end
