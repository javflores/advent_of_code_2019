defmodule SpaceCraftFuel do
  def calculate module_mass do
    floor(module_mass / 3) - 2
  end

  def calculate do
    {_module, total_fuel} =
      Enum.map_reduce(SpaceModules.all, 0, fn x, acc -> {x, calculate(x) + acc} end)
    total_fuel
  end
end
