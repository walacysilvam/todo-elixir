defmodule Crosstodo.CrosstodoWebTest do
  use Crosstodo.DataCase

  alias Crosstodo.CrosstodoWeb

  describe "tasks" do
    alias Crosstodo.CrosstodoWeb.Task

    import Crosstodo.CrosstodoWebFixtures

    @invalid_attrs %{status: nil, text: nil}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert CrosstodoWeb.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert CrosstodoWeb.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{status: 42, text: "some text"}

      assert {:ok, %Task{} = task} = CrosstodoWeb.create_task(valid_attrs)
      assert task.status == 42
      assert task.text == "some text"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CrosstodoWeb.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{status: 43, text: "some updated text"}

      assert {:ok, %Task{} = task} = CrosstodoWeb.update_task(task, update_attrs)
      assert task.status == 43
      assert task.text == "some updated text"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = CrosstodoWeb.update_task(task, @invalid_attrs)
      assert task == CrosstodoWeb.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = CrosstodoWeb.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> CrosstodoWeb.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = CrosstodoWeb.change_task(task)
    end
  end
end
