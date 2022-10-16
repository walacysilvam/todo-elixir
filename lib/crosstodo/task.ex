defmodule Crosstodo.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :status, :integer, default: 1
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:text, :status])
    |> validate_required([:text, :status])
  end
end
