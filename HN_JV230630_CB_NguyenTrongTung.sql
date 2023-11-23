create database quanlydiemthi;
use quanlydiemthi;

create table student (
	studentId varchar(4) primary key not null,
    studentName varchar(100) not null,
    birthday date not null,
    gender bit(1) not null,
    address text not null,
    phoneNumber varchar(45)
);

insert into student (studentId, studentName, birthday, gender, address, phoneNumber) value ('S001', 'Nguyễn Thế Anh', '1999-1-11', 1, 'Hà Nội', '984678082'),
('S002', 'Đặng Bảo Trâm', '1998-11-22', 0, 'Lào Cai', '904982654'),
('S003', 'Trần Hà Phương', '2000-5-5', 0, 'Nghệ An', '947645363'),
('S004', 'Đỗ Tiến Mạnh', '1999-3-26', 1, 'Hà Nội', '983665353'),
('S005', 'Phạm Duy Nhất', '1998-10-4', 1, 'Tuyên Quang', '987242678'),
('S006', 'Mai Văn Thái', '2002-6-22', 1, 'Nam Định', '982654268'),
('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', '982364753'),
('S008', 'Nguyễn Ngọc Bảo My', '1999-1-22', 0, 'Hà Nam', '927867453'),
('S009', 'Nguyễn Tiến Đạt', '1998-8-7', 1, 'Tuyên Quang', '989274673'),
('S010', 'Nguyễn Thiều Quang', '2000-9-18', 1, 'Hà Nội', '984378291');

create table subject (
	subjectId varchar(4) primary key not null,
    subjectName varchar(45) not null,
    priority int (11) not null
);

insert into subject (subjectId, subjectName, priority) value ('MH01', 'Toán', 2),
('MH02', 'Lý', 2),
('MH03', 'Hóa', 1),
('MH04', 'Ngữ Văn', 1),
('MH05', 'Tiếng Anh', 2);

create table mark (
	primary key (subjectId, studentId),
	subjectId varchar(4) not null,
    foreign key (subjectId) references subject (subjectId),
    studentId varchar(4) not null,
    foreign key (studentId) references student (studentId),
    point int(11) not null
);

insert into mark (subjectId, studentId, point) value ('MH01','S001',8.5),
('MH01','S002',9),
('MH01','S003',7.5),
('MH01','S004',6),
('MH01','S005',5.5),
('MH01','S006',8),
('MH01','S007',9.5),
('MH01','S008',10),
('MH01','S009',7.5),
('MH01','S010',6.5),

('MH02','S001',7),
('MH02','S002',8),
('MH02','S003',6.5),
('MH02','S004',7),
('MH02','S005',8),
('MH02','S006',10),
('MH02','S007',9),
('MH02','S008',8.5),
('MH02','S009',7),
('MH02','S010',8),

('MH03','S001',9),
('MH03','S002',6.5),
('MH03','S003',8),
('MH03','S004',5),
('MH03','S005',7.5),
('MH03','S006',9),
('MH03','S007',6),
('MH03','S008',8.5),
('MH03','S009',9),
('MH03','S010',5.5),

('MH04','S001',9),
('MH04','S002',8),
('MH04','S003',7),
('MH04','S004',6.5),
('MH04','S005',8.5),
('MH04','S006',7.5),
('MH04','S007',9),
('MH04','S008',6),
('MH04','S009',5),
('MH04','S010',4),

('MH05','S001',5),
('MH05','S002',6),
('MH05','S003',7),
('MH05','S004',8),
('MH05','S005',9),
('MH05','S006',6.5),
('MH05','S007',4),
('MH05','S008',9.5),
('MH05','S009',10),
('MH05','S010',7);

-- 2. Cập nhật dữ liệu [10 điểm]:
-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
	update student set studentName = 'Đỗ Đức Mạnh' where studentId = 'S004';
    
-- Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1.
	update subject set subjectName = 'Ngoại Ngữ' where subjectId = 'MH05';
    update subject set priority = 1 where subjectId = 'MH05';
    
-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6,
-- MH05 : 9).
	update mark set point = 8.5 where subjectId = 'MH01' and studentId = 'S009';
    update mark set point = 7 where subjectId = 'MH02' and studentId = 'S009';
    update mark set point = 5.5 where subjectId = 'MH03' and studentId = 'S009';
    update mark set point = 6 where subjectId = 'MH04' and studentId = 'S009';
    update mark set point = 9 where subjectId = 'MH05' and studentId = 'S009';
    
--    3. Xoá dữ liệu[10 điểm]:
-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh
-- này ở bảng STUDENT.
	delete from mark where studentId = 'S010';
    delete from student where studentId = 'S010';
    
--    Bài 3: Truy vấn dữ liệu [25 điểm]:
-- 1. Lấy ra tất cả thông tin của sinh viên trong bảng Student . [4 điểm]
	select * from student;
    
-- 2. Hiển thị tên và mã môn học của những môn có hệ số bằng 1. [4 điểm]
	select subjectName, subjectId from subject where priority = 1;
    
-- 3. Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
-- năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh. [4 điểm]
	select studentId as 'mã học sinh', 
    studentName as 'tên học sinh', 
    year(current_date()) - year(birthday) as 'tuổi', 
    if(gender=1, 'Nam', 'Nữ') as 'giới tính', 
    address as 'quê quán'
    from student;

-- 4. Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
-- Toán và sắp xếp theo điểm giảm dần. [4 điểm]
	select s.studentName, sub.subjectName, m.point 
    from mark m
    join student s on m.studentId = s.studentId
    join subject sub on m.subjectId = sub.subjectId
    where m.subjectId = 'MH01'
    order by m.point desc;

-- 5. Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
-- [4 điểm]
	select if(gender = 1, 'Nam', 'Nữ') as 'giới tính', count(*) 
    from student
    group by gender;

-- 6. Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
-- để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình. [5 điểm]
	select s.studentId, s.studentName, sum(m.point) as 'tổng điểm', avg(m.point) as 'điểm trung bình'
    from student s
    join mark m on m.studentId = s.studentId
    group by s.studentId, s.studentName;

-- Bài 4: Tạo View, Index, Procedure [20 điểm]:
-- 1. Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
-- sinh, giới tính , quê quán . [3 điểm]
	create view STUDENT_VIEW as select studentId, studentName, gender, address from student;

-- 2. Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
-- điểm trung bình các môn học . [3 điểm]
	create view AVERAGE_MARK_VIEW as select s.studentId, s.studentName, avg(m.point) as 'điểm trung bình'
    from student s
    join mark m on m.studentId = s.studentId
    group by s.studentId, s.studentName;
    
-- 3. Đánh Index cho trường `phoneNumber` của bảng STUDENT. [2 điểm]
	create index indPhone on student (phoneNumber);

-- 4. Tạo các PROCEDURE sau:
-- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
-- thông tin học sinh đó. [4 điểm]
	delimiter //
    create procedure PROC_INSERTSTUDENT (IN studentId varchar(4), 
    studentName varchar(100),
    birthday date, 
    gender bit(1), 
    address text, 
    phoneNumber varchar(45))
    begin
		insert into student() values (studentId, studentName, birthday, gender, address, phoneNumber);
    end ;
    //
    
    call PROC_INSERTSTUDENT('S011', 'Nguyễn Văn A', '1998-12-20', 1, 'Hạ Long', '904982594');
-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
-- [4 điểm]
	delimiter //
    create procedure PROC_UPDATESUBJECT (IN subject_id varchar(4) , subject_name varchar(45))
    begin
		update subject set subjectName = subject_name 
        where subjectId = subject_id;
	end ;
    //
    
    call PROC_UPDATESUBJECT('MH02', 'Su');
-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học
-- sinh và trả về số bản ghi đã xóa. [4 điểm]
	delimiter //
    create procedure PROC_DELETEMARK (IN student_id varchar(4), OUT delete_count int )
    begin
		delete from mark 
        where studentId = student_id;
        set delete_count = row_count();
	end ;
    //
    
    call PROC_DELETEMARK('S001', @delete_count);



-- studentId varchar(4) primary key not null,
--     studentName varchar(100) not null,
--     birthday date not null,
--     gender bit(1) not null,
--     address text not null,
--     phoneNumber varchar(45)