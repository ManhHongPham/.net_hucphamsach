/*
Created		9/19/2021
Modified		11/17/2021
Project		
Model			
Company		
Author		
Version		
Database		MS SQL 2005 
*/


Create table [DanhMucSanPham]
(
	[MaDanhMuc] Integer NOT NULL, UNIQUE ([MaDanhMuc]),
	[TenDanhMuc] Nvarchar(100) NOT NULL,
	[MoTa] Ntext NULL,
Primary Key ([MaDanhMuc])
) 
go

Create table [SanPham]
(
	[MaSP] Integer NOT NULL, UNIQUE ([MaSP]),
	[TenSanPham] Nvarchar(100) NOT NULL,
	[MoTa] Ntext NOT NULL,
	[NhaCungCap] Nvarchar(100) NOT NULL,
	[GiaBan] Decimal(18,0) NOT NULL,
	[Anh] Nvarchar(100) NOT NULL,
	[MaDanhMuc] Integer NOT NULL,
	[SoLuong] Integer NOT NULL,
Primary Key ([MaSP])
) 
go

Create table [TaiKhoan]
(
	[MaTK] Integer NOT NULL, UNIQUE ([MaTK]),
	[HoTen] Nvarchar(100) NOT NULL,
	[Ten] Nvarchar(50) NOT NULL,
	[Email] Nchar(100) NOT NULL,
	[DienThoai] Nchar(50) NOT NULL,
	[MatKhau] Nchar(100) NOT NULL,
	[DiaChi] Nvarchar(100) NOT NULL,
	[MaQuyen] Integer NOT NULL,
Primary Key ([MaTK],[MaQuyen])
) 
go

Create table [HoaDon]
(
	[MaHD] Integer NOT NULL,
	[DiaChi] Nvarchar(100) NOT NULL,
	[NgayDat] Datetime NOT NULL,
	[MaTK] Integer NOT NULL,
	[TongTien] Decimal(18,0) NOT NULL,
	[MaQuyen] Integer NOT NULL,
Primary Key ([MaHD])
) 
go

Create table [ChiTietHoaDon]
(
	[MaHD] Integer NOT NULL,
	[MaSP] Integer NOT NULL,
	[SoLuong] Integer NOT NULL,
	[ThanhTien] Decimal(18,0) NOT NULL,
	[PTThanhToan] Nvarchar(100) NOT NULL,
Primary Key ([MaHD],[MaSP])
) 
go

Create table [PhanQuyen]
(
	[MaQuyen] Integer NOT NULL, UNIQUE ([MaQuyen]),
	[TenQuyen] Nvarchar(100) NOT NULL,
	[MoTa] Nvarchar(100) NOT NULL,
	[TrangThai] Bit NOT NULL,
Primary Key ([MaQuyen])
) 
go


Alter table [SanPham] add  foreign key([MaDanhMuc]) references [DanhMucSanPham] ([MaDanhMuc])  on update no action on delete no action 
go
Alter table [ChiTietHoaDon] add  foreign key([MaSP]) references [SanPham] ([MaSP])  on update no action on delete no action 
go
Alter table [HoaDon] add  foreign key([MaTK],[MaQuyen]) references [TaiKhoan] ([MaTK],[MaQuyen])  on update no action on delete no action 
go
Alter table [ChiTietHoaDon] add  foreign key([MaHD]) references [HoaDon] ([MaHD])  on update no action on delete no action 
go
Alter table [TaiKhoan] add  foreign key([MaQuyen]) references [PhanQuyen] ([MaQuyen])  on update no action on delete no action 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


