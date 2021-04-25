Rails.application.routes.draw do
  devise_for :employees, controllers: {
    sessions:       'member/employees/sessions',
    passwords:      'member/employees/passwords',
    registrations:  'member/employees/registrations'
  }
  root :to => 'member/homes#top'

  namespace :manager do
    resources :client_companies, only:[:index, :create, :edit, :update]
    resources :employees, only:[:index, :update]
  end

  namespace :member do
    resources :employees, only:[:index, :update, :edit, :show]
  end
end
