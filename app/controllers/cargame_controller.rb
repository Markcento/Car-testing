class CargameController < ApplicationController
  def index
  end

  def register
    if !params.has_key?(:make) || params[:make].strip.empty? || !params.has_key?(:model) || params[:model].strip.empty? || !params.has_key?(:year) || params[:year].strip.empty?
      # @car = "Please enter all car information"
      render "register.html.erb"
    else
      car = CarController.new(params[:make], params[:model], params[:year])
      session[:car] = car.to_yaml
      redirect_to controller: 'cargame', action: 'play'
    end
  end

  def play
    @createdcar = YAML.load(session[:car])
    @speed = 0
  end
  def accelerate
    @createdcar = YAML.load(session[:car])
    @createdcar.accelerate
    session[:car] = @createdcar.to_yaml
    render 'play.html.erb'
  end
  def brake
    @createdcar = YAML.load(session[:car])
    @createdcar.brake
    session[:car] = @createdcar.to_yaml
    render 'play.html.erb'
  end
  def lights
    @createdcar = YAML.load(session[:car])
    @createdcar.lights
    session[:car] = @createdcar.to_yaml
    render 'play.html.erb'
  end
  # def speed
  #   @createdcar = YAML.load(session[:car])
  #   @speed = @createdcar.speed
  #   session[:car] = @createdcar.to_yaml
  #   render 'play.html.erb'
  # end


end
