class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def create
        restaurant_pizza = RestaurantPizza.create(restaurant_pizza_params)
        response = Pizza.find(restaurant_pizza[:pizza_id]).to_json(only: [:id, :name, :ingredients])
        render json: response, status: :created
    end

    private

    def restaurant_pizza_params
        params.permit(:price, :restaurant_id, :pizza_id)
    end

    def find_restaurant_pizza
        RestaurantPizza.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Restaurant Pizza not found" }, status: :not_found
    end
end
