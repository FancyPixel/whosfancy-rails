Rails.application.routes.draw do

  devise_for :users
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post 'checkin', to: 'checkins#checkin'
      post 'checkout', to: 'checkins#checkout'
    end
  end

  get 'home/index'

  root to: "home#index"

end
