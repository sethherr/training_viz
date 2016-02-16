defmodule TrainingViz.TrackPoint do
  use TrainingViz.Web, :model

  schema "track_points" do
    field :heartrate, :integer
    field :watts, :integer
    field :activity_second, :integer
    field :time_point, Ecto.DateTime
    belongs_to :activity_file, TrainingViz.ActivityFile

    timestamps
  end

  @required_fields ~w(activity_file_id time_point)
  @optional_fields ~w(activity_second heartrate watts)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
