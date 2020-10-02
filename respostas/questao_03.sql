CREATE TABLE if not exists public.cliente(
    codigo integer NOT NULL,
    nome character varying(255)[],
    num_voos integer,
    PRIMARY KEY (codigo)
);

CREATE TABLE if not exists public.piloto(
    codigo integer NOT NULL,
    nome character varying(255)[],
    num_voos integer,
    PRIMARY KEY (codigo)
);

CREATE TABLE if not exists public.voo(
    codigo integer NOT NULL,
    piloto integer NOT NULL,
    distancia integer NOT NULL,
    num_passageiros integer,
    tipo character varying(255)[],
    PRIMARY KEY (codigo),
    CONSTRAINT cod_piloto FOREIGN KEY (piloto)
        REFERENCES piloto(codigo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE if not exists public.milhas(
    cliente integer NOT NULL,
    quantidade integer,
    PRIMARY KEY (cliente),
    CONSTRAINT cod_cliente FOREIGN KEY (cliente)
        REFERENCES cliente(codigo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE if not exists public.cliente_voo(
    cliente integer NOT NULL,
    voo integer NOT NULL,
    classe character varying(255)[],
    PRIMARY KEY (voo, cliente),
    CONSTRAINT cod_cliente FOREIGN KEY (cliente)
        REFERENCES cliente(codigo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
