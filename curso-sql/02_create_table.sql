-- CREATE TABLE clientes (
--     "idCliente" TEXT PRIMARY KEY,
--     "flEmail" INTEGER,
--     "flTwitch" INTEGER,
--     "flYouTube" INTEGER,
--     "flBlueSky" INTEGER,
--     "flInstagram" INTEGER,
--     "qtdePontos" INTEGER,
--     "dtCriacao" TIMESTAMP,
--     "dtAtualizacao" TIMESTAMP
-- );

-- CREATE TABLE produtos (
--     "IdProduto" TEXT PRIMARY KEY,
--     "DescNomeProduto" TEXT,
--     "DescDescricaoProduto" TEXT,
--     "DescCategoriaProduto" TEXT
-- );

-- CREATE TABLE transacoes (
--     "IdTransacao" TEXT PRIMARY KEY,
--     "IdCliente" TEXT,
--     "DtCriacao" TIMESTAMP,
--     "QtdePontos" INTEGER,
--     "DescSistemaOrigem" TEXT
-- );

CREATE TABLE transacao_produto (
    "idTransacaoProduto" TEXT PRIMARY KEY,
    "IdTransacao" TEXT,
    "IdProduto" TEXT,
    "QtdeProduto" INTEGER,
    "vlProduto" INTEGER
);

