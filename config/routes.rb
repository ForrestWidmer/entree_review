EntreeReview::Application.routes.draw do
  

  resources :entrees do
    resources :reviews
  end

  match "about" => 'welcome#about', via: :get

  root to: "welcome#index"
end
