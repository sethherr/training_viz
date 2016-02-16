defmodule TrainingViz.Repo.Migrations.CreateActivityFile do
  use Ecto.Migration

  def change do
    create table(:activity_files) do
      add :activity_type, :string
      add :file_name, :string
      add :start_time, :datetime
      add :end_time, :datetime
      add :ride_seconds, :integer

      timestamps
    end

  end
end
