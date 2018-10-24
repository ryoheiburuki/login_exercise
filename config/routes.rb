Rails.application.routes.draw do
  root to: 'blogs#top'
  resources :blogs
  resources :users, only:[:new, :create, :show, :destroy]
  resources :sessions, only:[:new, :create, :destroy]
  resources :favorites, only:[:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
