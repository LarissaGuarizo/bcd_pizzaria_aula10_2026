--A
show tables;

--B
select * from clientes;
select count(*) from clientes;
select count(*) as `total de clientes` from clientes;

--C 
select count(*) as `total de pizzas` from pizzas;

--D 
select * from pedidos;
select * from itens_pedido;
select * from itens_pedido where

SELECT i.*, p.pedido_id, c.nome AS cliente, pi.nome AS pizza (i.preco_unitario * i.quantidade) AS subtotal FROM pedidos p JOIN clientes c ON p.cliente_id = c.cliente_id JOIN itens_pedido i ON i.pedido_id = p.pedido_id JOIN pizzas pi ON i.pizza_id = pi.pizza_id;


dml
INSERT INTO Clientes (nome, logradouro, numero, bairro, referencia)
    -> VALUES ('Gaspar Oliveira', 'Rua Alcides Postali', 21, 'São Dimas', 'Ao lado da igreja');

INSERT INTO Telefones (cliente_id, telefone)
VALUES ((SELECT Cliente_id FROM Clientes WHERE nome = 'Gaspar Oliveira' LIMIT 1), '19 99898-1141');

INSERT INTO Pedidos (cliente_id, data, hora, valor)
VALUES ((SELECT Cliente_id FROM Clientes WHERE nome = 'Gaspar Oliveira' LIMIT 1), CURDATE(), CURTIME(), 0.00);

INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade, valor)
VALUES 
((SELECT pedido_id FROM Pedidos WHERE cliente_id = (SELECT Cliente_id FROM Clientes WHERE nome = 'Gaspar Oliveira' LIMIT 1) ORDER BY pedido_id DESC LIMIT 1),
 (SELECT pizza_id FROM Pizzas WHERE nome = 'Margherita' LIMIT 1), 1, (SELECT valor FROM Pizzas WHERE nome = 'Margherita' LIMIT 1)),
((SELECT pedido_id FROM Pedidos WHERE cliente_id = (SELECT Cliente_id FROM Clientes WHERE nome = 'Gaspar Oliveira' LIMIT 1) ORDER BY pedido_id DESC LIMIT 1),
 (SELECT pizza_id FROM Pizzas WHERE nome = 'Napolitana' LIMIT 1), 2, (SELECT valor FROM Pizzas WHERE nome = 'Napolitana' LIMIT 1));

 INSERT INTO Pedidos (cliente_id, data, hora, valor)
VALUES ((SELECT Cliente_id FROM Clientes WHERE nome = 'Gaspar Oliveira' LIMIT 1), CURDATE(), CURTIME(), 0.00);

INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade, valor)
VALUES 
((SELECT pedido_id FROM Pedidos WHERE cliente_id = (SELECT Cliente_id FROM Clientes WHERE nome = 'Gaspar Oliveira' LIMIT 1) ORDER BY pedido_id DESC LIMIT 1),
 (SELECT pizza_id FROM Pizzas WHERE nome = 'A moda do chef' LIMIT 1), 2, (SELECT valor FROM Pizzas WHERE nome = 'A moda do chef' LIMIT 1));

UPDATE Itens_Pedido 
SET quantidade = 3 
WHERE pedido_id = (SELECT pedido_id FROM Pedidos WHERE cliente_id = (SELECT Cliente_id FROM Clientes WHERE nome = 'Gaspar Oliveira' LIMIT 1) ORDER BY pedido_id DESC LIMIT 1)
  AND pizza_id = (SELECT pizza_id FROM Pizzas WHERE nome = 'A moda do chef' LIMIT 1);

  INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade, valor)
VALUES 
((SELECT pedido_id FROM Pedidos WHERE cliente_id = (SELECT Cliente_id FROM Clientes WHERE nome = 'Gaspar Oliveira' LIMIT 1) ORDER BY pedido_id DESC LIMIT 1),
 (SELECT pizza_id FROM Pizzas WHERE nome = 'Margherita' LIMIT 1), 1, (SELECT valor FROM Pizzas WHERE nome = 'Margherita' LIMIT 1));