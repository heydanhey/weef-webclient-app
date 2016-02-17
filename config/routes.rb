Rails.application.routes.draw do

  get '/weefs' => 'weefs#index'

  get '/weefs/new' => 'weefs#new'

  post '/weefs' => 'weefs#create'

  get '/weefs/:id' => 'weefs#show'

  get '/weefs/:id/edit' => 'weefs#edit'

  patch '/weefs/:id' => 'weefs#update'

  delete '/weefs/:id' => 'weefs#destroy'

end
