
class Car
  def initialize(make, model_year, speed=0, lights=false, e_brake=true)
    @make = make
    @model_year = model_year
    @speed = speed
    @lights = lights
    @e_brake = e_brake
  end

  def make
    @make
  end

  def model_year
    @model_year
  end

  def speed
    @speed
  end

  def accelerate
    @speed += 10
  end

  def brake
    if speed < 7
      @speed = 0
    else
      @speed -= 7
    end
  end

  def lights
    @lights = !@lights
  end

  def show_lights
    if @lights == false
      @lights = "Off"
    else
      @lights = "On"
    end
  end

  def e_brake
    if @e_brake == true
      @e_brake = "on"
    else
      @e_brake = "off"
    end
end
