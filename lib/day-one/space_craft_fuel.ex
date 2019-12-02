defmodule SpaceCraftFuel do
  def calculate do
    {_modules, total_fuel} =
    SpaceModules.all |>
      Enum.map_reduce(0, fn module, total_fuel -> {module, calculate({:module, module}) + total_fuel} end)
    total_fuel
  end

  def calculate({:module, mass}) do
    fuel = calculate(mass)
    fuel + calculate({:fuel, fuel})
  end

  def calculate({:fuel, fuel_mass}) do
    fuel_for_fuel = calculate(fuel_mass)
    if fuel_for_fuel < 0 do
      0
    else
      fuel_for_fuel + calculate({:fuel, fuel_for_fuel})
    end
  end

  def calculate(module_mass), do: floor(module_mass / 3) - 2
end
