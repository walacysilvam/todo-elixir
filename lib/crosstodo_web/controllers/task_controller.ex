defmodule CrosstodoWeb.TaskController do
  use CrosstodoWeb, :controller

  alias Crosstodo.CrosstodoWeb
  alias Crosstodo.CrosstodoWeb.Task

  def index(conn, _params) do
    tasks = CrosstodoWeb.list_tasks()
    changeset = CrosstodoWeb.change_task(%Task{})
    render(conn, "index.html", tasks: tasks, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = CrosstodoWeb.change_task(%Task{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case CrosstodoWeb.create_task(task_params) do
      {:ok, task} ->
        conn
        #|> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = CrosstodoWeb.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, %{"id" => id}) do
    task = CrosstodoWeb.get_task!(id)
    changeset = CrosstodoWeb.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = CrosstodoWeb.get_task!(id)

    case CrosstodoWeb.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = CrosstodoWeb.get_task!(id)
    {:ok, _task} = CrosstodoWeb.delete_task(task)

    conn
    #|> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
