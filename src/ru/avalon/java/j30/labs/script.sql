/*
 * Опишисан процесс создания базы данных
 * 1. Созданы все таблицы, согласно предложенной диаграмме.
 * 2. Опишисаны все необходимые отношения между таблицами.
 * 3. Добавлены в каждую таблицу минимум три записи.
 */

create table Roles
(
id int generated always as identity(start with 1, increment by 1),
name varchar(255) not null,
constraint pk_roles primary key(name),
constraint uk_id_roles unique (id) 
)

insert into roles (name) values ('role1');
insert into roles (name) values ('role2');
insert into roles (name) values ('role3');

create table Userinfo
(
id int generated always as identity(start with 1, increment by 1),
name varchar(255) not null,
surname varchar(255)not null,
constraint pk_userinfo primary key(id)
)

insert into userinfo (name, surname) values ('name1', 'surname1');
insert into userinfo (name, surname) values ('name2', 'surname2');
insert into userinfo (name, surname) values ('name3', 'surname3');

create table Users
(
id int generated always as identity(start with 1, increment by 1),
email varchar(255) not null,
password varchar(255),
info int,
role int,
constraint pk_users primary key(email),
constraint uk_id_users unique(id),
constraint uk_info_users unique(info),
constraint fk_user_info_id foreign key (info) references Userinfo(id),
constraint fk_user_role_id foreign key (role) references Roles(id)
)

insert into Users (email, password, info, role) values ('email1@mail.ru', 'password1', 1, 1);
insert into Users (email, password, info, role) values ('email2@mail.ru', 'password2', 2, 2);
insert into Users (email, password, info, role) values ('email3@mail.ru', 'password3', 3, 3);

create table Orders
(
id int generated always as identity(start with 1, increment by 1),
userid int,
created timestamp,
constraint pk_orders primary key (id),
constraint fk_orders_user_id foreign key (userid) references Users (id)
)

insert into Orders (userid, created) values (1, '2019-05-10 17:00:00');
insert into Orders (userid, created) values (2, '2019-05-10 17:01:00');
insert into Orders (userid, created) values (3, '2019-05-10 17:02:00');

create table Supplier
(
id int generated always as identity(start with 1, increment by 1),
name varchar(255),
address varchar(255) not null,
phone varchar(255),
representative varchar(255) not null,
constraint uk_id_supplier unique(id),
constraint pk_name_supplier primary key(name)
)

insert into Supplier (name, address, phone, representative) values ('supplier1', 'address1', 'phone1', 'representative1');
insert into Supplier (name, address, phone, representative) values ('supplier2', 'address2', 'phone2', 'representative2');
insert into Supplier (name, address, phone, representative) values ('supplier3', 'address3', 'phone3', 'representative3');

create table Product
(
id int generated always as identity(start with 1, increment by 1),
code varchar(255),
title varchar(255),
supplier int,
initial_price double,
retail_value double,
constraint uk_id_product unique(id),
constraint pk_code_product primary key(code),
constraint fk_supplier_id foreign key(supplier) references Supplier(id)
)

insert into Product (code, title, supplier, initial_price, retail_value) values ('code1', 'title1', 1, 23.5, 26.7);
insert into Product (code, title, supplier, initial_price, retail_value) values ('code2', 'title2', 2, 23.5, 26.7);
insert into Product (code, title, supplier, initial_price, retail_value) values ('code3', 'title3', 3, 23.5, 26.7);

create table Orders2Product
(
orderid int,
product int,
constraint fk_order_id foreign key(orderid) references Orders(id),
constraint fk_product_id foreign key(product) references Product(id),
constraint pk_Orders2Product primary key(orderid, product)
)

insert into Orders2Product (orderid, product) values (1, 1);
insert into Orders2Product (orderid, product) values (2, 2);
insert into Orders2Product (orderid, product) values (3, 3);

