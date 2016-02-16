defmodule TrainingViz.Factory do
  use ExMachina.Ecto, repo: TrainingViz.Repo

  # def factory(:activity_file) do
  #   %ActivityFile{
  #     activity_type: "bike",
  #     file_name: sequence(:file_name, &"activity_file_#{&1}.tcx"),
  #     end_time: "2010-04-17 14:00:00",
  #     start_time: "2010-04-17 14:00:00",
  #     ride_seconds: 42
  #   }
  # end

  # def factory(:track_point) do
  #   %TrackPoint{
  #     activity_file: build(:activity_file),
  #     time_point: "2016-02-10T02:11:29.000Z",
  #     heartrate: 42,
  #     ride_seconds_in_activity: 42,
  #     watts: 42
  #   }
  # end
end