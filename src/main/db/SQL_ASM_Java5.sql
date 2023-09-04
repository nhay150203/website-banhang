use master
go
-- xóa csdl
drop database ps20385_asm_java5
go
-- tạo csdl
create database ps20385_asm_java5
go
use ps20385_asm_java5
go
-- tạo bảng phân loại
create table categories
(
	id varchar(10) primary key,
	name nvarchar(50)
)
go
-- tạo bảng tài khoản
create table accounts
(
	username varchar(50) primary key,
	password varchar(50),
	fullname nvarchar(50),
	email varchar(100),
	photo varchar(50),
	activated bit,
	admin bit
)
go
-- tạo bảng sản phẩm
create table products
(
	id int identity(1,1) primary key,
	name nvarchar(50),
	image varchar(50),
	price float,
	createDate date,
	available bit,
	outstanding bit,
	categoryid varchar(10) references categories(id)
)
go
-- tạo bảng đặt hàng
create table orders
(
	id int identity(1,1) primary key,
	address nvarchar(100),
	createDate date,
	username varchar(50) references accounts(username)
)
go
-- tạo bảng chi tiết đơn hàng
create table orderDetails
(
	id int identity(1,1) primary key,
	price float,
	quantity int,
	orderid int references orders(id),
	productid int references products(id)
)
go

create table favorites(
	id int identity(1,1) primary key,
	quantity int,
	price float,
	userid varchar(50) references accounts(username),
	productid int references products(id),
	likedate date
)
go

-- thêm dữ liệu

insert into categories values
('NO', N'Nón bảo hiểm'),
('QA', N'Quần áo'),
('GA', N'Găng tay'),
('GI', N'Giày'),
('BA', N'Balo'),
('KH', N'Phụ kiện khác')

go
insert into accounts values
('nd', 'ps20385', N'Đồng Võ Nghiệp', 'nghiepdvps20385@fpt.edu.vn', 'nd.jpg', 1, 1),
('nd1', 'ps20385', N'Đồng Nghiệp', 'nghiepdvps20385@fpt.edu.vn', 'nd.jpg', 0, 1),
('nd2', 'ps20385', N'Võ Nghiệp', 'nghiepdvps20385@fpt.edu.vn', 'nd.jpg', 1, 0),
('nd3', 'ps20385', N'Nghiệp', 'nghiepdvps20385@fpt.edu.vn', 'nd.jpg', 0, 0)

go

insert into products values
(N'Nón bảo hiểm Royal Helmet', 'mu3.png', 450000, '5/23/2023', 1, 1, 'NO'),
(N'Balo du lịch cao cấp', 'balo1.png', 450000, '5/23/2023', 1, 1, 'BA'),
(N'Quần giáp Riding Tribe JK37B', 'quan1.png', 900000, '5/24/2023', 1, 0, 'QA'),
(N'Nón fullface ROYAL M136 V2 ĐỎ', 'mu4.png', 450000, '5/24/2023', 1, 0, 'NO'),
(N'Nón bảo hiểm 1/2 + kính phi công', 'mu5.png', 450000, '5/24/2023', 1, 1, 'NO'),
(N'Nón bảo hiểm 3/4 kính âm màu vàng ROYAL M139', 'mu.png', 450000, '5/23/2023', 1, 1, 'NO'),
(N'Balo phượt du lịch thời trang cao cấp', 'balo.png', 500000, '5/23/2023', 1, 1, 'BA'),
(N'Găng tay xe máy Fox dài ngón cam', 'gangtay.png', 800000, '5/23/2023', 1, 1, 'GA'),
(N'Áo motor Komine jk63 gù Titanium', 'ao1.png', 1500000, '5/23/2023', 1, 0, 'QA')

go

insert into orders values
(N'Quận 4, TP HCM', '5/25/2023', 'nd1'),
(N'Quận 10, TP HCM', '5/25/2023', 'nd2'),
(N'Quận 2, TP HCM', '5/25/2023', 'nd3'),
(N'Quận 4, TP HCM', '5/25/2023', 'nd1'),
(N'Phường Tân Chánh Hiệp, Quận 12, TP HCM', '5/25/2023', 'nd'),
(N'Phường Tân Chánh Hiệp, Quận 12, TP HCM', '5/30/2023', 'nd'),
(N'Phường Tân Chánh Hiệp, Quận 12, TP HCM', '6/2/2023', 'nd')

go

insert into orderDetails values
(450000, 1, 1, 2),
(500000, 1, 2, 3),
(800000, 1, 3, 5),
(450000, 1, 4, 2),
(500000, 1, 5, 3),
(800000, 1, 6, 5),
(800000, 1, 7, 5)
go

insert into favorites values
(1,500000,'nd',1,'6/11/2023'),
(1,500000,'nd',2,'6/11/2023'),
(1,500000,'nd',3,'6/11/2023'),
(1,500000,'nd',4,'6/11/2023'),
(1,500000,'nd',5,'6/11/2023')
go

use ps20385_asm_java5
go
select * from products
select * from orders
select * from orderDetails
select * from favorites
drop table orders
drop table orderDetails