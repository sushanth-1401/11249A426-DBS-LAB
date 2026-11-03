CREATE TABLE Branch (
    branch_id    INT PRIMARY KEY,
    branch_name  VARCHAR(50) NOT NULL,
    city         VARCHAR(30),
    address      VARCHAR(100)
);

CREATE TABLE Customer (
    customer_id  INT PRIMARY KEY,
    name         VARCHAR(50) NOT NULL,
    address      VARCHAR(100),
    phone        VARCHAR(15),
    email        VARCHAR(50)
);

CREATE TABLE Account (
    account_no   INT PRIMARY KEY,
    account_type ENUM('Savings','Current') NOT NULL,
    balance      DECIMAL(12,2) DEFAULT 0.00,
    open_date    DATE,
    customer_id  INT,
    branch_id    INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (branch_id)   REFERENCES Branch(branch_id)
);

CREATE TABLE Transactions (
    txn_id       INT PRIMARY KEY,
    txn_date     DATE,
    txn_type     ENUM('Deposit','Withdrawal'),
    amount       DECIMAL(10,2),
    account_no   INT,
    FOREIGN KEY (account_no) REFERENCES Account(account_no)
);

CREATE TABLE Loan (
    loan_id       INT PRIMARY KEY,
    loan_type     VARCHAR(30),
    loan_amount   DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    branch_id     INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE Customer_Loan (
    customer_id  INT,
    loan_id      INT,
    apply_date   DATE,
    PRIMARY KEY (customer_id, loan_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (loan_id)     REFERENCES Loan(loan_id)
);

CREATE TABLE Employee (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    designation VARCHAR(30),
    salary      DECIMAL(10,2),
    branch_id   INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);
