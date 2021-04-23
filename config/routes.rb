Rails.application.routes.draw do
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'member/homes#top'

  namespace :manager do
    resources :client_companies, only:[:index, :create, :edit, :update]
    resources :employees, only:[:index, :update]
  end
end
