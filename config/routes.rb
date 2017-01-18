Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get '/autos' => 'home#marcas_modelos'
  put '/autos' => 'home#guarda_precios'
  patch '/autos' => 'home#guarda_precios'
end
