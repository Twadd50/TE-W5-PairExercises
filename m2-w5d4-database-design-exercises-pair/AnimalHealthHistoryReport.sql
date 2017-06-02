BEGIN TRANSACTION
COMMIT
ROLLBACK

CREATE TABLE pets (
pet_id SERIAL PRIMARY KEY,
name VARCHAR (255) NOT NULL,
type VARCHAR (255) NOT NULL,
age INT NOT NULL
);

CREATE TABLE owners (
owner_id SERIAL PRIMARY KEY,
name VARCHAR (255) NOT NULL
);

CREATE TABLE visits (
visit_id SERIAL PRIMARY KEY,
visit_date TIMESTAMP NOT NULL
);



CREATE TABLE procedures (
procedure_id SERIAL PRIMARY KEY,
name VARCHAR (255) NOT NULL
);

CREATE TABLE pet_owner (
pet_id INT REFERENCES pets (pet_id) NOT NULL, 
owner_id INT REFERENCES owners (owner_id) NOT NULL,
constraint pk_pet_owner_pet_id_owner_id PRIMARY KEY (pet_id, owner_id)
);

CREATE TABLE visit_pet (
visit_id INT REFERENCES visits (visit_id) not null,
pet_id INT REFERENCES pets (pet_id) not null,
constraint pk_visit_pet_pet_id_visit_id PRIMARY KEY (pet_id, visit_id)
);

CREATE TABLE procedure_visit (
visit_id INT REFERENCES visits (visit_id) NOT NULL,
procedure_id INT REFERENCES procedures (procedure_id) NOT NULL,
constraint pk_procedure_visit_visit_id_procedure_id PRIMARY KEY (procedure_id, visit_id)
);

