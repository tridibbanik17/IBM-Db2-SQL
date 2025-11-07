-- Name: Tridib Banik
-- Student# 400514461

connect to se3db3;

-- Q1
select TripID, count(*) as NumComplaints from Complaints group by tripID having count(*) > 2 order by count(*) desc;

-- Q2
select distinct p.PersonID, p.name from Person p join Drivers d on d.PersonID = p.PersonID join Trips t on t.DriverID = d.PersonID join Complaints c on c.TripID = t.TripID where c.Category = 'driver conduct' and c.Timestamp between '2024-11-01' and '2024-11-10' order by p.PersonID asc;

-- Q3
select r.RouteID, r.Name, count(distinct ri.PersonID) as NumRiders from Routes r join Trips t on r.RouteID = t.RouteID join Takes tk on t.TripID = tk.TripID join Riders ri on tk.RiderID = ri.PersonID where tk.Date between '2024-11-01' and '2024-12-31' group by r.RouteID, r.Name order by NumRiders desc;

-- Q4
select distinct r.Name from Routes r join Trips t on r.RouteID = t.RouteID join Stoptimes st on t.TripID = st.TripID join Stops s on st.StopID = s.StopID where s.SubwayStation = 'STATION_M140';

-- Q5
select ri.PersonID from Riders ri where ri.PersonID not in (select tk.RiderID from Takes tk join Trips t on tk.TripID = t.TripID where tk.Date between '2024-12-01' and '2024-12-31') order by ri.PersonID asc;

-- Q6
select distinct r.Name from Routes r join Trips t on r.RouteID = t.RouteID join ScheduleDays s on t.ScheduleID = s.ScheduleID where (s.ScheduleBitmap & 5) <> 5 group by r.Name having count(t.TripID) >= 1;

-- Q7
select p1.Name as RiderName, c.Timestamp as ComplaintTime, c.Category as ComplaintCategory, p2.Name as DriverName, d.LicenseNo as LicenseNo, r.Name as RouteName, t.Direction as Direction from Person p1 join Riders ri on p1.PersonID = ri.PersonID join Complaints c on ri.PersonID = c.RiderID join Trips t on c.TripID = t.TripID join Drivers d on t.DriverID = d.PersonID join Person p2 on d.PersonID = p2.PersonID join Routes r on t.RouteID = r.RouteID where c.Category = 'overcrowding' and c.Timestamp between '2024-12-18-00.00.00.000000' and '2024-12-18-23.59.59.999999' and ri.PersonID = 1313; 

-- Q8
select p1.Name as DriverName, count(distinct t.TripID) as TotalTrips, count(tk.RiderID) as TotalPassengers from Trips t join Takes tk on t.TripID = tk.TripID join Riders ri on tk.RiderID = ri.PersonID join Person p1 on t.DriverID = p1.PersonID join Drivers d on p1.PersonID = d.PersonID join ScheduleDays s on t.ScheduleID = s.ScheduleID where (s.StartDate <= '20241231' and s.EndDate >= '20241028') and s.ScheduleBitmap = 124 group by p1.Name having count(tk.RiderID) >= 800 order by TotalTrips desc;
