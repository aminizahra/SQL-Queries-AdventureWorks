--Related to session3:

create table Sample_2 (id int , name varchar(10) , family varchar (20))

insert into Sample_2 (id,name,family)
values (3,'ali','akbari'),
	   (2,'maryam','ehsani'),
	   (2,'maryam','ehsani')

insert into Sample_2
values (4,'neda','amiri'),
	(5,'hasan','elahi')

insert into Sample_2
values (6,'amiri')

insert into Sample_2 (id,family)
values (6,'amiri')

select * from Sample_2

create table Sample_id (id int identity , fname varchar(30)) 

insert into Sample_id (fname)
values ('elnaz')

insert into Sample_id 
values (5)

insert into Sample_id 
values ('')

insert into Sample_id 
values ('sql')

select * from Sample_id
go

ALTER TABLE Sample_2 ADD mid_name varchar(20) 

-- address : varchar(2000)
-- fax: int
go

ALTER TABLE Sample_2 ADD phone int

ALTER TABLE Sample_2 alter column phone bigint ;

go 

ALTER table sample_2 drop column Phone ;

go

Truncate Table Sample_2

go