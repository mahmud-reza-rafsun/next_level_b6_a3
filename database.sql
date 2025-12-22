create database vehicle_rental_system

  -- users table
create table users(
  user_id int primary key,
  name varchar(100) not null,
  email varchar(50) unique not null,
  phone_number varchar(20) not null,
  password varchar(50) not null,
  role varchar(20) not null
);

-- vehicle table
create table vehicles(
  vehicle_id int primary key,
  name varchar(50) not null,
  type varchar(50) not null,
  model varchar(50) not null,
  registration_number varchar(50) unique not null,
  rental_price decimal(10,2) not null,
  availability_status varchar(50)
);

-- booking table
create table bookings (
  booking_id int primary key,
  user_id INT not null,
  vehicle_id INT not null,
  start_date DATE not null,
  end_date DATE not null,
  booking_status VARCHAR(50) not null,
  total_cost DECIMAL(10,2) not null,

  foreign key (user_id) references users(user_id),
  foreign key (vehicle_id) references vehicles(vehicle_id)
);

-- insert data into users table
insert into users (user_id, name, email, password, phone_number, role) VALUES 
(1, 'Rahim', 'rahim@gmail.com', 'pass123', '01711111111', 'Customer'),
(2, 'Karim', 'karim@admin.com', 'pass456', '01822222222', 'Admin'),
(3, 'Sumon', 'sumon@yahoo.com', 'pass789', '01933333333', 'Customer'),
(4, 'Arif', 'arif@mail.com', 'pass000', '01644444444', 'Customer'),
(5, 'Nabila', 'nabila@gmail.com', 'pass111', '01555555555', 'Customer');

-- insert data into vehicle table
insert into vehicles 
(vehicle_id, name, type, model, registration_number, rental_price, availability_status) 
VALUES 
(1, 'Toyota Corolla', 'car', '2022', 'DHK-111', 2500.00, 'available'),
(2, 'Yamaha R15', 'bike', '2021', 'CTG-222', 1000.00, 'available'),
(3, 'Tata Ace', 'truck', '2020', 'RAJ-333', 5000.00, 'rented'),
(4, 'Honda Civic', 'car', '2023', 'KHL-444', 3000.00, 'available'),
(5, 'Suzuki Gixxer', 'bike', '2022', 'SYL-555', 1200.00, 'maintenance'),
(6, 'Mitsubishi Pajero', 'car', '2021', 'BAR-666', 4500.00, 'available');

-- insert data into bookings table

insert into bookings 
(booking_id, user_id, vehicle_id, start_date, end_date, booking_status, total_cost) 
VALUES 
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 4000.00),
(2, 3, 2, '2023-11-01', '2023-11-03', 'completed', 2000.00),
(3, 4, 2, '2023-12-01', '2023-12-02', 'confirmed', 1000.00), 
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 5000.00),
(5, 5, 3, '2023-11-15', '2023-11-18', 'completed', 15000.00),
(6, 1, 4, '2023-12-20', '2023-12-22', 'confirmed', 6000.00),
(7, 3, 1, '2023-10-25', '2023-10-26', 'completed', 2500.00),
(8, 4, 3, '2023-11-28', '2023-11-30', 'cancelled', 0.00),
(9, 5, 2, '2023-12-15', '2023-12-16', 'confirmed', 1000.00), 
(10, 1, 6, '2023-12-25', '2023-12-27', 'pending', 9000.00);

-- show all users
select 
  user_id, name, email, 
phone_number as phone,
role from users

-- show all vehicle
select 
  vehicle_id, name, type, model, registration_number,
registration_number, rental_price as price,
availability_status as status from vehicles

-- show all bookings
select 
  booking_id, user_id, vehicle_id, start_date,
end_date, booking_status, total_cost from bookings


-- query 1: join
select 
  b.booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  b.start_date,
  b.end_date,
  b.booking_status as status
from bookings b
inner join users u on b.user_id = u.user_id
inner join vehicles v on b.vehicle_id = v.vehicle_id;

-- query 2: exists
select 
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  round(v.rental_price),
  v.availability_status
from vehicles v
where not exists (
  select 1
  from bookings b
  where v.vehicle_id = b.vehicle_id
);

-- query 3: where

select
  vehicle_id,
  name,
  type,
  model,
  registration_number,
  round(rental_price),
  availability_status from vehicles where type = 'car' and 
  availability_status = 'available'

-- query 4: group by and having

select
  vehicles.name as vehicle_name,
  count(*) as total_booking
from bookings inner join vehicles using (vehicle_id)
group by vehicles.name
having count(*) > 2