create trigger adicionar_milhas
after insert on cliente
for each row
insert into milhas(cliente, quantidade)
values (new.codigo, 0);
