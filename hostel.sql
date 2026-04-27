CREATE TABLE Hostel (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Room (
    id INT PRIMARY KEY,
    hostel_id INT,
    number VARCHAR(10),
    capacity INT,
    FOREIGN KEY (hostel_id) REFERENCES Hostel(id)
);


CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Student_Phone (
    id INT PRIMARY KEY,
    student_id INT,
    phone VARCHAR(15),
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

CREATE TABLE Allocation (
    id INT PRIMARY KEY,
    student_id INT,
    room_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (room_id) REFERENCES Room(id)
);

CREATE TABLE Warden (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE Complaint (
    id INT PRIMARY KEY,
    student_id INT,
    description TEXT,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

INSERT INTO Hostel VALUES 
(1, 'Block A', 'North Campus'),
(2, 'Block B', 'South Campus'),
(3, 'Block C', 'East Campus');

INSERT INTO Room VALUES 
(101, 1, 'A101', 3),
(102, 1, 'A102', 2),
(201, 2, 'B201', 3),
(202, 2, 'B202', 2),
(301, 3, 'C301', 4),
(302, 3, 'C302', 2);

INSERT INTO Student VALUES 
(1, 'Pratham', 'p@gmail.com'),
(2, 'Rahul', 'rahul@gmail.com'),
(3, 'Amit', 'amit@gmail.com'),
(4, 'Sneha', 'sneha@gmail.com'),
(5, 'Kiran', 'kiran@gmail.com'),
(6, 'Anjali', 'anjali@gmail.com'),
(7, 'Ravi', 'ravi@gmail.com'),
(8, 'Meena', 'meena@gmail.com'),
(9, 'Arjun', 'arjun@gmail.com'),
(10, 'Divya', 'divya@gmail.com');

INSERT INTO Student_Phone VALUES 
(1, 1, '9876543210'),
(2, 1, '9123456780'),
(3, 2, '9012345678'),
(4, 3, '9988776655'),
(5, 4, '9876501234'),
(6, 5, '9123409876'),
(7, 6, '9000011111'),
(8, 7, '9333344444'),
(9, 8, '9444455555'),
(10, 9, '9555566666');

INSERT INTO Warden VALUES 
(1, 'Mr. Sharma', '9000000001'),
(2, 'Mrs. Rao', '9000000002'),
(3, 'Mr. Khan', '9000000003');

INSERT INTO Complaint VALUES 
(1, 1, 'Water issue', 'Pending'),
(2, 2, 'Electricity problem', 'Resolved'),
(3, 3, 'WiFi not working', 'Pending'),
(4, 4, 'Room cleaning', 'Resolved'),
(5, 5, 'Fan not working', 'Pending'),
(6, 6, 'Noise issue', 'Pending'),
(7, 7, 'Bed problem', 'Resolved'),
(8, 8, 'Bathroom issue', 'Pending'),
(9, 9, 'Light problem', 'Resolved'),
(10, 10, 'Maintenance issue', 'Pending');

INSERT INTO Allocation VALUES
(1, 1, 101, '2025-01-01', NULL),
(2, 2, 101, '2025-01-01', NULL),
(3, 3, 102, '2025-01-02', NULL),
(4, 4, 201, '2025-01-03', NULL),
(5, 5, 202, '2025-01-04', NULL),
(6, 6, 301, '2025-01-05', NULL),
(7, 7, 301, '2025-01-05', NULL),
(8, 8, 302, '2025-01-06', NULL),
(9, 9, 201, '2025-01-07', NULL),
(10, 10, 202, '2025-01-08', NULL);

SELECT s.name, r.number
FROM Student s
JOIN Allocation a ON s.id = a.student_id
JOIN Room r ON a.room_id = r.id;

SELECT hostel_id, COUNT(*) AS total_rooms
FROM Room
GROUP BY hostel_id;

SELECT * FROM Complaint
WHERE status = 'Pending';

SELECT room_id, COUNT(student_id) AS occupants
FROM Allocation
GROUP BY room_id;
