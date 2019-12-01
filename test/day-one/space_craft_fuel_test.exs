defmodule SpaceCraftFuelTest do
  use ExUnit.Case
  doctest SpaceCraftFuel

  test "for a mass of 12, the fuel required is 4" do
    assert SpaceCraftFuel.calculate_fuel_for_module(12) == 2
  end

  test "for a mass of 14, the fuel required is 4" do
    assert SpaceCraftFuel.calculate_fuel_for_module(14) == 2
  end

  test "for a mass of 43, the fuel required is 14" do
    assert SpaceCraftFuel.calculate_fuel_for_module(43) == 14 #12 + 2
  end

  test "for a mass of 1969, the fuel required is 966" do
    assert SpaceCraftFuel.calculate_fuel_for_module(1969) == 966
  end

  test "calculates total fuel required for all modules" do
    assert SpaceCraftFuel.calculate() == 5015983
  end
end
