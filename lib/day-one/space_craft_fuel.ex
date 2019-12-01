defmodule SpaceCraftFuel do
  def calculate module_mass do
    floor(module_mass / 3) - 2
  end

  def calculate_fuel_for_module module_mass do
    fuel = calculate(module_mass)
    fuel + calculate_fuel_for_fuel(fuel)
  end

  def calculate_fuel_for_fuel fuel  do
    fuel_for_fuel = calculate(fuel)
    if fuel_for_fuel < 0 do
      0
    else
      fuel_for_fuel + calculate_fuel_for_fuel(fuel_for_fuel)
    end
  end

  def calculate do
    {_module, total_fuel} =
      Enum.map_reduce(
        SpaceModules.all, 0, fn module, total_fuel -> {module, calculate_fuel_for_module(module) + total_fuel} end)
    total_fuel
  end
end
