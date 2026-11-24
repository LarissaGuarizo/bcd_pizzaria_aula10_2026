-- Criando Funções (Exemplo de uma função que formata valores como moeda)
-- Vamos utilizar o banco de dados Pizzaria da aula anterior
use pizzaria;
-- Verificar quais functions um Banco de Dados possui
show function status;
-- Versão 1
drop function if exists moeda;

create function moeda(v float) returns text
return concat("R$ ",v);
-- testando
select moeda(4.9);
-- Versão 2
drop function if exists moeda;
delimiter //
create function moeda(v float) returns text
Begin
    return concat("R$ ",v);
end//
delimiter ;
-- testando
select moeda(5.99);
-- Para excluir uma função
drop function if exists moeda;
-- Criar a função novamente modificada com declaração de variáveis
delimiter //
create function moeda(v float) returns text
begin
    declare x varchar(20);
    set x = format(v,2,'de_DE');
    return concat("R$ ",x);
end//
delimiter ;
-- testando em uma consulta da tabela de pizzas
select pizza_id, nome, moeda(valor) as 'preço' from pizzas;


CREATE PROCEDURE pedido_de_um_item(cliente_id int, pizza_id int, qtd int)
begin
    DECLARE codigo_do_pedido_criado INT;
    
    INSERT INTO pedidos(cliente_id) VALUES (cliente_id);
    
    SET codigo_do_pedido_criado = LAST_INSERT_ID();
    
    INSERT INTO itens_pedido(pedido_id, pizza_id, quantidade) 
    VALUES(codigo_do_pedido_criado, pizza_id, qtd);
END$$


SELECT cliente_id from clientes where nome = "Thamires de Campos Luz";
SELECT cliente_id from clientes where nome = "Everton Jose de Souza";
SELECT cliente_id from clientes where nome = "Silvia Roberta de Jesus Garcia";

CALL pedido_de_um_item(4, 41, 1);
CALL pedido_de_um_item(60, 39, 2);
CALL pedido_de_um_item(7, 14, 2);

DROP PROCEDURE IF EXISTS pedido_de_um_item;

DELIMITER $$

