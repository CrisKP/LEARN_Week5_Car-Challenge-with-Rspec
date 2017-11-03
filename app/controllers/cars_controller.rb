class CarsController < ApplicationController
  def index


    if params.has_key?(:make) && params.has_key?(:model_year)
      cookies[:make] = params[:make]
      cookies[:model_year] = params[:model_year]
      @car = Car.new(cookies[:make], cookies[:model_year])
      session[:car] = @car.to_yaml
      redirect_to '/cars/create'
    end

  end

  def create

    @car = YAML.load(session[:car])

    if params.has_key?(:accelerate)
      @car.accelerate
      session[:car] = @car.to_yaml
    end

    if params.has_key?(:brake)
      @car.brake
      session[:car] = @car.to_yaml
    end

    if params.has_key?(:lights)
      @car.lights
      session[:car] = @car.to_yaml
    end

  end
end
