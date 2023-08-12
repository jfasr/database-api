DROP SCHEMA lojinha CASCADE;
CREATE SCHEMA lojinha;

DROP TYPE lojinha.status_item_carrinho;
CREATE TYPE lojinha.status_item_carrinho AS ENUM ('comprado', 'cancelado', 'a reembolsar', 'reembolsado');

DROP TYPE lojinha.raridade_item;
CREATE TYPE lojinha.raridade_item AS ENUM ('comum', 'incomum', 'raro', 'épico', 'lendário');

DROP TYPE lojinha.tipo_item;
CREATE TYPE lojinha.tipo_item AS ENUM ('campeão', 'skin', 'croma', 'ícone', 'emote', 'skin sentinela');

DROP TABLE lojinha.usuario;
CREATE TABLE lojinha.usuario (
    email_primario text PRIMARY KEY,
    nome text NOT NULL,
    riot_points integer DEFAULT 0
);

DROP TABLE lojinha.email_secundario_usuario;
CREATE TABLE lojinha.email_secundario_usuario (
    email_secundario text PRIMARY KEY,
    usuario_email_primario text
        NOT NULL
        REFERENCES lojinha.usuario
        ON DELETE CASCADE
);

DROP TABLE lojinha.carrinho;
CREATE TABLE lojinha.carrinho (
    id_carrinho SERIAL PRIMARY KEY,
    usuario_email_primario text
        REFERENCES lojinha.usuario
        ON DELETE SET DEFAULT
);

DROP TABLE lojinha.item;
CREATE TABLE lojinha.item (
    id_item SERIAL PRIMARY KEY,
    nome text 
        NOT NULL
        CONSTRAINT nome_unico UNIQUE,
    tipo tipo_item NOT NULL,
    data_lancamento date DEFAULT CURRENT_DATE,
    raridade raridade_item NOT NULL,
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
    status status_item_carrinho NOT NULL,
    carrinho_id_carrinho SERIAL
        REFERENCES lojinha.carrinho
        ON DELETE CASCADE,
    item_id_item SERIAL
        REFERENCES lojinha.item
        ON DELETE CASCADE,
    PRIMARY KEY (carrinho_id_carrinho, item_id_item)
);

DROP TABLE lojinha.classe_campeao;
CREATE TABLE lojinha.classe_campeao (
    nome text PRIMARY KEY
);

DROP TABLE lojinha.campeao;
CREATE TABLE lojinha.campeao (
    item_id_item SERIAL
        NOT NULL
        REFERENCES lojinha.item
        ON DELETE CASCADE
        PRIMARY KEY,
    classe_campeao_primaria text
        DEFAULT 'indefinida'
        NOT NULL
        REFERENCES lojinha.classe_campeao
        ON DELETE SET DEFAULT,
    classe_campeao_secundaria text
        REFERENCES lojinha.classe_campeao
        ON DELETE SET NULL
);

DROP TABLE lojinha.linha_skin;
CREATE TABLE lojinha.linha_skin (
    nome text PRIMARY KEY
);

DROP TABLE lojinha.skin;
CREATE TABLE lojinha.skin (
    item_id_item SERIAL
        NOT NULL
        REFERENCES lojinha.item (id_item)
        ON DELETE CASCADE
        PRIMARY KEY,
    campeao_item_id_item SERIAL
        NOT NULL
        REFERENCES lojinha.campeao
        ON DELETE CASCADE,
    linha_skin_nome text
        REFERENCES lojinha.linha_skin
        ON DELETE SET NULL
);

DROP TABLE lojinha.croma;
CREATE TABLE lojinha.croma (
    item_id_item SERIAL
        NOT NULL
        REFERENCES lojinha.item
        ON DELETE CASCADE
        PRIMARY KEY,
    skin_item_id_item SERIAL
        NOT NULL
        REFERENCES lojinha.skin
        ON DELETE CASCADE
);
