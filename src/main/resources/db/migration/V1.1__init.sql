CREATE TABLE account
(
    id         SERIAL        NOT NULL,
    name       VARCHAR(2048) DEFAULT NULL,
    email      VARCHAR(4096) NOT NULL UNIQUE,
    balance    NUMERIC,
    created_at TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE account_transfer
(
    id              SERIAL  NOT NULL,
    sender_id       INTEGER          DEFAULT NULL,
    recipient_id    INTEGER NOT NULL,
    amount          NUMERIC NOT NULL,
    created_at      TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,
    status          INTEGER NOT NULL DEFAULT '0',
    comment         TEXT,
    transaction_ref VARCHAR(2048),
    FOREIGN KEY (sender_id) REFERENCES account (id),
    FOREIGN KEY (recipient_id) REFERENCES account (id),
    PRIMARY KEY (id)
);

