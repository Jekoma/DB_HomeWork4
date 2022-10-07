CREATE TABLE "Station" (
  "Name" char(128) PRIMARY KEY,
  "City_id" int,
  "tracks" char(128)
);

CREATE TABLE "TrainStop" (
  "TrainNR" int,
  "Station_name" char(128),
  "Next_station_name" char(128),
  "Departure_time" int,
  "Arrival_time" int,
  PRIMARY KEY ("TrainNR", "Station_name", "Next_station_name")
);

CREATE TABLE "City" (
  "Name" char(128),
  "Region" char(128),
  PRIMARY KEY ("Name", "Region")
);

CREATE TABLE "Train" (
  "TrainNR" int PRIMARY KEY,
  "Start_station_id" int,
  "End_station_id" int,
  "Length" int
);

ALTER TABLE "TrainStop" ADD FOREIGN KEY ("TrainNR") REFERENCES "Train" ("TrainNR");

ALTER TABLE "TrainStop" ADD FOREIGN KEY ("Station_name") REFERENCES "Station" ("Name");

ALTER TABLE "TrainStop" ADD FOREIGN KEY ("Next_station_name") REFERENCES "Station" ("Name");

ALTER TABLE "Train" ADD FOREIGN KEY ("Start_station_id") REFERENCES "Station" ("tracks");

ALTER TABLE "Train" ADD FOREIGN KEY ("End_station_id") REFERENCES "Station" ("tracks");

ALTER TABLE "Station" ADD FOREIGN KEY ("Name") REFERENCES "City" ("Name");
