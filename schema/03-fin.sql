CREATE TABLE fin.bank (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO fin.bank(name) VALUES ('Banamex');
INSERT INTO fin.bank(name) VALUES ('BBVA Bancomer');
INSERT INTO fin.bank(name) VALUES ('BanDiego');
INSERT INTO fin.bank(name) VALUES ('Banorte');

CREATE TABLE fin.payment (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    name VARCHAR(20),
    is_digital BOOL
);

INSERT INTO fin.payment(name, is_digital) VALUES ('Efectivo', false);
INSERT INTO fin.payment(name, is_digital) VALUES ('Credito', true);
INSERT INTO fin.payment(name, is_digital) VALUES ('Debito', true);

CREATE TABLE fin.provider (
    id INTEGER GENERATED BY DEFAULT  AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE fin.provider_contact (
    provider INTEGER REFERENCES fin.provider(id),
    type INTEGER REFERENCES sys.communication(id),
    detail TEXT NOT NULL,
    is_main BOOL
);

CREATE TABLE fin.article_catalog (
    provider INTEGER REFERENCES fin.provider(id),
    article INTEGER REFERENCES inv.article(id)
);

CREATE TABLE fin.account (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    "user" INTEGER REFERENCES sys.account(id),
    bank INTEGER REFERENCES fin.bank(id),
    alias TEXT NOT NULL,
    number VARCHAR(20),
    balance MONEY,
    last_updated TIMESTAMP
);

CREATE TABLE fin.customer (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    "user" INTEGER REFERENCES sys.account(id),
    contact INTEGER REFERENCES sys.communication(id),
    contact_detail TEXT
);

CREATE TABLE fin.movements (
    id INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    account_from INTEGER REFERENCES fin.account(id),
    account_to INTEGER REFERENCES fin.account(id),
    payment_type INTEGER REFERENCES fin.payment(id),
    amount MONEY NOT NULL,
    tracking VARCHAR(20)
);