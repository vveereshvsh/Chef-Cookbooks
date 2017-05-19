

  CREATE TABLE customers(
	id char (36) NOT NULL,
        PRIMARY KEY(id),
        first_name VARCHAR(64),
        last_name VARCHAR(64),
        email VARCHAR(64)
  );

  INSERT INTO customers ( id, first_name, last_name, email ) values ( uuid(), 'Veeresh', 'Halburgi', 'veeresh@gmail.com');
  INSERT INTO customers ( id, first_name, last_name, email ) values ( uuid(), 'Jane', 'Smith', 'jane.smith@example.com');
  

