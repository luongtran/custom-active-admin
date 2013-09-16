AACustomize::Application.routes.draw do
  resources :packets do
  end
  root to: 'packets#index'
  get "home/index"

  get '/roots/:p_id' => 'packets#roots'
  get '/childrens-of/:p_id' => 'packets#childrens_of'
  get '/packet-infor/:p_id' => 'packets#packet_infor'
  post '/reorder'=>  'packets#reorder'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
