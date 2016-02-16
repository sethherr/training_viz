defmodule TrainingViz.TrackPointTest do
  use TrainingViz.ModelCase


  alias TrainingViz.TrackPoint

  @valid_attrs %{time_point: "2016-02-10T02:11:29.000Z", activity_file_id: 12}
  @optional_attrs %{heartrate: 42, activity_second: 42, watts: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TrackPoint.changeset(%TrackPoint{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with optional_attrs" do
    changeset = TrackPoint.changeset(%TrackPoint{}, Dict.merge(@valid_attrs, @optional_attrs))
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TrackPoint.changeset(%TrackPoint{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "track_point factory" do
    
  end
end
