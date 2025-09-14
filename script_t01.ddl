connect to se3db3;

-- table about cell phone
create table cellphone(
	maker char(20),
	model char(20),
	version int,
	price decimal(10,2)
);

-- table for playlist
create table playlist(
	artist char(20),
	album char(20),
	song char(20),
	released int
);

insert into cellphone values('Apple', 'iPhone', '13', 1099.99);
insert into cellphone values('Apple', 'iPhone', '12', 899.99);
insert into cellphone values('Samsung', 'Galaxy Fold', '3', 2399.99);
insert into cellphone values('Samsung', 'Galaxy A', '6', 599.99);

insert into playlist values('Coldplay', 'Music of the Spheres', 'My Universe', 2021);
insert into playlist values('Adele', '30', 'Easy On Me', 2021);
insert into playlist values('Adele', '21', 'Someone Like You', 2011);
insert into playlist values('Justin Bieber', 'Purpose', 'Love Yourself', 2015);
insert into playlist values('Billie Eilish', 'Happier Than Ever', 'Getting Older', 2021);

