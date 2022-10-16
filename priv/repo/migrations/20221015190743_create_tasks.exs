defmodule Crosstodo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :text, :string
      add :status, :integer

      timestamps()
    end
  end
end
