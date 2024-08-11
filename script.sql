-- Criação do Banco de Dados para o cenário de E-COMMERCE
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criação da Tabela Cliente
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(15),
    Minit VARCHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(255),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);
ALTER TABLE clients AUTO_INCREMENT = 1;

-- Criação da Tabela Produto
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(15) NOT NULL,
    Classification_kids BOOL DEFAULT FALSE,
    Category ENUM('Eletronico', 'Vestimenta', 'Brinquedos', 'Esportes', 'Alimentos', 'Veiculos') NOT NULL,
    Feedback FLOAT DEFAULT 0,
    Size VARCHAR(10)
);
ALTER TABLE product AUTO_INCREMENT = 1;

-- Criação da Tabela Pedido
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    OrderStatus ENUM('Cancelado', 'Confirmado', 'Em Processamento') DEFAULT 'Em Processamento',
    OrderDescription VARCHAR(255),
    ShippingCost FLOAT DEFAULT 10,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);
ALTER TABLE orders AUTO_INCREMENT = 1;

-- Criação da Tabela Estoque
CREATE TABLE productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    StorageLocation VARCHAR(255),
    Quantity INT DEFAULT 0
);
ALTER TABLE productStorage AUTO_INCREMENT = 1;

-- Criação da Tabela Fornecedor
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);
ALTER TABLE supplier AUTO_INCREMENT = 1;

-- Criação da Tabela Vendedor
CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(14),
    CPF CHAR(11),
    Location VARCHAR(255),
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_CNPJ_seller UNIQUE (CNPJ),
    CONSTRAINT unique_CPF_seller UNIQUE (CPF)
);
ALTER TABLE seller AUTO_INCREMENT = 1;

-- Criação da Relação M:N entre Produto e Vendedor
CREATE TABLE productSeller (
    idPseller INT,
    idPproduct INT,
    ProdQuantity INT DEFAULT 1,
    PRIMARY KEY (idPseller, idPproduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)
);

-- Criação da Relação M:N entre Produto e Pedido
CREATE TABLE productOrder (
    idPOproduct INT,
    idPOorder INT,
    PoQuantity INT DEFAULT 1,
    poStatus ENUM('Disponivel', 'Sem Estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_productOrder_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productOrder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Criação da Relação M:N entre Estoque e Produto
CREATE TABLE storeagelocation (
    idLproduct INT,
    idLstorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

-- Criação da Relação M:N entre Produto e Fornecedor
CREATE TABLE ProductSupplier (
    idPsSupplier INT,
    idPsProduct INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (idPsSupplier, idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) REFERENCES product(idProduct)
);

-- Verificação das Tabelas Criadas
SHOW TABLES;

-- Verificação dos Bancos de Dados
SHOW DATABASES;

-- Verificação das Constraints Referenciais
USE information_schema;
SELECT * FROM referential_constraints WHERE CONSTRAINT_SCHEMA = 'ecommerce';

