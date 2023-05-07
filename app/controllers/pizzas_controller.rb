class PizzasController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def index 
        pizzas = Pizza.all
        render json: pizzas
    end
end
