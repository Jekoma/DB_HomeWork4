CREATE TABLE "Station" (
  "StationNR" int PRIMARY KEY,
  "Name" char(128)
);

CREATE TABLE "Room" (
  "RoomNR" int,
  "StationNR" int,
  "Beds" int,
  PRIMARY KEY ("RoomNR", "StationNR")
);

CREATE TABLE "Admission" (
  "Patient_id" int PRIMARY KEY,
  "Room_id" int,
  "From" char(128),
  "To" char(128)
);

CREATE TABLE "Patient" (
  "PatientNR" int PRIMARY KEY,
  "DoctorNR" int,
  "Name" char(128),
  "Desease" char(128)
);

CREATE TABLE "Doctor" (
  "PersNR" int PRIMARY KEY,
  "Area" char(128),
  "Rank" char(128)
);

CREATE TABLE "Careginer" (
  "PersNR" int PRIMARY KEY,
  "Qualifications" char(128)
);

CREATE TABLE "PersStation" (
  "PersNR" int PRIMARY KEY,
  "StatNR" int,
  "Name" char(128)
);

ALTER TABLE "Admission" ADD FOREIGN KEY ("Room_id") REFERENCES "Room" ("RoomNR");

ALTER TABLE "Patient" ADD FOREIGN KEY ("PatientNR") REFERENCES "Admission" ("Patient_id");

ALTER TABLE "Patient" ADD FOREIGN KEY ("PatientNR") REFERENCES "Doctor" ("PersNR");

ALTER TABLE "PersStation" ADD FOREIGN KEY ("PersNR") REFERENCES "Doctor" ("PersNR");

ALTER TABLE "PersStation" ADD FOREIGN KEY ("PersNR") REFERENCES "Careginer" ("PersNR");

ALTER TABLE "Room" ADD FOREIGN KEY ("StationNR") REFERENCES "Station" ("StationNR");

ALTER TABLE "PersStation" ADD FOREIGN KEY ("StatNR") REFERENCES "Station" ("StationNR");
