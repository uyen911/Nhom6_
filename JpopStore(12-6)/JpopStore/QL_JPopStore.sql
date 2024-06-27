create database QL_JPOPStore
go

--use master
--go
--drop database Shop
--go

use QL_JPOPStore
go
CREATE TABLE TK
(
MaTK INT IDENTITY(1,1) PRIMARY KEY , 
    MatKhau VARCHAR(50) collate Latin1_General_CI_AS NULL,
   
    Email VARCHAR(50) collate Latin1_General_CI_AS NULL,
	Quyen NVARCHAR(50) Null,
)
GO

CREATE TABLE Banner
(
    MaBanner INT IDENTITY(0,1),
    DuongDan varchar(Max) NULL,
	NgayDangBV DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    
);
GO
create table Loai
(
	MaLoai varchar(10) not null,
	TenLoai varchar(50) not null,

	constraint PK_Loai primary key (MaLoai),
)
go
create table Nhom
(
	MaNhom varchar(10) not null,
	TenNhom varchar(50) not null,
	DuongDan varchar(100) not null,
	AnhNhom varchar(100) null,
	constraint PK_Size primary key (MaNhom),
)
go
CREATE TABLE SanPhamData
(
    MaSP varchar(50) NOT NULL,
    DuongDan1 varchar(100) NULL,
    DuongDan2 varchar(100) NULL,
    DuongDan3 varchar(100) NULL,
    DuongDan4 varchar(100) NULL,
    DuongDan5 varchar(100) NULL,
	AnhNote varchar(100) NULL
);
GO

CREATE TABLE SanPham
(
    MaSP varchar(50) NOT NULL,
    TenSP nvarchar(50) NOT NULL,
    DuongDan nvarchar(100) NOT NULL,
    Gia float NOT NULL,
    MoTa nvarchar(255) NOT NULL,
    MaLoai varchar(10) NOT NULL,
    MaNhom varchar(10) NOT NULL,
    NgaySX  datetime NULL,
    NgayNhap datetime NULL,
    DoanhSo int NULL,
    SoLuongKho int NULL,
    CONSTRAINT PK_SANPHAM PRIMARY KEY (MaSP),
    CONSTRAINT FK_SanPham_Loai FOREIGN KEY (MaLoai) REFERENCES Loai(MaLoai),
    CONSTRAINT FK_SanPham_Size FOREIGN KEY (MaNhom) REFERENCES Nhom(MaNhom)
);
GO

ALTER TABLE SanPhamData
ADD CONSTRAINT FK_SanPhamData_SanPham FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);
GO


create table KhachHang
(
	MaTK INT,
	AvatarUser varchar(100) null,

    MaKH INT IDENTITY(1,1),
    HoTen NVARCHAR(255) NULL,
    DienThoai NVARCHAR(13) NULL,
    GioiTinh NVARCHAR(10) NULL,
    DiaChi NVARCHAR(255) NULL,
    Email VARCHAR(100) NULL,
    MatKhau VARCHAR(50) NULL,
	Diem int null,
    CONSTRAINT PK_KhachHang PRIMARY KEY (MaKH),
    CONSTRAINT FK_KhachHang_TK FOREIGN KEY (MaTK) REFERENCES TK(MaTK)
)
go

create table DonHang
(
	MaTK INT,
    MaDH VARCHAR(10) NOT NULL,
    KH INT,
    Ngay DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_GioHang PRIMARY KEY (MaDH),
    CONSTRAINT FK_DonHang_TK FOREIGN KEY (MaTK) REFERENCES TK(MaTK),
	    FOREIGN KEY (KH) REFERENCES KhachHang(MaKH),
		DiaChiNN NVARCHAR(255) NULL,
)
go

create table ChiTietDonHang
(
	KH INT,
	MaCTDH varchar(10) not null,
	MaDH varchar(10) not null,
	MaSP varchar(50) not null,
	SoLuong integer not null,
	TenSP nvarchar(50) not null,
	DuongDan varchar(100) not null,
	Gia float not null,
	ThanhTien float not null,
	Ngay datetime not null default CURRENT_TIMESTAMP,
	constraint PK_ChiTietDonHang primary key (MaCTDH),
	 FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
)
go
CREATE TABLE DanhGia
(
	AvatarUser varchar(100) null,
    MaDG int IDENTITY(1,1) NOT NULL, -- ID duy nhất cho mỗi bình luận
    MaSP varchar(50) NOT NULL, -- Mã sản phẩm
    TenKH nvarchar(50) NULL, -- Tên khách hàng
	DienThoai NVARCHAR(13) NULL,
    NoiDung nvarchar(Max) NULL, -- Nội dung bình luận
    NgayDG datetime NULL, -- Ngày bình luận
	RatingValue INT CHECK (RatingValue >= 1 AND RatingValue <= 5),
	Anh1 varchar(Max) NULL,
	Anh2 varchar(Max) NULL,
	Anh3 varchar(Max) NULL,
	Anh4 varchar(Max) NULL,
	Anh5 varchar(Max) NULL,
	Video varchar(Max) NULL,
	Email VARCHAR(100) NULL,
	LuotThich INT DEFAULT 0,
    CONSTRAINT PK_DanhGia PRIMARY KEY (MaDG),
    CONSTRAINT FK_DanhGia_SanPham FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
GO
ALTER TABLE DanhGia
DROP CONSTRAINT FK_DanhGia_SanPham; -- Xóa constraint hiện tại

ALTER TABLE DanhGia
ADD CONSTRAINT FK_DanhGia_SanPham FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP) ON DELETE CASCADE;
GO

CREATE TABLE ChiNhanh
(
    MaCN varchar(10) PRIMARY KEY,
    TenCN nvarchar(50) NOT NULL,
    DiaChiCN nvarchar(MAX) NOT NULL
)
go
-- foreign key

alter table SanPham 
add constraint FK_SP_Loai foreign key (MaLoai) references Loai(MaLoai)
go
alter table SanPham 
add constraint FK_SP_Size foreign key (MaNhom) references Nhom(MaNhom)
go
alter table ChiTietDonHang
add constraint FK_GH_SP foreign key (MaSP) references SanPham(MaSP)
go

alter table ChiTietDonHang
add constraint FK_CTDH_DH foreign key (MaDH) references DonHang(MaDH)
go

--alter table DonHang
--add constraint FK_GH_KH foreign key (MaKH) references KhachHang(MaKH)
--go
ALTER TABLE DonHang
ADD MaCN varchar(10) NOT NULL
go
ALTER TABLE DonHang
ADD CONSTRAINT FK_DonHang_ChiNhanh FOREIGN KEY (MaCN) REFERENCES ChiNhanh(MaCN)
go
ALTER TABLE KhachHang
ADD TrangThai bit;
go
ALTER TABLE TK
ADD TrangThai bit;
go
ALTER TABLE ChiTietDonHang
ADD GiaoDich bit;
go
insert into Loai
values
('1','Album'),
('2','Combo'),
('3','Standee'),
('4','Figure'),
('5','Clothes')
go

INSERT INTO Nhom VALUES
('JPGen0', 'HoloZeroOG', 'Content/icon-group-jpop/HoloZeroOG.png','Content/image-group-jpop/HoloZeroOG.png'),
('JPGen1', 'HoloFirstGen', 'Content/icon-group-jpop/HoloFirstGen.png','Content/image-group-jpop/HoloFirstGen.png'),
('JPGen2', 'HoloGamer', 'Content/icon-group-jpop/HoloGamer.png','Content/image-group-jpop/HoloGamer.png'),
('JPGen3', 'HoloFantasy', 'Content/icon-group-jpop/HoloFantasy.png','Content/image-group-jpop/HoloFantasy.png'),
('JPGen4', 'HoloForce ', 'Content/icon-group-jpop/HoloForce.png','Content/image-group-jpop/HoloForce.png'),
('JPGen5', 'NePoLaBo ', 'Content/icon-group-jpop/NePoLaBo.png','Content/image-group-jpop/NePoLaBo.png'),
('JPGen6', 'HoloX', 'Content/icon-group-jpop/HoloX.png','Content/image-group-jpop/HoloX.png'),
('ENGen1', 'HoloMyth', 'Content/icon-group-jpop/HoloMyth.png','Content/image-group-jpop/HoloMyth.png'),
('ENGen2', 'HoloPromise', 'Content/icon-group-jpop/HoloPromise.png','Content/image-group-jpop/HoloPromise.png'),
('ENGen3', 'HoloAdvent', 'Content/icon-group-jpop/HoloAdvent.png','Content/image-group-jpop/HoloAdvent.png'),
('IDGen1', 'AREA15', 'Content/icon-group-jpop/AREA15.png','Content/image-group-jpop/AREA15.png'),
('IDGen2', 'HoloRo', 'Content/icon-group-jpop/HoloRo.png','Content/image-group-jpop/HoloRo.png'),
('IDGen3', 'HoloH3ro', 'Content/icon-group-jpop/HoloH3ro.png','Content/image-group-jpop/HoloH3ro.png'),
('DEV_IS', 'ReGLOSS', 'Content/icon-group-jpop/ReGLOSS.png','Content/image-group-jpop/ReGLOSS.png')

go

set dateformat dmy
insert into SanPham
values

('ALBSP01',N'ZODIAC - Hakos Baelz','Content/items/ENGen2/Album/Zodiac1.png',450000,N'ZODIAC - Hakos Baelz','1','ENGen2','01-03-2024','10-03-2024',0,50),


('ALBSP02',N'Unknown DIVA - Amane Kanata','Content/items/JPGen4/Album/UnknownDiva1.png',450000,N'Unknown DIVA - Amane Kanata','1','JPGen4','13-03-2024','20-03-2024',0,50),

('ALBSP03',N'Night walk - Ookami Mio','Content/items/JPGen2/Album/NightWalk1.png',450000,N'Night walk - Ookami Mio','1','JPGen2','07-12-2023','15-12-2023',0,50),

('ALBSP04',N'Specter - Hoshimachi Suisei','Content/items/JPGen0/Album/Specter1.png',450000,N'Specter - Hoshimachi Suisei','1','JPGen0','25-01-2023','05-02-2023',0,50),

('ALBSP05',N'UnAlive - Mori Calliope','Content/items/ENGen1/Album/Unalive1.png',450000,N'UnAlive - Mori Calliope','1','ENGen1','20-03-2022','30-03-2023',0,50),

('ALBSP06',N'USAGI THE MEGAMI - Usada Pekora','Content/items/JPGen3/Album/Usagi1.png',400000,N'USAGI THE MEGAMI - Usada Pekora','1','JPGen3','27-11-2023','10-12-2023',0,50),

('CBSL01',N'Koseki Bijou Birthday Celebration 2024','Content/items/ENGen3/Combo/BijouBirthday1.png',2500000,N'Koseki Bijou Birthday Celebration 2024','2','ENGen3','15-04-2024','18-04-2024',0,20),

('CBSL02',N'Otonose Kanade Birthday Celebration 2024','Content/items/DEV_IS/Combo/KanadeBirthday1.png',3500000,N'Otonose Kanade Birthday Celebration 2024','2','DEV_IS','20-04-2024','21-04-2024',0,20),

('CBSL03',N'IRyS Birthday Celebration 2024','Content/items/ENGen2/Combo/IrysBirthday1.png',4500000,N'IRyS Birthday Celebration 2024','2','ENGen2','08-03-2024','15-03-2024',0,20),

('CBSL04',N'Nanashi Mumei Birthday Celebration 2023','Content/items/ENGen2/Combo/MumeiBirthday1.png',2500000,N'Nanashi Mumei Birthday Celebration 2023','2','ENGen2','05-08-2023','15-08-2023',0,20),

('CBSL05',N'Shirakami Fubuki Birthday Celebration 2023','Content/items/JPGen1/Combo/FubukiBirthday1.png',3200000,N'Shirakami Fubuki Birthday Celebration 2023','2','JPGen1','05-10-2023','15-10-2023',0,20),

('STDSL01',N'3D Acrylic Stand - Nanashi Mumei','Content/items/ENGen2/Standee/Standee3dMumei1.png',420000,N'3D Acrylic Stand - Nanashi Mumei','3','ENGen2','05-03-2023','20-03-2023',0,50),

('STDSL02',N'3D Acrylic Stand - Airani Iofifteen','Content/items/IDGen1/Standee/StandeeIofi.png',400000,N'3D Acrylic Stand - Airani Iofifteen','3','IDGen1','20-09-2022','20-10-2022',0,50),

('STDSL03',N'3D Acrylic Stand - Kureiji Ollie','Content/items/IDGen2/Standee/StandeeOllie.png',400000,N'3D Acrylic Stand - Kureiji Ollie','3','IDGen2','29-07-2022','10-08-2022',0,50),

('STDSL04',N'3D Acrylic Stand - Kobo Kanaeru','Content/items/IDGen3/Standee/StandeeKobo.png',450000,N'3D Acrylic Stand - Kobo Kanaeru','3','IDGen3','28-10-2023','05-11-2023',0,50),

('STDSL05',N'3D Acrylic Stand 3rd Anniversary- Amane Kanata','Content/items/JPGen4/Standee/StandeeKanata.png',500000,N'3D Acrylic Stand 3rd Anniversary- Amane Kanata','3','JPGen4','27-02-2022','05-03-2022',0,50),

('FGRSL01',N'Nendoroid Shirakami Fubuki','Content/items/JPGen1/Figure/NendoroidFbk1.png',1400000,N'Nendoroid Shirakami Fubuki','4','JPGen1','20-11-2023','27-11-2023',0,30),

('FGRSL02',N'POP UP PARADE LAPLUS DARKNESSS','Content/items/JPGen5/Figure/PopupLaplus1.png',1100000,N'POP UP PARADE LAPLUS DARKNESSS','4','JPGen5','05-04-2024','20-04-2023',0,30),

('FGRSL03',N'POP UP PARADE AMANE KANATA','Content/items/JPGen4/Figure/PopupKanata1.png',1200000,N'POP UP PARADE AMANE KANATAS','4','JPGen4','11-04-2024','20-04-2023',0,30),

('FGRSL04',N'Gawr Gura 1/7 Scale Figure','Content/items/ENGen1/Figure/Gura1-71.png',6000000,N'Gawr Gura 1/7 Scale Figure','4','ENGen1','12-02-2023','25-02-2023',0,30),

('FGRSL05',N'POP UP PARADE SAKURA MIKO','Content/items/JPGen0/Figure/PopupSakura1.png',1400000,N'POP UP PARADE SAKURA MIKO','4','JPGen0','04-03-2024','15-03-2023',0,30),

('CLTSL01',N'Nanashi Mumei New Outfit Celebration 2024','Content/items/ENGen2/Clothes/MumeiNewOutfit1.png',900000,N'Nanashi Mumei New Outfit Celebration 2024','5','ENGen2','25-02-2024','02-03-2023',0,30),

('CLTSL02',N'TAKANASHI KIARA x SUPERGROUPIES - JACKET','Content/items/ENGen1/Clothes/KiaraJacket1.png',5200000,N'TAKANASHI KIARA x SUPERGROUPIES - JACKET','5','ENGen1','10-04-2024','19-04-2024',0,30),

('CLTSL03',N'HOSHIMACHI SUSEI x ZOZOTOWN - JACKET','Content/items/JPGen0/Clothes/SuiseiJacket1.png',7000000,N'HOSHIMACHI SUSEI x ZOZOTOWN - JACKET','5','JPGen0','28-03-2024','15-04-2024',0,30),

('CLTSL04',N'OOKAMI MIO HOODIE 1M SUBS','Content/items/JPGen2/Clothes/MioHoodie1.png',3000000,N'OOKAMI MIO HOODIE 1M SUBS','5','JPGen2','05-07-2022','20-07-2022',0,30),

('CLTSL05',N'NEKOMATA OKAYU HOODIE BIRTHDAY 2024','Content/items/JPGen2/Clothes/OkayuHoodie1.png',2500000,N'NEKOMATA OKAYU HOODIE BIRTHDAY 2024','5','JPGen2','22-02-2024','02-03-2024',0,30),

('ALBSP07',N'Aster - Tokoyami Towa','Content/items/JPGen4/Album/Aster1.png',450000,N'Aster - Tokoyami Towa','1','JPGen4','23-07-2022','30-07-2023',0,50)

go
INSERT INTO Banner(DuongDan)
VALUES	('Content\img-vtuber-bg\MumeiNewOutfit.png'),
		('Content\img-vtuber-bg\Specter.png'),
		('Content\img-vtuber-bg\NightWalk.png'),
		('Content\img-vtuber-bg\AyaFubuMi Situation vol3.png'),
		('Content\img-vtuber-bg\Area15 4thAnniversary.png'),
		('Content\img-vtuber-bg\Korone 5thAnniversary.png'),
		('Content\img-vtuber-bg\Bijou Birthday.png'),
		('Content\img-vtuber-bg\HoloFantasy Celebration.png'),
		('Content\img-vtuber-bg\Kanade Birthday.png');

go

--INSERT INTO SanPham
--VALUES 
--('ALBSP01',N'ZODIAC - Hakos Baelz','Content/items/aespa/alb/BouquetVer_750x.png',450000,N'ZODIAC - Hakos Baelz','1','ENGen2','01-03-2024','10-03-2024',0,50),
--('ALBSP02',N'Unknown DIVA - Amane Kanata','Content/items/aespa/alb/KARINAVer_750x.png',450000,N'Unknown DIVA - Amane Kanata','1','JPGen4','07-12-2023','10-03-2024',0,50),
--('ALBSP03',N'Night walk - Ookami Mio','Content/items/aespa/alb/WINTERVer_750x.png',450000,N'Night walk - Ookami Mio','1','JPGen2','07-12-2023','10-03-2024',0,50),
--('ALBSP04',N'Specter - Hoshimachi Suisei','Content/items/aespa/alb/NINGNINGVer_750x.png',450000,N'Specter - Hoshimachi Suisei','1','JPGen0','07-12-2023','10-03-2024',0,50),
--('ALBSP05',N'UnAlive - Mori Calliope','Content/items/aespa/alb/GISELLEVer_750x.png',450000,N'UnAlive - Mori Calliope','1','ENGen1','07-12-2023','10-03-2024',0,50),
--('ALBSP06',N'USAGI THE MEGAMI - Usada Pekora','Content/items/iu/alb/albLovePoem.png',400000,N'USAGI THE MEGAMI - Usada Pekora','1','JPGen3','07-12-2023','10-03-2024',0,50),
--('CBSL01',N'Koseki Bijou Birthday Celebration 2024','Content/items/iu/md/29th.png',2500000,N'Koseki Bijou Birthday Celebration 2024','2','ENGen3','07-12-2023','10-03-2024',0,20),
--('STDSL01',N'3D Acrylic Stand - Nanashi Mumei','Content/items/bts/alb/proof.png',420000,N'3D Acrylic Stand - Nanashi Mumei','3','ENGen2','07-12-2023','10-03-2024',0,50),
--('FGRSL01',N'Nendoroid Shirakami Fubuki','Content/items/illit/alb/spReal.png',1400000,N'Nendoroid Shirakami Fubuki','4','JPGen1','07-12-2023','10-03-2024',0,50),
--('FGRSL02',N'Kirakuri Chan Yume','Content/items/illit/alb/chan_real.png',1500000,N'Kirakuri Chan Yume','4','JPGen0','07-12-2023','10-03-2024',0,50),
--('CBSL02',N'BTS Fans Meeting - Cindy','Content/items/bts/alb/Meeting2024.png',1500000,N'BTS Fans Meeting - Cindy','2','ENGen3','07-12-2023','10-03-2024',0,20),
--('ALBSP07',N'WENDY - Asahina Shiori','Content/items/02300125.jpg',1500000,N'WENDY - Asahina Shiori','1','ENGen2','07-12-2023','10-03-2024',0,50),
--('ALBSP08',N'Diva Dadabums','Content/items/AvaKorea.jpg',1500000,N'Diva Dadabums','1','JPGen2','07-12-2023','2023-02-20',0,50),
--('ALBSP09',N'02300011 - Im Jinsang','Content/items/Im Jinsang.jpg',1500000,N'02300011 - Im Jinsang','1','ENGen2','07-12-2023','10-03-2024',0,50),
--('ALBSP10',N'11023001 - Sei','Content/items/Sei.jpg',1500000,N'11023001 - Sei','1','JPGen1','07-12-2023','10-03-2024',0,50),
--('ALBSP11',N'02300012 - Onyria','Content/items/Onyria.jpg',1500000,N'02300012 - Onyria','1','JPGen2','07-12-2023','10-03-2024',0,50),
--('ALBSP12',N'11023002 - Suju','Content/items/Suju.jpg',1500000,N'11023002 - Suju','1','ENGen1','07-12-2023','10-03-2024',0,50),
--('ALBSP13',N'11023003 - Xiumin','Content/items/Xiumin.jpg',1500000,N'11023003 - Xiumin','1','JPGen3','07-12-2023','10-03-2024',0,50),
--('ALBSP14',N'02300013 - Tzuyu','Content/items/Tzuyu.jpg',1500000,N'02300013 - Tzuyu','1','ENGen0','07-12-2023','10-03-2024',0,50),
--('ALBSP15',N'11023004 - Ryo','Content/items/Ryo.jpg',1500000,N'11023004 - Ryo','1','JPGen1','07-12-2023','10-03-2024',0,50)

--go 
insert into SanPhamData
values
('ALBSP01','Content/items/ENGen2/Album/Zodiac1.png','Content/items/ENGen2/Album/Zodiac2.png','Content/items/ENGen2/Album/Zodiac3.png','Content/items/ENGen2/Album/Zodiac4.png','','Content/items/ENGen2/Album/ZodiacNote.png'),
('ALBSP02','Content/items/JPGen4/Album/UnknownDiva1.png','Content/items/JPGen4/Album/UnknownDiva2.png','Content/items/JPGen4/Album/UnknownDiva3.png','Content/items/JPGen4/Album/UnknownDiva4.png','','Content/items/JPGen4/Album/UnknownDivaNote.png'),
('ALBSP03','Content/items/JPGen2/Album/NightWalk1.png','Content/items/JPGen2/Album/NightWalk2.png','Content/items/JPGen2/Album/NightWalk3.png','Content/items/JPGen2/Album/NightWalk4.png','','Content/items/JPGen2/Album/NightWalkNote.png'),
('ALBSP04','Content/items/JPGen0/Album/Specter1.png','Content/items/JPGen0/Album/Specter2.png','Content/items/JPGen0/Album/Specter3.png','Content/items/JPGen0/Album/Specter4.png','','Content/items/JPGen0/Album/SpecterNote.png'),
('ALBSP05','Content/items/ENGen1/Album/Unalive1.png','Content/items/ENGen1/Album/Unalive2.png','Content/items/ENGen1/Album/Unalive3.png','','','Content/items/ENGen1/Album/UnaliveNote.png'),
('ALBSP06','Content/items/JPGen3/Album/Usagi1.png','Content/items/JPGen3/Album/Usagi2.png','Content/items/JPGen3/Album/Usagi3.png','','','Content/items/JPGen3/Album/UsagiNote.png'),
('CBSL01','Content/items/ENGen3/Combo/BijouBirthday1.png','Content/items/ENGen3/Combo/BijouBirthday2.png','Content/items/ENGen3/Combo/BijouBirthday3.png','Content/items/ENGen3/Combo/BijouBirthday4.png','Content/items/ENGen3/Combo/BijouBirthday5.png','Content/items/ENGen3/Combo/BijouBirthdayNote.png'),
('CBSL02','Content/items/DEV_IS/Combo/KanadeBirthday1.png','Content/items/DEV_IS/Combo/KanadeBirthday2.png','Content/items/DEV_IS/Combo/KanadeBirthday3.png','Content/items/DEV_IS/Combo/KanadeBirthday4.png','Content/items/DEV_IS/Combo/KanadeBirthday5.png','Content/items/DEV_IS/Combo/KanadeBirthdayNote.png'),
('CBSL03','Content/items/ENGen2/Combo/IrysBirthday1.png','Content/items/ENGen2/Combo/IrysBirthday2.png','Content/items/ENGen2/Combo/IrysBirthday3.png','Content/items/ENGen2/Combo/IrysBirthday4.png','','Content/items/ENGen2/Combo/IrysBirthdayNote.png'),
('CBSL04','Content/items/ENGen2/Combo/MumeiBirthday1.png','Content/items/ENGen2/Combo/MumeiBirthday2.png','Content/items/ENGen2/Combo/MumeiBirthday3.png','Content/items/ENGen2/Combo/MumeiBirthday4.png','Content/items/ENGen2/Combo/MumeiBirthday5.png','Content/items/ENGen2/Combo/MumeiBirthdayNote.png'),
('CBSL05','Content/items/JPGen1/Combo/FubukiBirthday1.png','Content/items/JPGen1/Combo/FubukiBirthday2.png','Content/items/JPGen1/Combo/FubukiBirthday3.png','Content/items/JPGen1/Combo/FubukiBirthday4.png','Content/items/JPGen1/Combo/FubukiBirthday5.png','Content/items/JPGen1/Combo/FubukiBirthdayNote.png'),
('STDSL01','Content/items/ENGen2/Standee/Standee3dMumei1.png','','','','','Content/items/ENGen2/Standee/Standee3dMumei1.png'),
('STDSL02','','','','','','Content/items/IDGen1/Standee/StandeeIofi.png'),
('STDSL03','','','','','','Content/items/IDGen2/Standee/StandeeOllie.png'),
('STDSL04','','','','','','Content/items/IDGen3/Standee/StandeeKobo.png'),
('STDSL05','','','','','','Content/items/JPGen4/Standee/StandeeKanata.png'),
('FGRSL01','Content/items/JPGen1/Figure/NendoroidFbk1.png','Content/items/JPGen1/Figure/NendoroidFbk2.png','Content/items/JPGen1/Figure/NendoroidFbk3.png','Content/items/JPGen1/Figure/NendoroidFbk4.png','','Content/items/JPGen1/Figure/NendoroidFbkNote.png'),
('FGRSL02','Content/items/JPGen5/Figure/PopupLaplus1.png','Content/items/JPGen5/Figure/PopupLaplus2.png','Content/items/JPGen5/Figure/PopupLaplus3.png','','','Content/items/JPGen5/Figure/PopupLaplusNote.png'),
('FGRSL03','Content/items/JPGen4/Figure/PopupKanata1.png','Content/items/JPGen4/Figure/PopupKanata2.png','Content/items/JPGen4/Figure/PopupKanata3.png','','','Content/items/JPGen4/Figure/PopupKanataNote.png'),
('FGRSL04','Content/items/ENGen1/Figure/Gura1-71.png','Content/items/ENGen1/Figure/Gura1-72.png','Content/items/ENGen1/Figure/Gura1-73.png','','','Content/items/ENGen1/Figure/Gura1-7Note.png'),
('FGRSL05','Content/items/JPGen0/Figure/PopupSakura1.png','Content/items/JPGen0/Figure/PopupSakura2.png','Content/items/JPGen0/Figure/PopupSakura3.png','','','Content/items/JPGen0/Figure/PopupSakuraNote.png'),
('CLTSL01','Content/items/ENGen2/Clothes/MumeiNewOutfit1.png','Content/items/ENGen2/Clothes/MumeiNewOutfit2.png','Content/items/ENGen2/Clothes/MumeiNewOutfit3.png','','','Content/items/ENGen2/Clothes/MumeiNewOutfitNote.png'),
('CLTSL02','Content/items/ENGen1/Clothes/KiaraJacket1.png','Content/items/ENGen1/Clothes/KiaraJacket2.png','Content/items/ENGen1/Clothes/KiaraJacket3.png','Content/items/ENGen1/Clothes/KiaraJacket4.png','','Content/items/ENGen1/Clothes/KiaraJacketNote.png'),
('CLTSL03','Content/items/JPGen0/Clothes/SuiseiJacket1.png','Content/items/JPGen0/Clothes/SuiseiJacket2.png','Content/items/JPGen0/Clothes/SuiseiJacket3.png','Content/items/JPGen0/Clothes/SuiseiJacket4.png','','Content/items/JPGen0/Clothes/SuiseiJacketNote.png'),
('CLTSL04','Content/items/JPGen2/Clothes/MioHoodie1.png','Content/items/JPGen2/Clothes/MioHoodie2.png','Content/items/JPGen2/Clothes/MioHoodie3.png','Content/items/JPGen2/Clothes/MioHoodie4.png','','Content/items/JPGen2/Clothes/MioHoodieNote.png'),
('CLTSL05','Content/items/JPGen2/Clothes/OkayuHoodie1.png','Content/items/JPGen2/Clothes/OkayuHoodie2.png','Content/items/JPGen2/Clothes/OkayuHoodie3.png','Content/items/JPGen2/Clothes/OkayuHoodie4.png','','Content/items/JPGen2/Clothes/OkayuHoodieNote.png'),
('ALBSP07','Content/items/JPGen4/Album/Aster1.png','Content/items/JPGen4/Album/Aster2.png','Content/items/JPGen4/Album/Aster3.png','Content/items/JPGen4/Album/Aster4.png','','Content/items/JPGen4/Album/AsterNote.png')

go
INSERT INTO ChiNhanh (MaCN, TenCN, DiaChiCN) 
VALUES 
    ('CN1', N'Hà Nội', N'JPopStroe, Ng. Lệnh Cư/31 ngách 22/17, Khâm Thiên, Đống Đa, Hà Nội, Việt Nam'),
    ('CN2', N'Hồ Chí Minh', N'Số 172 Đường Số 1 Q.Bình Tân');  

go
INSERT INTO TK(Email, MatKhau,TrangThai,Quyen) 
VALUES 
    (N'Admin', 'Admin', 0,'Admin');
   

go

CREATE PROCEDURE Product_Add 
    @MaSP varchar(50), 
    @TenSP nvarchar(50), 
    @DuongDan varchar(100), 
    @Gia float, 
    @MoTa nvarchar(255), 
    @MaLoai varchar(10),
    @MaNhom varchar(10),
    @NgaySX datetime, -- Thêm tham số này
    @NgayNhap datetime, -- Thêm tham số này
    @DoanhSo int, -- Thêm tham số này
    @SoLuongKho int -- Thêm tham số này
AS
BEGIN
    INSERT INTO [dbo].[SanPham]
               ([MaSP]
               ,[TenSP]
               ,[DuongDan]
               ,[Gia]
               ,[MoTa]
               ,[MaLoai]
               ,[MaNhom]
               ,[NgaySX] -- Thêm cột này vào INSERT
               ,[NgayNhap] -- Thêm cột này vào INSERT
               ,[DoanhSo] -- Thêm cột này vào INSERT
               ,[SoLuongKho]) -- Thêm cột này vào INSERT
    VALUES 
     ( @MaSP,
      @TenSP,
      @DuongDan,
      @Gia,
      @MoTa,
      @MaLoai,
      @MaNhom,
      @NgaySX, -- Thêm giá trị này vào VALUES
      @NgayNhap, -- Thêm giá trị này vào VALUES
      @DoanhSo, -- Thêm giá trị này vào VALUES
      @SoLuongKho) -- Thêm giá trị này vào VALUES
END
GO


CREATE PROCEDURE ProductData_Add 
    @MaSP varchar(50), 
    @DuongDan1 varchar(100), 
    @DuongDan2 varchar(100), 
    @DuongDan3 varchar(100), 
    @DuongDan4 varchar(100), 
    @DuongDan5 varchar(100),
    @AnhNote varchar(100)
AS
BEGIN
    INSERT INTO [dbo].[SanPhamData]
           ([MaSP]
           ,[DuongDan1]
           ,[DuongDan2]
           ,[DuongDan3]
           ,[DuongDan4]
           ,[DuongDan5]
           ,[AnhNote])
    VALUES 
    ( @MaSP,
      @DuongDan1,
      @DuongDan2,
      @DuongDan3,
      @DuongDan4,
      @DuongDan5,
      @AnhNote)
END;
GO


 CREATE PROCEDURE splogin 
    @MaTK VARCHAR(100),
    @matkhau VARCHAR(100)
AS
BEGIN
    SELECT MaTK, matkhau 
    FROM TK 
    WHERE MaTK = @MaTK AND MatKhau = @matkhau
END
GO
 CREATE PROCEDURE GetOrderRevenueByBranch
    @MaCN VARCHAR(10) -- Declare the variable here
AS
BEGIN
    SELECT 
        CN.TenCN AS TenChiNhanh,
        DH.MaDH,
        DH.Ngay,
        SUM(CTDH.ThanhTien) AS TongDoanhThu
    FROM 
        DonHang DH
    INNER JOIN 
        ChiNhanh CN ON DH.MaCN = CN.MaCN
    INNER JOIN 
        ChiTietDonHang CTDH ON DH.MaDH = CTDH.MaDH
    WHERE 
        CN.MaCN = @MaCN
    GROUP BY 
        CN.TenCN, DH.MaDH, DH.Ngay

END
GO
--CREATE TRIGGER SyncTrangThai_KhachHang_TK
--ON TK
--AFTER UPDATE
--AS
--BEGIN
--    IF UPDATE(TrangThai)
--    BEGIN
--        DECLARE @NewTrangThai bit;
--        SELECT @NewTrangThai = TrangThai FROM inserted;

--        -- Update TrangThai column in TK table to match KhachHang table
--        UPDATE KhachHang
--        SET TrangThai = @NewTrangThai;
--    END
--END;
DECLARE @Year INT; 
SELECT 
    MONTH(ChiTietDonHang.Ngay) AS Month,
    SUM(ChiTietDonHang.ThanhTien) AS MonthlyRevenue
FROM
    ChiTietDonHang
INNER JOIN 
    SanPham ON ChiTietDonHang.MaSP = SanPham.MaSP
WHERE 
    YEAR(Ngay) = @Year
GROUP BY 
    MONTH(Ngay)
ORDER BY 
    MONTH(Ngay)
