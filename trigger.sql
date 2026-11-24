DELIMITER //

CREATE TRIGGER trg_atualiza_pedido_update
AFTER UPDATE ON Itens_Pedido
FOR EACH ROW
BEGIN
    UPDATE Pedidos
    SET valor = COALESCE((
        SELECT SUM(valor) 
        FROM Itens_Pedido 
        WHERE pedido_id = NEW.pedido_id
    ), 0)
    WHERE pedido_id = NEW.pedido_id;
END //

DELIMITER ;


INSERT INTO Pedidos (cliente_id, data, hora, valor)
VALUES (
    (SELECT cliente_id FROM Clientes WHERE nome = 'Claudiane Mendes Trigueiro Silva' LIMIT 1),
    CURDATE(),
    CURTIME(),
    0
);
SET @pedido1 = LAST_INSERT_ID();

INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade, valor) VALUES
(@pedido1, (SELECT pizza_id FROM Pizzas WHERE nome = 'Aliche' LIMIT 1), 2, 0),
(@pedido1, (SELECT pizza_id FROM Pizzas WHERE nome = 'Firense' LIMIT 1), 1, 0);

INSERT INTO Pedidos (cliente_id, data, hora, valor)
VALUES (
    (SELECT cliente_id FROM Clientes WHERE nome = 'Diogo Matos da Silva' LIMIT 1),
    CURDATE(),
    CURTIME(),
    0
);

SET @pedido2 = LAST_INSERT_ID();

INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade, valor) VALUES
(@pedido2, (SELECT pizza_id FROM Pizzas WHERE nome = 'Toscana' LIMIT 1), 2, 0),
(@pedido2, (SELECT pizza_id FROM Pizzas WHERE nome = 'Grega' LIMIT 1), 1, 0);

INSERT INTO Pedidos (cliente_id, data, hora, valor)
VALUES (
    (SELECT cliente_id FROM Clientes WHERE nome = 'Eder Almeida Batista de Oliveira' LIMIT 1),
    CURDATE(),
    CURTIME(),
    0
);

SET @pedido3 = LAST_INSERT_ID();

INSERT INTO Itens_Pedido (pedido_id, pizza_id, quantidade, valor) VALUES
(@pedido3, (SELECT pizza_id FROM Pizzas WHERE nome = 'Canadense' LIMIT 1), 1, 0),
(@pedido3, (SELECT pizza_id FROM Pizzas WHERE nome = 'Margherita' LIMIT 1), 2, 0);