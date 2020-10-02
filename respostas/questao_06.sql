create trigger adicionar_milhas after
insert into cliente_voo
UPDATE milhas SET quantidade = quantidade +
(SELECT distancia FROM voo, cliente_voo
WHERE new.voo = voo.codigo
) / 10
WHERE  cliente = new.cliente;
