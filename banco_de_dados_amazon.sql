	create table cliente(
id int primary key,
nome varchar(50) not null,
email varchar(100) not null,
data_nascimento date not null
);

create table produto(
id int primary key,
nome varchar(50) not null,
descricao text,
preco numeric(10,2) not null
);

create table pedido(
id int primary key,
data_pedido date not null,
fk_cliente_id int not null,
foreign key (fk_cliente_id) references cliente(id)
);

create table avaliação(
id int primary key,
nota numeric(2,2) not null,
comentario text,
fk_cliente_id int not null,
fk_produto_id int not null,
foreign key (fk_cliente_id) references cliente(id),
foreign key (fk_produto_id) references produto(id)
);

create table categoria(
id int primary key,
nome varchar(50) not null
);

drop table categoria
create table produto_categoria(
fk_produto_id int,
fk_categoria_id int,
primary key(fk_produto_id, fk_categoria_id),
foreign key (fk_produto_id) references produto(id),
foreign key (fk_categoria_id) references categoria(id)
);

create table pedido_produto(
fk_pedido_id int,
fk_produto_id int,
primary key(fk_pedido_id, fk_produto_id),
quantidade numeric(10,1) not null,
foreign key (fk_pedido_id) references pedido(id),
foreign key (fk_produto_id) references produto(id)
);

SELECT c.id AS cliente_id, c.nome, c.email, c.data_nascimento,
p.id AS pedido_id, p.data_pedido
FROM cliente c
INNER JOIN pedido p ON c.id = p.fk_cliente_id;

SELECT pe.id AS pedido_id,
pe.data_pedido,
cl.nome AS cliente_nome,
pr.id AS produto_id,
pr.nome AS produto_nome,
pp.quantidade
FROM pedido pe
INNER JOIN pedido_produto pp ON pe.id = pp.fk_pedido_id
INNER JOIN produto pr ON pp.fk_produto_id = pr.id
INNER JOIN cliente cl ON pe.fk_cliente_id = cl.id;

SELECT
p.id AS produto_id,
p.nome AS produto_nome,
p.descricao AS produto_descricao,
p.preco AS produto_preco,
c.id AS categoria_id,
c.nome AS categoria_nome
FROM
produto p
INNER JOIN
produto_categoria pc ON p.id = pc.fk_produto_id
INNER JOIN
categoria c ON pc.fk_categoria_id = c.id
ORDER BY
p.id, c.id;

SELECT
av.id AS avaliacao_id,
av.nota,
av.comentario,
cl.id AS cliente_id,
cl.nome AS cliente_nome,
cl.email AS cliente_email,
cl.data_nascimento,
pr.id AS produto_id,
pr.nome AS produto_nome,
pr.descricao AS produto_descricao,
pr.preco AS produto_preco
FROM
avaliação av
INNER JOIN
cliente cl ON av.fk_cliente_id = cl.id
INNER JOIN
produto pr ON av.fk_produto_id = pr.id
ORDER BY
av.id;

SELECT
pr.id AS produto_id,
pr.nome AS produto_nome,
pr.descricao AS produto_descricao,
pr.preco AS produto_preco,
pp.quantidade
FROM
pedido_produto pp
INNER JOIN
produto pr ON pp.fk_produto_id = pr.id
WHERE
pp.fk_pedido_id = 1;

SELECT
pe.id AS pedido_id,
pe.data_pedido,
pr.id AS produto_id,
pr.nome AS produto_nome,
pp.quantidade
FROM
pedido pe
INNER JOIN
pedido_produto pp ON pe.id = pp.fk_pedido_id
INNER JOIN
produto pr ON pp.fk_produto_id = pr.id
INNER JOIN
cliente cl ON pe.fk_cliente_id = cl.id
WHERE
cl.id = 1;

SELECT
pr.id AS produto_id,
pr.nome AS produto_nome,
pr.descricao AS produto_descricao,
pr.preco AS produto_preco,
av.id AS avaliacao_id,
av.nota,
av.comentario,
cl.id AS cliente_id,
cl.nome AS cliente_nome,
cl.email AS cliente_email,
cl.data_nascimento
FROM
produto pr
LEFT JOIN
avaliação av ON pr.id = av.fk_produto_id
LEFT JOIN
cliente cl ON av.fk_cliente_id = cl.id
ORDER BY
pr.id, av.id;

SELECT
c.id AS categoria_id,
c.nome AS categoria_nome,
p.id AS produto_id,
p.nome AS produto_nome,
p.descricao AS produto_descricao,
p.preco AS produto_preco
FROM
categoria c
INNER JOIN
produto_categoria pc ON c.id = pc.fk_categoria_id
INNER JOIN
produto p ON pc.fk_produto_id = p.id
ORDER BY
c.id, p.id;

SELECT
cl.id AS cliente_id,
cl.nome AS cliente_nome,
cl.email AS cliente_email,
cl.data_nascimento,
pr.id AS produto_id,
pr.nome AS produto_nome,
pr.descricao AS produto_descricao,
pr.preco AS produto_preco,
pp.quantidade
FROM
cliente cl
INNER JOIN
pedido pe ON cl.id = pe.fk_cliente_id
INNER JOIN
pedido_produto pp ON pe.id = pp.fk_pedido_id
INNER JOIN
produto pr ON pp.fk_produto_id = pr.id
WHERE
cl.id = 1;

SELECT
av.id AS avaliacao_id,
av.nota,
av.comentario,
cl.id AS cliente_id,
cl.nome AS cliente_nome,
cl.email AS cliente_email,
cl.data_nascimento,
pr.id AS produto_id,
pr.nome AS produto_nome,
pr.descricao AS produto_descricao,
pr.preco AS produto_preco,
cat.id AS categoria_id,
cat.nome AS categoria_nome
FROM
avaliação av
INNER JOIN
cliente cl ON av.fk_cliente_id = cl.id
INNER JOIN
produto pr ON av.fk_produto_id = pr.id
INNER JOIN
produto_categoria pc ON pr.id = pc.fk_produto_id
INNER JOIN
categoria cat ON pc.fk_categoria_id = cat.id
WHERE
cat.nome = 'Nome da Categoria'; 
