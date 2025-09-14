connect to se3db3;

create table Person(
  personID int,
  dateOfBirth char(20),
  personName char(100)
);

create table Rider(
  personID int,
  phoneNum int,
  wheelChairAccess bool
);

create table Driver(
  personID int,
  driverType char(50),
  salary decimal(10,2),
  licenseNum char(10)
);

create table Complaint(
  personID int,
  timeOfSubmission char(50),
  ComplaintCategory char(20)
  foreign key(personID, timeOfSubmission) references Person
);

create table Trip(
  tripID int,
  startTime char(50),
  directionOfTravel char(50),
  wheelChairAccess bool
);

create table ServiceAlert(
  serviceAlertID int,
  description char(1000),
);

create table Route(
  routeID int,
  routeName char(50),
  routeType char(50)
);

create table VehicleBySTM(
  licensePlate char(10),
  VehicleBySTM_Type char(50),
  manufacturedYear int,
  capacity int
);

create table Stop(
  stopID int,
  stopName char(50),
  wheelChairAccess bool,
  stopType char(50)
);

create table WeeklyScheduleBySTM(
  scheduleID int,
  scheduleStartDate char(50),
  scheduleEndDate char(50),
  bitmap char(50)
);




