defmodule ProgramAlarm1202 do
  @doc """
  Given a sequence of integers, returns the IntCode program

  ## Example
    iex> ProgramAlarm1202.process([1, 0, 0, 3])
    [1, 0, 0, 2]
    iex> ProgramAlarm1202.process([2, 0, 0, 3])
    [2, 0, 0, 4]
    iex> ProgramAlarm1202.process([1, 0, 0, 3, 99])
    [1, 0, 0, 2, 99]
    iex> ProgramAlarm1202.process([1,9,10,3,2,3,11,0,99,30,40,50])
    [3500,9,10,70, 2,3,11,0, 99, 30,40,50]
    iex> ProgramAlarm1202.process([2,3,0,3,99])
    [2,3,0,6,99]
    iex> ProgramAlarm1202.process([2,4,4,5,99,0])
    [2,4,4,5,99,9801]
    iex> ProgramAlarm1202.process([2,4,4,5,99,0])
    [2,4,4,5,99,9801]
  """
  def build_new_code(int_code, where, new_value) do
    {front, [_ | tail]} = Enum.split(int_code, where)
    front ++ [new_value | tail]
  end

  def calculate_new_value(1, int_code, processor1, processor2), do: Enum.at(int_code, processor1) + Enum.at(int_code, processor2)

  def calculate_new_value(2, int_code, processor1, processor2), do: Enum.at(int_code, processor1) * Enum.at(int_code, processor2)

  def process(int_code, next_index \\ 0) do
    op_code = Enum.at(int_code, next_index)
    if op_code != 1 and op_code != 2 do
      int_code
    else
      new_value = op_code |>
        calculate_new_value(int_code, Enum.at(int_code, next_index + 1), Enum.at(int_code, next_index + 2))
      int_code |>
        build_new_code(Enum.at(int_code, next_index + 3), new_value)
        |> process(next_index + 4)
    end
  end
end
