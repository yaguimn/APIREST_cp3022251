
CREATE DATABASE IF NOT EXISTS estoque_db;

USE estoque_db;


CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE fornecedor (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    contato VARCHAR(255)
);

CREATE TABLE produto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    preco DOUBLE,
    categoria_id BIGINT,
    CONSTRAINT fk_produto_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES tb_categorias(id)
        ON DELETE SET NULL
);

CREATE TABLE estoque (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    qtd INT,
    produto_id BIGINT UNIQUE,
    CONSTRAINT fk_estoque_produto
        FOREIGN KEY (produto_id)
        REFERENCES produto(id)
        ON DELETE CASCADE
);

CREATE TABLE produto_fornecedor (
    produto_id BIGINT,
    fornecedor_id BIGINT,
    PRIMARY KEY (produto_id, fornecedor_id),
    CONSTRAINT fk_pf_produto
        FOREIGN KEY (produto_id)
        REFERENCES produto(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_pf_fornecedor
        FOREIGN KEY (fornecedor_id)
        REFERENCES fornecedor(id)
        ON DELETE CASCADE
); 
