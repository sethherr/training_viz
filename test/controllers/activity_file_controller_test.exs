defmodule TrainingViz.ActivityFileControllerTest do
  use TrainingViz.ConnCase

  alias TrainingViz.ActivityFile

  @valid_attrs %{activity_type: "some content", end_time: "2010-04-17 14:00:00", file_name: "some content", ride_seconds: 42, start_time: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, activity_file_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing activity files"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, activity_file_path(conn, :new)
    assert html_response(conn, 200) =~ "New activity file"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, activity_file_path(conn, :create), activity_file: @valid_attrs
    assert redirected_to(conn) == activity_file_path(conn, :index)
    assert Repo.get_by(ActivityFile, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, activity_file_path(conn, :create), activity_file: @invalid_attrs
    assert html_response(conn, 200) =~ "New activity file"
  end

  test "shows chosen resource", %{conn: conn} do
    activity_file = Repo.insert! %ActivityFile{}
    conn = get conn, activity_file_path(conn, :show, activity_file)
    assert html_response(conn, 200) =~ "Show activity file"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, activity_file_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    activity_file = Repo.insert! %ActivityFile{}
    conn = get conn, activity_file_path(conn, :edit, activity_file)
    assert html_response(conn, 200) =~ "Edit activity file"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    activity_file = Repo.insert! %ActivityFile{}
    conn = put conn, activity_file_path(conn, :update, activity_file), activity_file: @valid_attrs
    assert redirected_to(conn) == activity_file_path(conn, :show, activity_file)
    assert Repo.get_by(ActivityFile, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    activity_file = Repo.insert! %ActivityFile{}
    conn = put conn, activity_file_path(conn, :update, activity_file), activity_file: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit activity file"
  end

  test "deletes chosen resource", %{conn: conn} do
    activity_file = Repo.insert! %ActivityFile{}
    conn = delete conn, activity_file_path(conn, :delete, activity_file)
    assert redirected_to(conn) == activity_file_path(conn, :index)
    refute Repo.get(ActivityFile, activity_file.id)
  end
end
