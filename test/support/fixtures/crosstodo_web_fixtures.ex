defmodule Crosstodo.CrosstodoWebFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Crosstodo.CrosstodoWeb` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        status: 42,
        text: "some text"
      })
      |> Crosstodo.CrosstodoWeb.create_task()

    task
  end
end
