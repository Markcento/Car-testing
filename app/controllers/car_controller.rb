class CarController < ApplicationController
  def initialize(make, model, year)
    @make = make
    @model = model
    @year= year
    @speed = 0
    @lights = "off"
  end
  def createdcar
    "The " + @make + " " + @model + " " + @year + " is going " + @speed.to_s + "Mph and the lights are " + @lights
  end
  def accelerate
    @speed += 10
  end

  def brake
    if @speed <= 7 && @speed > 0
      @speed -=1
    elsif @speed >= 7 && @speed >0
      @speed -= 7
    else
      @speed = 0
    end
  end
  def lights
    if @lights == "off"
      @lights = "on"
    elsif @lights == "on"
      @lights = "off"
    end
  end
  def speed
    @speed
  end
end
