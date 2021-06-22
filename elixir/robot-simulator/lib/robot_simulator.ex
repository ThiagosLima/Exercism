defmodule RobotSimulator do
  @valid_directions [:north, :east, :south, :west]

  defguard is_direction(direction) when direction in @valid_directions

  defguard is_position(x, y) when is_number(x) and is_number(y)

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, _) when not is_direction(direction), do: {:error, "invalid direction"}

  def create(direction, {x, y} = position) when is_position(x, y) do
    %{direction: direction, position: position}
  end

  def create(_, _), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions), do: do_simulate(robot, String.graphemes(instructions))

  defp do_simulate(robot, []), do: robot

  defp do_simulate(robot, ["R" | tail]) do
    new_index = Enum.find_index(@valid_directions, &(&1 == robot.direction)) - 3
    new_direction = Enum.at(@valid_directions, new_index)

    do_simulate(%{robot | direction: new_direction}, tail)
  end

  defp do_simulate(robot, ["L" | tail]) do
    new_index = Enum.find_index(@valid_directions, &(&1 == robot.direction)) - 1
    new_direction = Enum.at(@valid_directions, new_index)

    do_simulate(%{robot | direction: new_direction}, tail)
  end

  defp do_simulate(%{direction: :north, position: {x, y}} = robot, ["A" | tail]) do
    do_simulate(%{robot | position: {x, y + 1}}, tail)
  end

  defp do_simulate(%{direction: :east, position: {x, y}} = robot, ["A" | tail]) do
    do_simulate(%{robot | position: {x + 1, y}}, tail)
  end

  defp do_simulate(%{direction: :south, position: {x, y}} = robot, ["A" | tail]) do
    do_simulate(%{robot | position: {x, y - 1}}, tail)
  end

  defp do_simulate(%{direction: :west, position: {x, y}} = robot, ["A" | tail]) do
    do_simulate(%{robot | position: {x - 1, y}}, tail)
  end

  defp do_simulate(_robot, _instructions), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(%{direction: direction}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(%{position: position}), do: position
end
