-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) PRIMARY KEY,
     dept_name VARCHAR(40) UNIQUE NOT NULL
);
CREATE TABLE employees (
    emp_no integer PRIMARY KEY,
    birth_date date NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar NOT NULL,
    gender varchar NOT NULL,
    hire_date date NOT NULL
);
CREATE TABLE dept_manager (
    dept_no varchar(4) NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
CREATE TABLE salaries (
    emp_no integer PRIMARY KEY,
    salary numeric NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
CREATE TABLE dept_emp (
    emp_no integer NOT NULL,
    dept_no varchar(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);
CREATE TABLE titles (
    emp_no integer PRIMARY KEY,
    title varchar NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
