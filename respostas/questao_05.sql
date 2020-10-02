create trigger voar
after insert on voo
for each row
UPDATE public.piloto
	SET num_voos = num_voos + 1
	WHERE codigo = new.piloto;
