defmodule TrainingViz.TrackPointController do
  use TrainingViz.Web, :controller

  alias TrainingViz.TrackPoint

  plug :scrub_params, "track_point" when action in [:create, :update]

  def index(conn, _params) do
    track_points = Repo.all(TrackPoint)
    render(conn, "index.html", track_points: track_points)
  end

  def new(conn, _params) do
    changeset = TrackPoint.changeset(%TrackPoint{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"track_point" => track_point_params}) do
    changeset = TrackPoint.changeset(%TrackPoint{}, track_point_params)

    case Repo.insert(changeset) do
      {:ok, _track_point} ->
        conn
        |> put_flash(:info, "Track point created successfully.")
        |> redirect(to: track_point_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    track_point = Repo.get!(TrackPoint, id)
    render(conn, "show.html", track_point: track_point)
  end

  def edit(conn, %{"id" => id}) do
    track_point = Repo.get!(TrackPoint, id)
    changeset = TrackPoint.changeset(track_point)
    render(conn, "edit.html", track_point: track_point, changeset: changeset)
  end

  def update(conn, %{"id" => id, "track_point" => track_point_params}) do
    track_point = Repo.get!(TrackPoint, id)
    changeset = TrackPoint.changeset(track_point, track_point_params)

    case Repo.update(changeset) do
      {:ok, track_point} ->
        conn
        |> put_flash(:info, "Track point updated successfully.")
        |> redirect(to: track_point_path(conn, :show, track_point))
      {:error, changeset} ->
        render(conn, "edit.html", track_point: track_point, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    track_point = Repo.get!(TrackPoint, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(track_point)

    conn
    |> put_flash(:info, "Track point deleted successfully.")
    |> redirect(to: track_point_path(conn, :index))
  end
end
