connect to se3db3;

create table Person(
  personID int not null,
  dateOfBirth date,
  personName VARCHAR(100),
  primary key(personID)
);

create table Rider(
  personID int not null,
  phoneNum VARCHAR(15),
  wheelChairAccess smallint,
  primary key(personID),
  foreign key(personID) references Person(personID)
);

create table Driver(
  personID int not null,
  driverType VARCHAR(50),
  salary decimal(10,2),
  licenseNum VARCHAR(10),
  primary key(personID),
  foreign key(personID) references Person(personID)
);

create table Complaint(
  personID int not null,
  timeOfSubmission timestamp not null,
  ComplaintCategory VARCHAR(20),
  primary key(personID, timeOfSubmission),
  foreign key(personID) references Person(personID)
);

create table Route(
  routeID int not null,
  routeName VARCHAR(50),
  routeType VARCHAR(50),
  primary key(routeID)
);

create table VehicleBySTM(
  licensePlate VARCHAR(10) not null,
  VehicleBySTM_Type VARCHAR(50),
  manufacturedYear int,
  capacity int,
  primary key(licensePlate)
);

create table WeeklyScheduleBySTM(
  scheduleID int not null,
  scheduleStartDate date,
  scheduleEndDate date,
  bitmap VARCHAR(50),
  primary key(scheduleID)
);

create table Trip(
  tripID int not null,
  routeID int not null,
  personID int not null,
  scheduleID int not null,
  licensePlate VARCHAR(10) not null,
  startTime timestamp,
  directionOfTravel VARCHAR(50),
  wheelChairAccess smallint,
  primary key(tripID),
  foreign key(routeID) references Route(routeID),
  foreign key(personID) references Driver(personID),
  foreign key(scheduleID) references WeeklyScheduleBySTM(scheduleID),
  foreign key(licensePlate) references VehicleBySTM(licensePlate)
);

create table SubmittedFor(
  personID int not null,
  timeOfSubmission timestamp not null,
  tripID int not null,
  primary key(personID, timeOfSubmission, tripID),
  foreign key(personID, timeOfSubmission) references Complaint(personID, timeOfSubmission),
  foreign key(tripID) references Trip(tripID)
);

create table Takes(
  personID int not null,
  tripID int not null,
  dateOfTrip date,
  primary key(personID, tripID),
  foreign key(personID) references Person(personID),
  foreign key(tripID) references Trip(tripID)
);

create table ServiceAlert(
  serviceAlertID int not null,
  description VARCHAR(1000),
  primary key(serviceAlertID)
);

create table Notifies(
  personID int not null,
  serviceAlertID int not null,
  primary key(personID, serviceAlertID),
  foreign key(personID) references Person(personID),
  foreign key(serviceAlertID) references ServiceAlert(serviceAlertID)
);

create table Issues(
  serviceAlertID int not null,
  routeID int not null,
  startDate date,
  endDate date,
  primary key(serviceAlertID, routeID),
  foreign key(serviceAlertID) references ServiceAlert(serviceAlertID),
  foreign key(routeID) references Route(routeID)
);

create table Stop(
  stopID int not null,
  stopName VARCHAR(50),
  wheelChairAccess smallint,
  stopType VARCHAR(50),
  primary key(stopID)
);

create table Serves(
  tripID int not null,
  stopID int not null,
  arrivalTime timestamp,
  sequenceNumber int,
  primary key(tripID, stopID),
  foreign key(tripID) references Trip(tripID),
  foreign key(stopID) references Stop(stopID)
);

connect reset;


