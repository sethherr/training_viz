defmodule TrainingViz.Repo.Migrations.CreateTrackPoint do
  use Ecto.Migration

  def change do
    create table(:track_points) do
      add :heartrate, :integer
      add :watts, :integer
      add :cadence, :integer
      add :activity_second, :integer
      add :time_point, :datetime
      add :activity_file_id, references(:activity_files)

      timestamps
    end

  end
end
