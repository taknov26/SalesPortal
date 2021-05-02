Rails.application.routes.draw do
  devise_for :employees, controllers: {
    sessions:       'member/employees/sessions',
    passwords:      'member/employees/passwords',
    registrations:  'member/employees/registrations'
  }

  root :to => 'member/homes#top'
  get "manager/top" =>"manager/homes#top"

  namespace :manager do
    resources :client_companies, only:[:index, :create, :edit, :update]
    resources :employees, only:[:index, :update]
  end

  namespace :member do
    resources :employees, only:[:index, :update, :edit, :show]
    resources :clients, only:[:index, :update, :edit, :show, :new, :create] do
      resources :client_people, only:[:create, :update]
      resources :client_comments, only:[:create, :destroy]
    end
    resources :matters, except:[:destroy] do
      resources :costs, only:[:create, :destroy]
      resources :matter_comments, only:[:create, :destroy]
    end
  end
end
