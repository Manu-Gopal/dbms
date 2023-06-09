create database shop;
use shop;
create table product(pdtid int primary key, pname varchar(20), price int, qtyinstock int);
create table sale(saleid int primary key, deliveryaddress varchar(50));
create table saleitem(saleid int, pdtid int, qty int);

alter table saleitem add constraint foreign key(saleid) references sale(saleid);
alter table saleitem add constraint foreign key(pdtid) references product(pdtid);
create table productUpdate(pdtid int primary key, pname varchar(20), price int, qtyinstock int, action varchar(50) default null);
insert into product values(1, "chips", 50, 20);

DELIMITER //
create trigger updateAvailableQuantity
after insert on saleitem for each row
begin
	update product, saleitem
    set 
    product.qtyinstock = product.qtyinstock - saleitem.qty where product.pdtid = saleitem.pdtid;
    
end //
DELIMITER ;

select * from product;

insert into sale values(2,'Gopal house');
insert into saleitem values(2, 1, 5);