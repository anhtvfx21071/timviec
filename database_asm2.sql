DROP DATABASE asm2;
create database asm2;
use asm2;

create table role(
`id` int(11) not null auto_increment,
`role_name` varchar(255),
primary key(id));

create table `category`(
`id` int(11) not null auto_increment,
`name` varchar(255),
`number_choose` int(11),
primary key (id));
insert into category(name) values ("C"),("C++"),("C#"),("PASCAL"),("JAVA"),("JAVASCRIP"),("PYTHON"),("PHP")
,("SWIFT"),("GO"),("RUBY");

 create table `user`(
 `id` int(11) not null auto_increment,
 `address` varchar(255),
 `description` varchar(255),
 `email` varchar(255),
 `full_name` varchar(255),
 `image` varchar(255),
 `password` varchar(255),
 `phone_number` varchar(255),
 `status` int(11) default 0,
 `role_id` int(11),
 unique key `only` (`email`),
 primary key(id),
FOREIGN KEY (role_id) REFERENCES role(id));

create table `cv`(
`id` int(11) not null auto_increment,
`file_name` varchar(255),
`user_id` int(11),
primary key(id),
foreign key(user_id) references user(id));

create table `company`(
`id` int(11) not null auto_increment,
`address` varchar(255),
`description` text,
`email` varchar(255),
`logo` varchar(255),
`name_company` varchar(255),
`phone_number` varchar(255),
`status` int(11) default 0,
`user_id` int(11),
primary key(id),
foreign key(user_id) references user(id));

  
create table recruitment(
`id` int(11) not null auto_increment,
`address` varchar(255),
`description` varchar(255),
`experience` varchar(255),
`quantity` int(11) default 0,
`salary` varchar(255),
`status` int(11) default 0,
`title` varchar(255),
`type` varchar(255),
`category_id` int(11),
`company_id` int(11),
`deadline` varchar(255),
primary key(id),
foreign key(category_id) references category(id),
foreign key(company_id) references company(id));

create table `save_job`(
`id` int(11) not null auto_increment,
`recruitment_id` int(11),
`user_id` int(11),
primary key(id),
foreign key(recruitment_id) references recruitment(id),
foreign key(user_id) references user(id));

create table follow_company(
`id` int(11) not null auto_increment,
`company_id` int(11),
`user_id` int(11),
primary key(id),
foreign key(company_id) references company(id),
foreign key(user_id) references user(id)); 

create table applypost(
`id` int(11) not null auto_increment,
`recruitment_id` int(11),
`user_id` int(11),
`name_cv` varchar(255),
`status` int(11) default 0,
`text` varchar(255),
primary key(id),
foreign key(recruitment_id) references recruitment(id),
foreign key(user_id) references user(id));
