defmodule TrainingViz.TrackPointControllerTest do
  use TrainingViz.ConnCase

  # alias TrainingViz.TrackPoint
  # @valid_attrs %{file_name: "some content", heartrate: 42, ride_time: 42, watts: 42}
  # @invalid_attrs %{}

  # test "lists all entries on index", %{conn: conn} do
  #   conn = get conn, track_point_path(conn, :index)
  #   assert html_response(conn, 200) =~ "Listing track points"
  # end

  # test "renders form for new resources", %{conn: conn} do
  #   conn = get conn, track_point_path(conn, :new)
  #   assert html_response(conn, 200) =~ "New track point"
  # end

  # test "creates resource and redirects when data is valid", %{conn: conn} do
  #   conn = post conn, track_point_path(conn, :create), track_point: @valid_attrs
  #   assert redirected_to(conn) == track_point_path(conn, :index)
  #   assert Repo.get_by(TrackPoint, @valid_attrs)
  # end

  # test "does not create resource and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, track_point_path(conn, :create), track_point: @invalid_attrs
  #   assert html_response(conn, 200) =~ "New track point"
  # end

  # test "shows chosen resource", %{conn: conn} do
  #   track_point = Repo.insert! %TrackPoint{}
  #   conn = get conn, track_point_path(conn, :show, track_point)
  #   assert html_response(conn, 200) =~ "Show track point"
  # end

  # test "renders page not found when id is nonexistent", %{conn: conn} do
  #   assert_error_sent 404, fn ->
  #     get conn, track_point_path(conn, :show, -1)
  #   end
  # end

  # test "renders form for editing chosen resource", %{conn: conn} do
  #   track_point = Repo.insert! %TrackPoint{}
  #   conn = get conn, track_point_path(conn, :edit, track_point)
  #   assert html_response(conn, 200) =~ "Edit track point"
  # end

  # test "updates chosen resource and redirects when data is valid", %{conn: conn} do
  #   track_point = Repo.insert! %TrackPoint{}
  #   conn = put conn, track_point_path(conn, :update, track_point), track_point: @valid_attrs
  #   assert redirected_to(conn) == track_point_path(conn, :show, track_point)
  #   assert Repo.get_by(TrackPoint, @valid_attrs)
  # end

  # test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #   track_point = Repo.insert! %TrackPoint{}
  #   conn = put conn, track_point_path(conn, :update, track_point), track_point: @invalid_attrs
  #   assert html_response(conn, 200) =~ "Edit track point"
  # end

  # test "deletes chosen resource", %{conn: conn} do
  #   track_point = Repo.insert! %TrackPoint{}
  #   conn = delete conn, track_point_path(conn, :delete, track_point)
  #   assert redirected_to(conn) == track_point_path(conn, :index)
  #   refute Repo.get(TrackPoint, track_point.id)
  # end
end
