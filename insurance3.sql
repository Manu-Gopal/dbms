use insurance;
select * from person where name like 'a%';
select * from participated where damage_amount>30000;
alter table accident modify date date;
alter table accident drop column date;
alter table accident add column date date;
select * from accident where date between '2021-01-01' and '2023-12-31';
select vehicle.licence, model, year, name, address from vehicle,person,owns where owns.driver_id=person.driver_id and owns.licence=vehicle.licence;