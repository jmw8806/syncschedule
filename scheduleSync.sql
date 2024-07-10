CREATE DATABASE [IF NOT EXISTS] schedSync;

CREATE TYPE weekday AS ENUM (
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
);

CREATE TABLE Employee (
    employee_id SERIAL NOT NULL UNIQUE PRIMARY KEY,
    family_name VARCHAR(100) NULL,
    given_name VARCHAR(100) NULL,
    seniority_level INT NOT NULL UNIQUE
);

CREATE TABLE Shift (
    shift_id INT PRIMARY KEY UNIQUE,
    day VARCHAR(10) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    staff_max INT DEFAULT 4,
    staff_min INT DEFAULT 1 NOT NULL,
    staff_scheduled_count INT DEFAULT 0 NOT NULL
);

CREATE TABLE Staff_Schedule (
    employee_id INT,
    shift_id INT,
    PRIMARY KEY (employee_id, shift_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (shift_id) REFERENCES Shift(shift_id)
);

CREATE TABLE First_Pick (
    pick_id INT PRIMARY KEY UNIQUE,
    employee_id INT NOT NULL,
    shift_id INT NOT NULL,
    seniority_level INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (shift_id) REFERENCES Shift(shift_id),
    FOREIGN KEY (seniority_level) REFERENCES Employee(seniority_level)
);

CREATE TABLE Second_Pick (
    pick_id INT PRIMARY KEY UNIQUE,
    employee_id INT NOT NULL,
    shift_id INT NOT NULL,
    seniority_level INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (shift_id) REFERENCES Shift(shift_id),
    FOREIGN KEY (seniority_level) REFERENCES Employee(seniority_level)
);