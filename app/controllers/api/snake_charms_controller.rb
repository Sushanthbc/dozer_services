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
      return unless snake_charm_inst.present?
      render json: { snake_charm_details: snake_charm_inst,
                     status: 'success' }
    end

    def update
      snake_charm = SnakeCharm.find_by_id(params[:id])
      return unless snake_charm.update!(snake_charm_params)
      render json: { status: 'Updated Successfully' }
    end

    def show
      snake_charm = SnakeCharm.find_by_id(params[:id])
      snake_charms_processed = snake_charm
      user_detail = SnakeCharm.add_user_details snake_charms_processed
      photos = []
      snake_charms_processed.snake_photos.each do |photo|
        photos.push(url_for(photo))
      end
      json_response =
        snake_charms_processed.as_json.merge(snake_photos: photos,
                                             user_detail: user_detail)
      render json: json_response
    end

    def admin_access(user_id)
      User.where(id: user_id).first.admin == true
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
                                          :latitude, :longitude,
                                          :elevation, :elevation_unit,
                                          :general_remarks, :bite_report,
                                          :number_of_bands, :nature_of_sighting,
                                          snake_photos: [])
    end
  end
end
