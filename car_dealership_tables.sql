--Car Dealership database.
--Salesperson table
create table salesperson(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(15)
);

--Customer table
create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(15),
	address VARCHAR(150)
);

--Mechanic table
create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(15),
	address VARCHAR(150)
);

--Invoice table
create table invoice(
	invoice_id SERIAL primary key,
	amount DECIMAL(10,2),
	salesperson_id INTEGER not null,
	customer_id INTEGER not null,
	invoice_date TIMESTAMP,
	foreign KEY(salesperson_id) references salesperson(salesperson_id),
	foreign KEY(customer_id) references customer(customer_id)
);

--Parts table
create table parts(
	part_id SERIAL primary key,
	part_name VARCHAR(100),
	description VARCHAR(200),
	cost DECIMAL(10,2)
);

--Car table 
create table car(
	car_serial_number VARCHAR(20) primary key,
	make VARCHAR(100),
	model VARCHAR(100),
	year VARCHAR(5),
	color VARCHAR(15),
	condition VARCHAR(15),
	customer_id INTEGER,
	foreign KEY(customer_id) references customer(customer_id)
);

--Service_ticket table 
create table service_ticket(
	ticket_id SERIAL primary key,
	customer_id INTEGER not null,
	details VARCHAR(200),
	amount_paid DECIMAL(10,2),
	car_serial_number VARCHAR not null,
	service_date TIMESTAMP,
	foreign KEY(customer_id) references customer(customer_id),
	foreign KEY(car_serial_number) references car(car_serial_number)
);

--ServiceTicket_parts table
create table serviceTicket_parts(
	ticket_id INTEGER not null,
	part_id INTEGER not null,
	quantity INTEGER,
	foreign KEY(ticket_id) references service_ticket(ticket_id),
	foreign KEY(part_id) references parts(part_id)
);

--Service_record table
create table service_record(
	record_id SERIAL,
	car_serial_number VARCHAR(20) not null,
	mechanic_id INTEGER not null,
	ticket_id INTEGER not null, 
	service_details VARCHAR(200),
	primary KEY(record_id, mechanic_id),
	foreign KEY(car_serial_number) references car(car_serial_number),
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign KEY(ticket_id) references service_ticket(ticket_id)
);