Rails.application.routes.draw do
  namespace :api do
     namespace :v1 do
       resources :data_types, only: %i[index create destroy]
       resources :data_ips, only: %i[index create show update destroy]
     end
   end
end
