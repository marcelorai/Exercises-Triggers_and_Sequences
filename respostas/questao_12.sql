CREATE TABLE IF NOT EXISTS public.cliente(
    codigo integer NOT NULL DEFAULT nextval('questao_10'),
    nome character varying(255)[],
    num_voos integer,
    PRIMARY KEY (codigo)
);
