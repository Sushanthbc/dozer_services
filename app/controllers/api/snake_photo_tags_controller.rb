# frozen_string_literal: true

# TODO: blocking for iterative approach
# module Api
#   class SnakePhotoTagController < ApplicationController
#     def create
#       photos =
#         ActiveStorageAttachment.find_by_record_id(params[:snake_charm_record])
#       snake_photo_tags =
#         (params[:snake_tags]).map { |e| e.attributes.symbolize_keys }
#       photos.each do |photo|
#         attributes_photo = snake_photo_tags[photo.name]
#       end
#     end
#   end
# end
