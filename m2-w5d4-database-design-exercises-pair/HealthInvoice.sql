BEGIN TRANSACTION
COMMIT
ROLLBACK

CREATE table pet_types (
pet_type_id SERIAL PRIMARY KEY,
name VARCHAR (255)
);

CREATE table pets (
pet_id SERIAL PRIMARY KEY,
pet_type_id INT REFERENCES pet_types (pet_type_id) NOT NULL,
name VARCHAR (255) NOT NULL
);

CREATE table invoice (
invoice_id SERIAL PRIMARY KEY,
date timestamp NOT NULL,
hospital_name VARCHAR(255) NOT NULL
);

CREATE table owners (
owner_id SERIAL PRIMARY KEY,
address VARCHAR (255)NOT NULL,
city VARCHAR (255) NOT NULL,
district VARCHAR (255) NOT NULL,
zip_code VARCHAR (255) NOT NULL,
invoice_id INT REFERENCES invoice (invoice_id) NOT NULL
);

CREATE table procedures (
procedure_id SERIAL PRIMARY KEY,
amount DECIMAL NOT NULL,
pet_type_id INT REFERENCES pet_types (pet_type_id) NOT NULL
);

CREATE table pet_owner (
pet_id INT REFERENCES pets (pet_id) NOT NULL,
owner_id INT REFERENCES owners (owner_id) NOT NULL,
constraint pk_pet_owner_pet_id_owner_id PRIMARY KEY (pet_id, owner_id) 
);

CREATE table pet_procedures (
pet_id INT REFERENCES pets (pet_id) NOT NULL,
procedure_id INT REFERENCES procedures (procedure_id) NOT NULL,
constraint pk_pet_procedures_pet_id_procedure_id PRIMARY KEY (pet_id, procedure_id) 
);
