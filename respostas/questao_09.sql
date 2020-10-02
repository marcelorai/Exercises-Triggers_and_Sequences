create trigger add_milhas after
insert on cliente
AS
UPDATE cliente_voo;
