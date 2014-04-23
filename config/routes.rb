EntreeReview::Application.routes.draw do

  # Custom routes for nesting images under entrees
  # get "/entrees/:entree_id/images" => "images#index", as: "entree_images"
  # post "/entrees/:entree_id/images" => "images#create"
  # get "/entrees/:entree_id/images/new" => "images#new", as: "new_entree_image"
  # get "/entrees/:entree_id/images/:id/edit" => "images#edit", as: "edit_entree_image"
  # get "/entrees/:entree_id/images/:id" => "images#show", as: "entree_image"
  # put "/entrees/:entree_id/images/:id" => "images#update"
  # delete "/entrees/:entree_id/images/:id" => "images#destroy"

=begin
  # Custom routes for nesting images under reviews
  get "/entrees/:entree_id/reviews/:review_id/images" => "images#index", as: "review_images"
  post "/entrees/:entree_id/reviews/:review_id/images" => "images#create"
  get "/entrees/:entree_id/reviews/:review_id/images/new" => "images#new", as: "new_review_image"
  get "/entrees/:entree_id/reviews/:review_id/images/:id/edit" => "images#edit", as: "edit_review_image"
  get "/entrees/:entree_id/reviews/:review_id/images/:id" => "images#show", as: "review_image"
  put "/entrees/:entree_id/reviews/:review_id/images/:id" => "images#update"
  delete "/entrees/:entree_id/reviews/:review_id/images/:id" => "images#destroy"
=end
  resources :entrees do
    resources :images
    resources :reviews
  end
  resources :reviews do
    resources :images
  end
 

  match "about" => 'welcome#about', via: :get

  root to: "welcome#index"
end

=begin
entree_image_index GET    /entrees/:entree_id/image(.:format)            image#index
                   POST   /entrees/:entree_id/image(.:format)            image#create
  new_entree_image GET    /entrees/:entree_id/image/new(.:format)        image#new
 edit_entree_image GET    /entrees/:entree_id/image/:id/edit(.:format)   image#edit
      entree_image GET    /entrees/:entree_id/image/:id(.:format)        image#show
                   PUT    /entrees/:entree_id/image/:id(.:format)        image#update
                   DELETE /entrees/:entree_id/image/:id(.:format)        image#destroy
=end