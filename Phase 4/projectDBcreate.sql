-- Subscription Table
CREATE TABLE F23_S001_T5_Subscription (
    SubscriptionID INT PRIMARY KEY,
    SubscriptionCost DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE
);

-- Students Table
CREATE TABLE F23_S001_T5_Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$')),
    Ratings FLOAT CHECK (Ratings >= 1 AND Ratings <= 5),
    Reviews VARCHAR(255),
    SubscriptionID INT,
    FOREIGN KEY (SubscriptionID) REFERENCES F23_S001_T5_Subscription(SubscriptionID) ON DELETE CASCADE
);


-- Device Table
CREATE TABLE F23_S001_T5_Device (
    Type VARCHAR(20),
    DeviceID INT PRIMARY KEY,
    DeviceName VARCHAR(255),
    StudentID INT,
    FOREIGN KEY (StudentID) REFERENCES F23_S001_T5_Students(StudentID) ON DELETE CASCADE
);


-- Subscription Payment History Table
CREATE TABLE F23_S001_T5_SubscriptionPaymentHistory (
    TransactionID INT PRIMARY KEY,
    SubscriptionID INT,
    PaidAmount DECIMAL(10, 2),
    FOREIGN KEY (SubscriptionID) REFERENCES F23_S001_T5_Subscription(SubscriptionID) ON DELETE CASCADE
);

--Subscription Benefits Table
CREATE TABLE F23_S001_T5_SubscriptionBenefits (
    BenefitID INT PRIMARY KEY,
    SubscriptionID INT,
    PremiumContent VARCHAR(255),
    CommunityConnect VARCHAR(255),
    Livestream VARCHAR(255),
    FOREIGN KEY (SubscriptionID) REFERENCES F23_S001_T5_Subscription(SubscriptionID) ON DELETE CASCADE
);
-- Admin Table
CREATE TABLE F23_S001_T5_Admin (
    AdminID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    AccessKey VARCHAR(10)
);

-- Series/Data Distributor Table
-- Series/Data Distributor Table
CREATE TABLE F23_S001_T5_SeriesDistributor (
    SeriesDistributorID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) CHECK (REGEXP_LIKE(Email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$')),
    Salary DECIMAL(10, 2),
    ContractDuration INT,
    AdminID INT,
    FOREIGN KEY (AdminID) REFERENCES F23_S001_T5_Admin(AdminID) ON DELETE CASCADE
);

-- Media Table
CREATE TABLE F23_S001_T5_Media (
    ContentID INT PRIMARY KEY,
    Title VARCHAR(255),
    ReleaseDate DATE,
    Duration INT,
    Views INT,
    Genre VARCHAR(255),
    Language VARCHAR(255),
    SeriesID INT,
    AdminID INT,
    SubscriptionID INT,
    FOREIGN KEY (SeriesID) REFERENCES F23_S001_T5_SeriesDistributor(SeriesDistributorID) ON DELETE CASCADE,
    FOREIGN KEY (AdminID) REFERENCES F23_S001_T5_Admin(AdminID) ON DELETE CASCADE,
    FOREIGN KEY (SubscriptionID) REFERENCES F23_S001_T5_Subscription(SubscriptionID) ON DELETE CASCADE
);

-- Watches Table
CREATE TABLE F23_S001_T5_Watches (
    StudentID INT,
    ContentID INT,
    PRIMARY KEY (StudentID, ContentID),
    FOREIGN KEY (StudentID) REFERENCES F23_S001_T5_Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (ContentID) REFERENCES F23_S001_T5_Media(ContentID) ON DELETE CASCADE
);
