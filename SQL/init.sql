-- Drop table

-- DROP TABLE complaint.users;

CREATE TABLE complaint.users (
	id serial NOT NULL,
	user_name varchar NULL,
	"password" varchar NULL
);

-- Drop table

-- DROP TABLE complaint.lkp_complaint;

CREATE TABLE complaint.lkp_complaint (
	id int4 NOT NULL,
	c_type varchar(50) NULL,
	CONSTRAINT lkp_complaint_pk PRIMARY KEY (id)
);

-- Drop table

-- DROP TABLE complaint.fact_complaints;

CREATE TABLE complaint.fact_complaints (
	c_id serial NOT NULL,
	u_id int4 NULL,
	mobile int8 NULL,
	problem_date varchar NULL,
	"comments" varchar(500) NULL,
	c_type int4 NULL,
	status varchar NULL
);