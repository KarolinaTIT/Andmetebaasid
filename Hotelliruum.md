## ANdmebaas Hotelliruumi reserverimine
```
sql
--1 guest


create table guest(
guestID int Primary Key identity(1,1),
firstname varchar(80),
lastname varchar(80) not null,
membersince DATE);

INSERT INTO guest
VALUES ('Kostja', 'Ivanov','2026-01-10');

SELECT * from guest;
```
****<img width="290" height="84" alt="{8113CC70-8DAC-4DBD-80DE-1D4AC983C882}" src="https://github.com/user-attachments/assets/eea97e5a-fbe7-45a7-9485-475cbdef0ba5" />

```
sql
--2 reservation

create table reservation(
reservationID INT Primary KEY identity(1,1),
date_in DATE,
date_out DATE,
made_by varchar(20) NOT NULL,
guestID int,
FOReign KEY (guestID) REFERENCES guest (guestID));

INSERT INTO reservation
VALUES ('2025-09-05','2025-11-11','ADMIN',2);

SELECT * FROM reservation;
```
<img width="371" height="82" alt="{981C2951-8F0D-4E4B-946E-1D67AEC267C7}" src="https://github.com/user-attachments/assets/573673f6-44f1-4ce6-90ee-237d8af39e04" />

```
sql
--3 room_type
CREATE TABLE room_type(
room_typeID int PRIMARY KEY identity(1,1),
description varchar(80) not null,
max_capacity int);

INSERT INTO room_type
VALUES ('vip', 1);
SELECT * FROM room_type;
```
<img width="267" height="83" alt="{D75DEB5F-98E3-4DB5-B612-F4AEC6384E40}" src="https://github.com/user-attachments/assets/391681f8-9bea-44cf-9549-b18fc8d82375" />

```
sql
--4 room
CREATE TABLE room(
roomID int primary key identity (1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_typeID int,
foreign key (room_typeID) references room_type(room_typeID));

INSERT INTO room 
VALUES  ('B152','class', 'vaba', 2, 1);

SELECT * FROM room;
```
<img width="361" height="80" alt="{AEE3CD40-7A4F-4E39-8C85-4EEDDB2AE1A3}" src="https://github.com/user-attachments/assets/6c0c9f51-2827-4292-8bcd-29c8b4abb8c4" />


```
sql
--5 reserved_room
CREATE TABLE reserved_room(
reserved_roomID int primary key identity (1,1),
number_of_rooms int,
room_typeID int,
reservationID int,
FOREIGN KEY (room_typeID) references room_type(room_typeID),
FOREIGN  key (reservationID) references reservation(reservationID),
stetaus varchar(20));

INSERT INTO reserved_room
VALUES (1,2,1,'not ready');

SELECT * FROM reserved_room
```
<img width="452" height="83" alt="{48DEF9FA-6C82-4F7D-BF51-BAFF48B2DD56}" src="https://github.com/user-attachments/assets/fb687547-93f7-4ba4-9e9a-84b45125a018" />

```
sql
--6 occupied_room
CREATE TABLE occupied_room(
occupied_roomID int PRIMARY KEY identity(1,1),
check_in  DATE,
check_out date,
roomID int,
reservationID int,
FOREIGN KEY (roomID) references room(roomID),
FOREIGN KEY (reservationID) REFERENCES reservation(reservationID));

INSERT INTO occupied_room 
VALUES ('2026-08-10', '2026-07-7',1,1);

SELECT * from  occupied_room;
```
<img width="412" height="87" alt="{BFCE68E0-8EB6-4E0A-9B5C-7B07BDD8D10F}" src="https://github.com/user-attachments/assets/0cd31554-7cf8-42a7-a4cc-cb110b7896b1" />

```
sql
--7 hosted_at
CREATE TABLE hosted_at(
hosted_atID int PRIMARY KEY identity(1,1),
guestID int ,
occupied_roomID int,
FOREIGN KEY (guestID) references guest(guestID),
FOREIGN KEY (occupied_roomID) references occupied_room(occupied_roomID));

INSERT INTO occupied_room 
