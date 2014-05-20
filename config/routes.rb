EntreeReview::Application.routes.draw do

  resources :entrees do
    resources :images
    resources :reviews
    match '/rate', to: 'ratings#rate', as: :rate
  end
  resources :reviews, :only => [] do
    resources :images
  end
 

  match "about" => 'welcome#about', via: :get

  root to: "welcome#index"
end