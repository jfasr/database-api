DROP SCHEMA lojinha CASCADE;
CREATE SCHEMA lojinha;

DROP TYPE lojinha.status_item_carrinho;
CREATE TYPE lojinha.status_item_carrinho AS ENUM ('comprado', 'cancelado', 'a reembolsar', 'reembolsado');

DROP TYPE lojinha.raridade_item;
CREATE TYPE lojinha.raridade_item AS ENUM ('comum', 'incomum', 'raro', 'épico', 'lendário');

DROP TYPE lojinha.tipo_item;
CREATE TYPE lojinha.tipo_item AS ENUM ('campeão', 'skin', 'croma', 'ícone', 'emote', 'skin sentinela');

DROP TYPE lojinha.dificuldade_campeao;
CREATE TYPE lojinha.dificuldade_campeao AS ENUM ('fácil', 'médio', 'difícil');

DROP TABLE lojinha.usuario;
CREATE TABLE lojinha.usuario (
    email_primario text PRIMARY KEY,
    nome text NOT NULL,
    riot_points integer DEFAULT 0
);

DROP TABLE lojinha.email_secundario_usuario;
CREATE TABLE lojinha.email_secundario_usuario (
    email_secundario text PRIMARY KEY,
    email_primario_usuario text
        NOT NULL
        REFERENCES lojinha.usuario
        ON DELETE CASCADE
);

DROP TABLE lojinha.carrinho;
CREATE TABLE lojinha.carrinho (
    id_carrinho SERIAL PRIMARY KEY,
    email_usuario text
        REFERENCES lojinha.usuario
        ON DELETE SET DEFAULT
);

DROP TABLE lojinha.item;
CREATE TABLE lojinha.item (
    id_item SERIAL PRIMARY KEY,
    nome text 
        NOT NULL
        CONSTRAINT nome_unico UNIQUE,
    tipo lojinha.tipo_item NOT NULL,
    data_lancamento date DEFAULT CURRENT_DATE,
    raridade lojinha.raridade_item NOT NULL,
    preco_rp integer
        CONSTRAINT preco_positivo CHECK (preco_rp > 0)
        NOT NULL,
    desconto numeric
        DEFAULT 1.0
        CONSTRAINT desconto_valido CHECK (desconto > 0 AND desconto <= 1)
        NOT NULL,
    preco_final numeric 
        GENERATED ALWAYS AS (preco_rp * desconto) STORED
);

DROP TABLE lojinha.item_carrinho;
CREATE TABLE lojinha.item_carrinho (
    status lojinha.status_item_carrinho NOT NULL,
    id_carrinho SERIAL
        REFERENCES lojinha.carrinho
        ON DELETE CASCADE,
    id_item SERIAL
        REFERENCES lojinha.item
        ON DELETE CASCADE,
    data_adicao date DEFAULT CURRENT_DATE,
    PRIMARY KEY (id_carrinho, id_item)
);

DROP TABLE lojinha.classe_campeao;
CREATE TABLE lojinha.classe_campeao (
    nome text PRIMARY KEY
);

DROP TABLE lojinha.campeao;
CREATE TABLE lojinha.campeao (
    id_campeao SERIAL
        NOT NULL
        REFERENCES lojinha.item
        ON DELETE CASCADE
        PRIMARY KEY,
    classe_primaria text
        DEFAULT 'indefinida'
        NOT NULL
        REFERENCES lojinha.classe_campeao
        ON DELETE SET DEFAULT,
    dificuldade lojinha.dificuldade_campeao NOT NULL,
    classe_secundaria text
        REFERENCES lojinha.classe_campeao
        ON DELETE SET NULL
);

DROP TABLE lojinha.linha_skin;
CREATE TABLE lojinha.linha_skin (
    nome text PRIMARY KEY
);

DROP TABLE lojinha.skin;
CREATE TABLE lojinha.skin (
    id_item SERIAL
        NOT NULL
        REFERENCES lojinha.item (id_item)
        ON DELETE CASCADE
        PRIMARY KEY,
    id_campeao SERIAL
        NOT NULL
        REFERENCES lojinha.campeao
        ON DELETE CASCADE,
    nome_linha_skin text
        REFERENCES lojinha.linha_skin
        ON DELETE SET NULL
);

DROP TABLE lojinha.croma;
CREATE TABLE lojinha.croma (
    id_item SERIAL
        NOT NULL
        REFERENCES lojinha.item
        ON DELETE CASCADE
        PRIMARY KEY,
    id_skin SERIAL
        NOT NULL
        REFERENCES lojinha.skin
        ON DELETE CASCADE
);
