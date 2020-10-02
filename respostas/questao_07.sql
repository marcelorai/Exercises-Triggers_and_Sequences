create trigger adicionar_passageiro after
insert ON cliente_voo
UPDATE voo
SET num_passageiros = num_passageiros + 1
WHERE new.voo = voo.codigo;
