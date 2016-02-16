defmodule TrainingViz.ActivityFileTest do
  use TrainingViz.ModelCase

  alias TrainingViz.ActivityFile

  # import TrainingViz.Factory

  @valid_attrs %{activity_type: "Biking", file_name: "2016-02-09_Banner - TrainerRoad_Cycling.tcx"}
  @optional_attrs %{end_time: "2010-04-17 14:00:00", start_time: "2010-04-17 14:00:00", ride_seconds: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ActivityFile.changeset(%ActivityFile{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with optional_attrs" do
    changeset = ActivityFile.changeset(%ActivityFile{}, Dict.merge(@valid_attrs, @optional_attrs))
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ActivityFile.changeset(%ActivityFile{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "parse track_point with heart rate and watts" do
    xml_data = "<Trackpoint>
      <Time>2016-02-10T02:11:29.000Z</Time>
      <DistanceMeters>7.199999809265137</DistanceMeters>
      <HeartRateBpm xsi:type=\"HeartRateInBeatsPerMinute_t\">
        <Value>113</Value>
      </HeartRateBpm>
      <Cadence>102</Cadence>
      <Extensions>
        <TPX xmlns=\"http://www.garmin.com/xmlschemas/ActivityExtension/v2\">
          <Speed>0.0</Speed>
          <Watts>111</Watts>
        </TPX>
      </Extensions>
    </Trackpoint>"

    target = %{heartrate: '113', cadence: '102', watts: '111', time_point: '2016-02-10T02:11:29.000Z'}
    assert(target == ActivityFile.parse_track_point_xml(xml_data))
  end

  test "parse track_point without heart rate or watts" do
    xml_data = "<Trackpoint>
      <Time>2015-12-04T13:40:31.000Z</Time>
      <Position>
        <LatitudeDegrees>41.91991424560547</LatitudeDegrees>
        <LongitudeDegrees>-87.7169189453125</LongitudeDegrees>
      </Position>
      <AltitudeMeters>183.39999389648438</AltitudeMeters>
      <DistanceMeters>0.0</DistanceMeters>
      <Cadence>64</Cadence>
      <Extensions>
        <TPX xmlns=\"http://www.garmin.com/xmlschemas/ActivityExtension/v2\">
          <Speed>0.0</Speed>
        </TPX>
      </Extensions>
    </Trackpoint>"
    target = %{heartrate: nil, cadence: '64', watts: nil, time_point: '2015-12-04T13:40:31.000Z'}
    assert(target == ActivityFile.parse_track_point_xml(xml_data))
  end

  test 'parse_activity_file' do
    result = ActivityFile.parse_tcx_file_path('test/support/activity_file_fixture.tcx')
    IO.inspect(Dict.values(result))
    IO.inspect(result[:track_point])
    assert(result == %{ride_seconds: '2399.0', activity_type: 'Biking', start_time: '2016-02-10T02:11:29.000Z'})
    assert length(result[:track_point]) > 54000
    assert result.first.keys == [:heartrate, :cadence, :watts, :time_point]
  end
end
