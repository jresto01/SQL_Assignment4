--Stored function to insert data into the salesperson table.
create or replace function add_salesperson(_salesperson_id INTEGER, _first_name VARCHAR,
_last_name VARCHAR, _email VARCHAR, _phone VARCHAR)
returns VOID
as $MAIN$
begin
	insert into salesperson(salesperson_id,first_name,last_name,email,phone)
	VALUES(_salesperson_id,_first_name,_last_name,_email,_phone);
end;
$MAIN$
language plpgsql;

--Call to function add_salesperson
select add_salesperson(1, 'Luis', 'Garcia', 'luilugar@cardealership.com', '210-799-1405');
select add_salesperson(2, 'Geisha', 'Ortiz', 'geishao@cardealership.com', '210-247-5089');
select add_salesperson(3, 'Anthony', 'Smith', 'tony.smith@cardealership.com', '210-512-9834');
select add_salesperson(4, 'Mckenzie', 'Flores', 'mk.flores@cardealership.com', '936-513-1368');
select add_salesperson(5, 'Ashley', 'Delage', 'ash_delage@cardealership.com', '512-210-2010');

--Delete/drop the add_salesperson function
drop function add_salesperson;

----Stored function to insert data into the mechanic table.
create or replace function add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR,
_last_name VARCHAR, _email VARCHAR, _phone VARCHAR, _address VARCHAR)
returns VOID
as $MAIN$
begin
	insert into mechanic(mechanic_id,first_name,last_name,email,phone,address)
	VALUES(_mechanic_id,_first_name,_last_name,_email,_phone,_address);
end;
$MAIN$
language plpgsql;

--Call to function add_mechanic
select add_mechanic(1, 'Louis', 'Banks', 'lbnk190@yahoo.com', '512-356-0981', 
'7400 San Pedro Ave San Antonio TX 78249');
select add_mechanic(2, 'Roberto', 'Ramos', 'robramos@outlook.com', '773-998-8761', 
'14614 La Canter Hway San Antonio TX 78257');
select add_mechanic(3, 'Shavon', 'Browns', 'shavibrown9@msn.com', '956-998-8761', 
'2601 Preston Rd San Marcos TX 75034');

--Delete/drop the add_mechanic function
drop function add_mechanic;

----Stored function to insert data into the mechanic table.
create or replace function add_customer(_customer_id INTEGER, _first_name VARCHAR,
_last_name VARCHAR, _email VARCHAR, _phone VARCHAR, _address VARCHAR)
returns VOID
as $MAIN$
begin
	insert into customer(customer_id,first_name,last_name,email,phone,address)
	VALUES(_customer_id,_first_name,_last_name,_email,_phone,_address);
end;
$MAIN$
language plpgsql;

--Call to function add_customer
select add_customer(1, 'Ofelia', 'Sanchez', 'odelia.sanzhez2000@google', '956-312-9591', 
'56571 Sea Salt Dr Austin TX 78747');
select add_customer(2, 'Javier', 'Resto', 'j.resto.delgado@gmail.com', '787-247-5089', 
'74614 Vance Jackson Rd San Antonio TX 78249');
select add_customer(3, 'Lauren', 'Rato', 'laurenburns@ymail.com', '512-226-2013', 
'7611 Preston Rd Frisco TX 75022');
select add_customer(4, 'Erin', 'Vela', 'e.vela22@outlook.com', '210-226-5101', 
'15012 UTSA BLVD San Antonio TX 78249');
select add_customer(5, 'Hannah', 'Hernandez', 'han.hernandez@yahoo.com', '979-238-6390', 
'2760 IH 35N New Braunfels TX 78130');

--Delete/drop the add_customer function
drop function add_customer;

----Stored function to insert data into the car table.
create or replace function add_car(_car_serial_number VARCHAR, _make VARCHAR, _model VARCHAR,
_year INTEGER, _color VARCHAR, _condition VARCHAR, _customer_id INTEGER)
returns VOID
as $MAIN$
begin
	insert into car(car_serial_number,make,model,year,color,condition,customer_id )
	VALUES(_car_serial_number,_make,_model,_year,_color,_condition,_customer_id);
end;
$MAIN$
language plpgsql;

--Call to function add_car
select add_car('1HGBH41JXMN109186', 'Toyota', 'CH-r', 2021, 'Red', 'New', 2);
select add_car('1RUBG62JLQP984563', 'Hyundai', 'Veloster', 2019, 'Silver', 'Used', null);
select add_car('3GPSX87LPBD990022', 'Lexus', 'LX350', 2023, 'Black', 'New', null);
select add_car('2LPBG45JMPL734571', 'Lexus', 'RX 350h Premium', 2019, 'White', 'New', null);
select add_car('1GPXH49QXQP095590', 'Honda', 'CR-V EX', 2022, 'Gray', 'Used', 1);
select add_car('2LPXV54MNLP467863', 'Honda', 'HR-V', 2022, 'Midnight Blue', 'Used', null);
select add_car('1VGXZ72PQLM761782', 'Lexus', 'RC 300', 2023, 'White', 'Used', 2);
select add_car('1ZMNG12HXZX036544', 'Ford', 'Bronco', 2024, 'Ruby red', 'New', 4);
select add_car('3BGSS17FHQZ238875', 'Mazda', 'MX-5', 2023, 'Black', 'New', 5);
select add_car('2AZBX25KYQM724071', 'Mitsubishi', 'Outlander', 2022, 'White diamond', 'Used', 3);

--Delete/drop the add_car function
drop function add_car;

----Stored function to insert data into the invoice table.
create or replace function add_invoice(_invoice_id INTEGER, _amount DECIMAL, 
_salesperson_id INTEGER, _customer_id INTEGER, _invoice_date TIMESTAMP without TIME zone)
returns VOID
as $MAIN$
begin
	insert into invoice(invoice_id,amount,salesperson_id,customer_id,invoice_date)
	VALUES(_invoice_id,_amount,_salesperson_id,_customer_id,_invoice_date);
end;
$MAIN$
language plpgsql;

--Call to function add_invoice
select add_invoice( 1, 29150.00, 4, 2, NOW()::TIMESTAMP);
select add_invoice( 2, 39275.99, 2, 1, NOW()::TIMESTAMP);
select add_invoice( 3, 79275.99, 1, 2, NOW()::TIMESTAMP);
select add_invoice( 4, 59300.99, 3, 4, '2023-10-29 15:42:00');
select add_invoice( 5, 49000.00, 4, 5, '2023-10-31 11:26:00');
select add_invoice( 6, 29100.99, 2, 3, '2023-10-28 13:47:00');

--Delete/drop the add_invoice function
drop function add_invoice;

----Stored function to insert data into the parts table.
create or replace function add_parts(_part_id INTEGER, _part_name VARCHAR, 
_description VARCHAR, _cost DECIMAL)
returns VOID
as $MAIN$
begin
	insert into parts(part_id,part_name,description,cost)
	VALUES(_part_id,_part_name,_description,_cost);
end;
$MAIN$
language plpgsql;

--Call to function add_invoice
select add_parts( 1, 'Goodyear', 'SUV Tires 195/60r15 88V', 199.99);
select add_parts( 2, 'Michelin', '16" Tires 225/60 16', 99.99);
select add_parts( 3, 'Duralast Breaks', 'PS Caliper 19-B6689NM', 104.99);
select add_parts( 4, 'Bosch Prime', '22in Wiper Blade', 39.99);

--Delete/drop the add_parts function
drop function add_parts;

----Stored function to insert data into the service_ticket table.
create or replace function add_service_ticket(_ticket_id INTEGER, _customer_id INTEGER, 
_details VARCHAR, _amount_paid DECIMAL, _car_serial_number VARCHAR, 
_service_date TIMESTAMP without TIME zone)
returns VOID
as $MAIN$
begin
	insert into service_ticket(ticket_id,customer_id,details,amount_paid,car_serial_number,service_date)
	VALUES(_ticket_id,_customer_id,_details,_amount_paid,_car_serial_number,_service_date);
end;
$MAIN$
language plpgsql;

--Call to function add_service_ticket
select add_service_ticket( 1, 2, 'Tires change', 267.98, '1VGXZ72PQLM761782', 
'2023-11-01 09:15:00');
select add_service_ticket( 2, 3, 'Complementary 20K Miles Maintenance', 0.00, 
'2AZBX25KYQM724071', '2023-11-02 14:30:00');
select add_service_ticket( 3, 4, 'Breaks and wiper blades replacement', 199.99, 
'1ZMNG12HXZX036544', '2023-11-02 17:25:00');

--Delete/drop the add_service_ticket function
drop function add_service_ticket;

----Stored function to insert data into the serviceTicket_parts table.
create or replace function add_serviceTicket_parts(_ticket_id INTEGER, _part_id INTEGER, 
_quantity INTEGER)
returns VOID
as $MAIN$
begin
	insert into serviceTicket_parts(ticket_id,part_id,quantity)
	VALUES(_ticket_id,_part_id,_quantity);
end;
$MAIN$
language plpgsql;

--Call to function add_serviceTicket_parts
select add_serviceTicket_parts( 1, 2, 2);
select add_serviceTicket_parts( 3, 3, 4);
select add_serviceTicket_parts( 3, 4, 2);

--Delete/drop the add_service_ticket function
drop function add_serviceTicket_parts;

----Stored function to insert data into the service_record table.
create or replace function add_service_record(_record_id INTEGER, _car_serial_number VARCHAR, 
_mechanic_id INTEGER, _ticket_id INTEGER, _service_details VARCHAR)
returns VOID
as $MAIN$
begin
	insert into service_record(record_id,car_serial_number,mechanic_id,ticket_id,service_details)
	VALUES(_record_id,_car_serial_number,_mechanic_id,_ticket_id,_service_details);
end;
$MAIN$
language plpgsql;

--Call to function add_service_record
select add_service_record( 1, '1VGXZ72PQLM761782', 2, 1, 'Front and Rear Tires Replacement');
select add_service_record( 1, '1VGXZ72PQLM761782', 3, 1, 'Front and Rear Tires Replacement');
select add_service_record( 2, '2AZBX25KYQM724071', 1, 2, 'Oil Change, tire rotation, car fluid check');
select add_service_record( 3, '1ZMNG12HXZX036544', 2, 3, 'Replaced front breaks and wiper blades');

--Delete/drop the add_service_record function
drop function add_service_record;


select * from car;
select * from customer;
select * from salesperson;
select * from invoice;
select * from parts;
select * from service_ticket;
select * from serviceTicket_parts;
select * from service_record;
select * from mechanic;







