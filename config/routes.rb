Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/bot/event', to: 'bot#create'
  get '/bot/register', to: 'bot#register'
end
