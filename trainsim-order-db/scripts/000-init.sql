CREATE TABLE travelers (
    id SERIAL PRIMARY KEY,
    firstName TEXT NOT NULL,
    lastName TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    CONSTRAINT unq_travelers UNIQUE(firstName, lastName, email, phone)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    userID int NOT NULL,
    status TEXT NOT NULL DEFAULT 'Paid',
    createdTime TIMESTAMP NOT NULL DEFAULT NOW(),
    updatedTime TIMESTAMP,
    address TEXT NOT NULL
);

CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    orderID INT REFERENCES orders (id) NOT NULL,
    travelerID INT REFERENCES travelers (id) NOT NULL,
    itineraryID UUID NOT NULL,
    price REAL NOT NULL
);