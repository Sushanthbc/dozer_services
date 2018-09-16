# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    resources :snake_charms, only: %i[create update]
    resources :users
    post '/users/account_check' => 'users#account_check'
    get '/snake_charms/all_snake_charms/:user_id' =>
    'snake_charms#all_snake_charms'
    get '/snake_charms/single_snake_charm/:user_id/' =>
    'snake_charms#single_snake_charm'
  end
end
