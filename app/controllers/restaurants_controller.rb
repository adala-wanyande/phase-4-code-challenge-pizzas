class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        restaurants = Restaurant.all
        render json: restaurants
    end

    def show
        restaurant = find_restaurant
        render json: restaurant.to_json(include: :pizzas)
    end

    def destroy
        restaurant = find_restaurant
        restaurant.destroy
        render json: {}
    end
    

    private

    def find_restaurant
        Restaurant.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Restaurant not found" }, status: :not_found
    end
end
