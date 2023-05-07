Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resource "restaurants", only: [:index, :show, :destroy]
  resource "pizza", only: [:index]
  resource "restaurant_pizza", only: [:create]
end
