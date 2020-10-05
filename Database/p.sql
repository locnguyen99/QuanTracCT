
ALTER TABLE ChuKy DROP CONSTRAINT PK_TuyenDo_ChuKy


ALTER TABLE TuyenDo
ADD PRIMARY KEY (MaTD)


ALTER TABLE Moc DROP CONSTRAINT PK_Moc
ALTER TABLE TuyenDo DROP CONSTRAINT PK_TuyenDo
ALTER TABLE ChuKy DROP CONSTRAINT PK_ChuKy


ALTER TABLE TuyenDo add CONSTRAINT FK_ChuKy_TuyenDo  FOREIGN KEY (MaCK)
REFERENCES ChuKy (MaCK)
	ON DELETE CASCADE
    ON UPDATE CASCADE

ALTER TABLE Moc add CONSTRAINT FK_ChuKy_Moc  FOREIGN KEY (MaCK)
REFERENCES ChuKy (MaCK)
	ON DELETE CASCADE
    ON UPDATE CASCADE



	alter table CanhNghieng
add MaCanh uniqueidentifier NOT NULL default newid()



alter table CanhNghieng
add primary key(MaCanh)


alter table CanhNghieng
add constraint PK_ChuKy_CanhNghieng foreign key (MaCK) references ChuKy(MaCK)

alter table CanhNghieng
alter column msDivisionS varchar (50)
