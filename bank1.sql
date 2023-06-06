create database bank;
use bank;
create table branch(branch_name varchar(20),branch_city varchar(20), assets varchar(20));
create table customer(customer_name varchar(20), customer_street varchar(20), customer_city varchar(20));
create table loan(loan_no int, branch_name varchar(20), amount numeric(10,2));
create table borrower(customer_name varchar(20), loan_no int);
create table account(account_no int, branch_name varchar(20), balance numeric(10,2));
create table depositor(customer_name varchar(20), account_no int);
alter table branch add primary key(branch_name);
insert into branch values('keezhillam','perumbavoor','loan'); 
insert into branch values('mannor','muvattupuzha','security');
insert into branch values('perumbavoor','perumbavoor','loan');
insert into branch values('aluva','aluva','security');
alter table customer add primary key(customer_name);
insert into customer values('pranav','alapuzha','alapuzha');
insert into customer values('aswin','thrissur','thrissur');
insert into customer values('smith','alapuzha','alapuzha');
insert into customer values('hiran','trivandrum','harison');
insert into customer values('jewel','idukki','todupuzha');
alter table loan add primary key(loan_no);
alter table loan add constraint foreign key(branch_name) references branch(branch_name);
insert into loan values(1,'keezhillam',12000.50);
insert into loan values(2,'mannoor',25000.50);
insert into loan values(3,'perumbavoor',35000.55);
insert into loan values(4,'aluva',2222.22);
alter table borrower add constraint foreign key(customer_name) references customer(customer_name);
alter table borrower add constraint foreign key(loan_no) references loan(loan_no);
insert into borrower values('pranav',1);
insert into borrower values('aswin',2);
insert into borrower values('smith',3);
insert into borrower values('hiran',4);
alter table account add primary key(account_no);
alter table account add constraint foreign key(branch_name) references branch(branch_name);
insert into account values(111,'keezhillam',20000.55);
insert into account values(222,'mannoor',10000.11);
insert into account values(333,'perumbavoor',25000.50);
insert into account values(444,'aluva',15000.66);
alter table depositor add constraint foreign key(customer_name) references borrower(customer_name);
alter table depositor add constraint foreign key(account_no) references account(account_no);
insert into depositor values('pranav',111);
insert into depositor values('aswin',222);
insert into depositor values('smith',333);
insert into depositor values('hiran',444);
select * from customer where customer_name not in(select customer_name from borrower); 

select customer_name from customer 
where 
customer_street = (select customer_street from customer where customer_name = "smith") 
and 
customer_city = (select customer_city from customer where customer_name = "Smith") 
and 
customer_name <> "Smith";

select account.branch_name from account,customer,depositor where depositor.account_no= account.account_no and depositor.customer_name=customer.customer_name and customer_city  = "harison";
