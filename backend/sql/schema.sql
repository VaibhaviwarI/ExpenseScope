CREATE TABLE participants(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE expenses(
    id SERIAL PRIMARY KEY,
    expense_date DATE,
    description TEXT,
    amount NUMERIC(10,2),
    currency VARCHAR(10),
    paid_by INTEGER REFERENCES participants(id),
    split_type VARCHAR(20)
);

CREATE TABLE splits(
    id SERIAL PRIMARY KEY,
    expense_id INTEGER REFERENCES expenses(id),
    participant_id INTEGER REFERENCES participants(id),
    share_value NUMERIC(10,2)
);

CREATE TABLE settlements(
    id SERIAL PRIMARY KEY,
    payer_id INTEGER REFERENCES participants(id),
    receiver_id INTEGER REFERENCES participants(id),
    amount NUMERIC(10,2),
    currency VARCHAR(10)
);

CREATE TABLE import_logs(
    id SERIAL PRIMARY KEY,
    anomaly_type VARCHAR(100),
    record_data TEXT,
    action_taken TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);