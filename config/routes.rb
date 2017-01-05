Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :companies
  end

   match '/api/companies' => 'api/companies#options', via: :options
end
