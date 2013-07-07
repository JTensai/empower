Empower::Application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions


  root :to => 'quizzes#index'
  get "quiz/:id", controller: 'quiz', action: 'show'

  resources :quizzes
  resources :quiz_results

  match 'quiz/:id/start' => 'quiz_results#new', as: 'start_quiz'
  match 'quiz/:id/results' => 'quiz_results#results_page', as: 'results_page'
  match 'quiz/:id/ad' => 'quiz_results#ad_page', as: 'ad_page'

end
