-- Gerado por Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   em:        2021-10-01 21:30:11 GFT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g
-- predefined type, no DDL - MDSYS.SDO_GEOMETRY
-- predefined type, no DDL - XMLTYPE
CREATE TABLE dm_clientes (
    id_cliente NUMBER(6) NOT NULL,
    nome_cliente VARCHAR2(80) NOT NULL
);
ALTER TABLE dm_clientes
ADD CONSTRAINT dm_clientes_pk PRIMARY KEY (id_cliente);
CREATE TABLE dm_fornecedores (
    id_forn NUMBER(6) NOT NULL,
    nom_forn VARCHAR2(200) NOT NULL,
    regiao_forn VARCHAR2(20) NOT NULL
);
ALTER TABLE dm_fornecedores
ADD CONSTRAINT dm_fornecedores_pk PRIMARY KEY (id_forn);
CREATE TABLE dm_produtos (
    id_prod NUMBER(6) NOT NULL,
    dsc_prod VARCHAR2(200) NOT NULL,
    classe_prod VARCHAR2(50) NOT NULL
);
ALTER TABLE dm_produtos
ADD CONSTRAINT dm_produtos_pk PRIMARY KEY (id_prod);
CREATE TABLE dm_tempo (
    id_tempo NUMBER(8) NOT NULL,
    nu_ano NUMBER(4) NOT NULL,
    nu_mes NUMBER(2) NOT NULL,
    nu_anomes NUMBER(7) NOT NULL,
    sg_mes CHAR(3) NOT NULL,
    nm_mesano CHAR(8) NOT NULL,
    nm_mes VARCHAR2(15) NOT NULL,
    nu_dia NUMBER(2) NOT NULL
);
ALTER TABLE dm_tempo
ADD CONSTRAINT dm_tempo_pk PRIMARY KEY (id_tempo);
CREATE TABLE dm_tipos_vendas (
    id_tipo_venda NUMBER(3) NOT NULL,
    desc_tipo_venda VARCHAR2(200) NOT NULL
);
ALTER TABLE dm_tipos_vendas
ADD CONSTRAINT dm_tipos_vendas_pk PRIMARY KEY (id_tipo_venda);
CREATE TABLE ft_impontualidade (
    id_tempo NUMBER(8) NOT NULL,
    id_cliente NUMBER(6) NOT NULL,
    valor_parc_atrasadas NUMBER(10, 2) NOT NULL,
    valor_parc_total NUMBER(10, 2) NOT NULL
);
ALTER TABLE ft_impontualidade
ADD CONSTRAINT ft_impontualidade_pk PRIMARY KEY (id_tempo, id_cliente);
CREATE TABLE ft_vendas (
    id_prod NUMBER(6) NOT NULL,
    id_tempo NUMBER(8) NOT NULL,
    id_tipo_venda NUMBER(3) NOT NULL,
    id_forn NUMBER(6) NOT NULL,
    valor_venda NUMBER(10, 2) NOT NULL
);
ALTER TABLE ft_vendas
ADD CONSTRAINT ft_vendas_pk PRIMARY KEY (id_forn, id_prod, id_tempo, id_tipo_venda);
ALTER TABLE ft_impontualidade
ADD CONSTRAINT ft_imp_dm_cli_fk FOREIGN KEY (id_cliente) REFERENCES dm_clientes (id_cliente);
ALTER TABLE ft_impontualidade
ADD CONSTRAINT ft_imp_dm_tem_fk FOREIGN KEY (id_tempo) REFERENCES dm_tempo (id_tempo);
ALTER TABLE ft_vendas
ADD CONSTRAINT ft_vendas_dm_fornecedores_fk FOREIGN KEY (id_forn) REFERENCES dm_fornecedores (id_forn);
ALTER TABLE ft_vendas
ADD CONSTRAINT ft_vendas_dm_produtos_fk FOREIGN KEY (id_prod) REFERENCES dm_produtos (id_prod);
ALTER TABLE ft_vendas
ADD CONSTRAINT ft_vendas_dm_tempo_fk FOREIGN KEY (id_tempo) REFERENCES dm_tempo (id_tempo);
ALTER TABLE ft_vendas
ADD CONSTRAINT ft_vendas_dm_tipos_vendas_fk FOREIGN KEY (id_tipo_venda) REFERENCES dm_tipos_vendas (id_tipo_venda);
-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0