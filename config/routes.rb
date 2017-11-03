Rails.application.routes.draw do

  root 'cars#index'

  get 'cars/create' => 'cars#create'

end
