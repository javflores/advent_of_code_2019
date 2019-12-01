defmodule SpaceCraftFuelTest do
  use ExUnit.Case
  doctest SpaceCraftFuel

  test "for a mass of 12, the fuel required is 4" do
    assert SpaceCraftFuel.calculate(12) == 2
  end

  test "for a mass of 14, the fuel required is 4" do
    assert SpaceCraftFuel.calculate(14) == 2
  end

  test "for a mass of 1969, the fuel required is 654" do
    assert SpaceCraftFuel.calculate(1969) == 654
  end

  test "calculates total fuel required for all modules" do
    assert SpaceCraftFuel.calculate() == 3345909
  end
end
