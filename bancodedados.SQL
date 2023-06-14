CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(16) not NULL,
  sobrenome VARCHAR(24) not NULL,
  idade INT,
  pais VARCHAR(4)
);
 
CREATE TABLE pedido (
  ID SERIAL PRIMARY KEY,
  item VARCHAR(48) NOT NULL,
  quantidade INT NOT NULL,
  fk_id_cliente INT NOT NULL,
  CONSTRAINT fk_cliente FOREIGN KEY (fk_id_cliente) REFERENCES cliente(id)
);
 
INSERT INTO cliente (nome, sobrenome, idade, pais) VALUES
  ('João', 'Alves', 48, 'BR'),
  ('Roberto', 'Garcia', 36, 'MX'),
  ('Dario', 'Rubens', 39, 'ARG'),
  ('Julia', 'Lopes', 28, 'PE'),
  ('Rebeca', 'Giglio', 54, 'IT');
  
INSERT INTO pedido (item, quantidade, fk_id_cliente) VALUES
  ('teclado', 1, 4),
  ('mouse', 2, 4),
  ('monitor', 8, 3),
  ('teclado', 1, 1),
  ('mousepad', 4, 2);

--- 12-06-2023 19:41:31
--- PostgreSQL
CREATE TABLE cliente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(16) not NULL,
  sobrenome VARCHAR(24) not NULL,
  idade INT,
  pais VARCHAR(4)
);
 
CREATE TABLE pedido (
  ID SERIAL PRIMARY KEY,
  item VARCHAR(48) NOT NULL,
  quantidade INT NOT NULL,
  fk_id_cliente INT NOT NULL,
  CONSTRAINT fk_cliente FOREIGN KEY (fk_id_cliente) REFERENCES cliente(id)
);
 
INSERT INTO cliente (nome, sobrenome, idade, pais) VALUES
  ('João', 'Alves', 48, 'BR'),
  ('Roberto', 'Garcia', 36, 'MX'),
  ('Dario', 'Rubens', 39, 'ARG'),
  ('Julia', 'Lopes', 28, 'PE'),
  ('Rebeca', 'Giglio', 54, 'IT');
  
INSERT INTO pedido (item, quantidade, fk_id_cliente) VALUES
  ('teclado', 1, 4),
  ('mouse', 2, 4),
  ('monitor', 8, 3),
  ('teclado', 1, 1),
  ('mousepad', 4, 2);

--- 12-06-2023 19:58:37
--- PostgreSQL.2
select * From pedido
INNER JOIN cliente
ON pedido.fk_id_cliente = cliente.id;

--- 12-06-2023 19:59:11
--- PostgreSQL.3
--- comando inner join
---O INNER JOIN junção mais comum e retorna apenas os registros que possuem correspondência em ambas as tabelas sendo unidas. Ele combina as linhas das tabelas com base nas colunas especificadas na condição de junção.
select pedido.id AS pedido_id, cliente.id AS cliente_id 
From pedido
INNER JOIN cliente
ON pedido.fk_id_cliente = cliente.id;

---LEFT JOIN:(também conhecido como LEFT OUTER JOIN) retorna todos os registros da tabela à esquerda e os registros correspondentes da tabela à direita. Se não houver correspondência, os campos da tabela à direita serão preenchidos com NULL.
select pedido.id AS pedido_id, cliente.id AS cliente_id 
From pedido
LEFT JOIN cliente
ON pedido.fk_id_cliente = cliente.id;


--- 12-06-2023 20:00:21
--- PostgreSQL.2
---RIGHT JOIN:(também conhecido como RIGHT OUTER JOIN) é o oposto do LEFT JOIN. Ele retorna todos os registros da tabela à direita e os registros correspondentes da tabela à esquerda. Se não houver correspondência, os campos da tabela à esquerda serão preenchidos com NULL.
select pedido.id AS pedido_id, cliente.id AS cliente_id 
From pedido
RIGHT JOIN cliente
ON pedido.fk_id_cliente = cliente.id;

---Outer Join, Full Outer Join ou Full Join
---UNION: Esse método pode não existir nas consultas de alguns Sistemas de Gerenciamento de Banco de Dados, como o MySQL. Assim, para apresentar os dados da tabela, precisamos informar que queremos os dados da tabela à esquerda, ou seja, da tabela que está em Left Join. Depois, juntamos os dados desta tabela com os dados da tabela Right Join. Por isso, temos o comando union, que une os dados de ambas as tabelas e os apresenta como resultado.
select pedido.id AS pedido_id, cliente.id AS cliente_id 
From pedido
LEFT JOIN cliente
ON pedido.fk_id_cliente = cliente.id;
UNION
select pedido.id AS pedido_id, cliente.id AS cliente_id 
From pedido
RIGHT JOIN cliente
ON pedido.fk_id_cliente = cliente.id;

---FULL OUTER JOIN:(também conhecido como FULL JOIN ou OUTER JOIN) retorna todos os registros das duas tabelas sendo unidas, combinando os registros onde houver correspondência. Se não houver correspondência, os campos das tabelas não correspondentes serão preenchidos com NULL.
select pedido.id AS pedido_id, cliente.id AS cliente_id 
From pedido
FULL OUTER JOIN cliente
ON pedido.fk_id_cliente = cliente.id;

 ---o FULL OUTER JOIN não é suportado por todos os bancos de dados, então a sintaxe pode variar dependendo do sistema de gerenciamento de banco de dados (SGBD) utilizado.


