defmodule TrainingViz.ActivityFileController do
  use TrainingViz.Web, :controller

  alias TrainingViz.ActivityFile

  plug :scrub_params, "activity_file" when action in [:create, :update]

  def index(conn, _params) do
    activity_files = Repo.all(ActivityFile)
    render(conn, "index.html", activity_files: activity_files)
  end

  def new(conn, _params) do
    changeset = ActivityFile.changeset(%ActivityFile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"activity_file" => activity_file_params}) do
    changeset = ActivityFile.changeset(%ActivityFile{}, activity_file_params)

    case Repo.insert(changeset) do
      {:ok, _activity_file} ->
        conn
        |> put_flash(:info, "Activity file created successfully.")
        |> redirect(to: activity_file_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    activity_file = Repo.get!(ActivityFile, id)
    render(conn, "show.html", activity_file: activity_file)
  end

  def edit(conn, %{"id" => id}) do
    activity_file = Repo.get!(ActivityFile, id)
    changeset = ActivityFile.changeset(activity_file)
    render(conn, "edit.html", activity_file: activity_file, changeset: changeset)
  end

  def update(conn, %{"id" => id, "activity_file" => activity_file_params}) do
    activity_file = Repo.get!(ActivityFile, id)
    changeset = ActivityFile.changeset(activity_file, activity_file_params)

    case Repo.update(changeset) do
      {:ok, activity_file} ->
        conn
        |> put_flash(:info, "Activity file updated successfully.")
        |> redirect(to: activity_file_path(conn, :show, activity_file))
      {:error, changeset} ->
        render(conn, "edit.html", activity_file: activity_file, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    activity_file = Repo.get!(ActivityFile, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(activity_file)

    conn
    |> put_flash(:info, "Activity file deleted successfully.")
    |> redirect(to: activity_file_path(conn, :index))
  end
end
