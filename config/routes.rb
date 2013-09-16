AACustomize::Application.routes.draw do
  resources :packets do
  end
  root to: 'packets#index'
  get "home/index"

  get '/roots/' => 'packets#roots'
  get '/childrens-of/:p_id' => 'packets#childrens_of'
  get '/packet-infor/:p_id' => 'packets#packet_infor'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
