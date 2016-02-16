defmodule TrainingViz.ActivityFile do
  use TrainingViz.Web, :model
  import SweetXml

  schema "activity_files" do
    field :activity_type, :string
    field :file_name, :string
    field :start_time, Ecto.DateTime
    field :end_time, Ecto.DateTime
    field :ride_seconds, :integer

    timestamps
  end

  @required_fields ~w(activity_type file_name)
  @optional_fields ~w(start_time end_time ride_seconds)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def parse_tcx_file_path(file_path) do
    File.stream!(file_path) |> xpath(
        ~x"//TrainingCenterDatabase/Activities/Activity",
          activity_type: ~x"@Sport",
          start_time: ~x"Lap/@StartTime",
          ride_seconds: ~x"Lap/TotalTimeSeconds/text()",
          track_points: [
            ~x"Lap/Track/Trackpoint"l,
              cadence: ~x"Cadence/text()",
              heartrate: ~x"HeartRateBpm/Value/text()",
              watts: ~x"Extensions/TPX/Watts/text()",
              time_point: ~x"Time/text()"
          ]
      )
  end

  def parse_track_point_xml(xml_data) do
    xml_data |> xpath(
      # ~x"//Trackpoint",
        cadence: ~x"Cadence/text()",
        heartrate: ~x"HeartRateBpm/Value/text()",
        watts: ~x"Extensions/TPX/Watts/text()",
        time_point: ~x"Time/text()"
      )
  end
end
