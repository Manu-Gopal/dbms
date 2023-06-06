create database company;
use company;
CREATE TABLE jobs(job_id int primary key, job_title VARCHAR(100), min_salary FLOAT  , max_salary FLOAT);
CREATE TABLE employees( employee_id INT primary key, first_name VARCHAR(100), last_name VARCHAR(100), email VARCHAR(100), phone_number BIGINT, hire_date DATE, job_id INT , salary FLOAT, manager_id INT,department_id INT);

CREATE TABLE dependents( dependent_id INT primary key, first_name VARCHAR(100) , last_name VARCHAR(100), relationship VARCHAR(50), employee_id INT); 

CREATE TABLE departments( department_id INT primary key , department_name VARCHAR(150) , location_id INT); 

CREATE TABLE locations ( location_id INT primary key , street_address TEXT NOT NULL , postal_code VARCHAR(50) NOT NULL , city VARCHAR(100) NOT NULL , state_province VARCHAR(100) , country_id INT); 

CREATE TABLE countries ( country_id INT primary key , country_name VARCHAR(150)  , region_id INT ); 

CREATE TABLE regions ( region_id INT primary key, region_name TEXT);

ALTER TABLE `dependents` ADD FOREIGN KEY (`employee_id`) REFERENCES `employees`(`employee_id`) ;

ALTER TABLE `departments` ADD FOREIGN KEY (`location_id`) REFERENCES `locations`(`location_id`) ;

ALTER TABLE `locations` ADD FOREIGN KEY (`country_id`) REFERENCES `countries`(`country_id`) ;

ALTER TABLE `countries` ADD FOREIGN KEY (`region_id`) REFERENCES `regions`(`region_id`) ;

ALTER TABLE `employees` ADD FOREIGN KEY (`department_id`) REFERENCES `departments`(`department_id`) ;

INSERT INTO regions VALUES
(1, 'Europe'),
(2, 'Americas');

INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES
(1, 'PublicAccountant', 4200, 9000),
(2, 'AccountingManager', 8200, 16000);

INSERT INTO countries VALUES
(11, 'Argentina', 1),
(22, 'Australia', 2);

INSERT INTO `locations` (`location_id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES
(1400, '2014 Jabberwocky Rd', '26192', 'Southlake’', ' Texas', 11),
(1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 22);

INSERT INTO `departments` (`department_id`, `department_name`, `location_id`) VALUES
(1, 'Administration', 1400),
(2, 'Marketing', 1500);

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `manager_id`, `department_id`) VALUES
(100, 'Steven', 'King', 'steven.king@sqltutorial.org', '5151234567', '1987-06-17', 1, 24000, 100, 1),
(101, 'Neena', 'Kochhar', 'neena.kochhar@sqltutorial.org', '5151234568', '1989-09-21', 2, 17000, 100, 2);

INSERT INTO `dependents` (`dependent_id`, `first_name`, `last_name`, `relationship`, `employee_id`) VALUES
(1, 'Penelope', 'Gietz', 'Child', 100),
(2, 'Nick', 'Higgins', 'Child', 101);





