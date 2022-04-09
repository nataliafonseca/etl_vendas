/**********************************************************************************/
/**********************************************************************************/
prompt Removendo todas as tabelas
drop table CLIENTES cascade constraints;
drop table FORNECEDORES cascade constraints;
drop table ITENS_DE_NOTA cascade constraints;
drop table ITENS_DE_PEDIDO cascade constraints;
drop table NOTAS_FISCAIS cascade constraints;
drop table PARCELAS cascade constraints;
drop table PEDIDOS cascade constraints;
drop table PRODUTOS cascade constraints;
/**********************************************************************************/
prompt Tabela de Fornecedores
create table fornecedores(
     cod_forn    number(3)     not null  check( cod_forn > 0 ),
     uf_forn     char(2)       not null  check( uf_forn in( 'PR','SC','RS','SP','RJ','MG','ES',
                                                           'MT','MS','GO','DF','BA','SE','AL',
                                                           'PE','RN','PB','CE','MA','PI','PA',
                                                           'TO','AM','AC','RR','RO' ) ),
     sld_credor  number(10,2)  not null check( sld_credor >= 0 ),
     nom_forn    varchar2(40)  not null,
     constraint for_pk primary key( cod_forn ) );
create index for_idx_nom_forn on fornecedores( nom_forn );
/**********************************************************************************/
prompt Tabela de Produtos
create table produtos(
     cod_prod     number(5)     not null  check( cod_prod > 0 ),
     qtd_estoque  number(4)     not null  check( qtd_estoque >= 0 ),
     per_parc     char(1)       not null  check( per_parc in( 'F', 'V' ) ),
     preco_pro    number(6,2)   not null  check( preco_pro > 0 ),
     cod_forn     number(3)     not null  check( cod_forn > 0 ),
     dsc_prod     varchar2(40)  not null,
     constraint pro_pk primary key( cod_prod ),
     constraint pro_fk_for foreign key( cod_forn ) references fornecedores( cod_forn ) );
create index pro_idx_dsc_prod on produtos( dsc_prod );
/**********************************************************************************/
prompt Tabela de Clientes
create table clientes(
     cod_cli      number(5)     not null  check( cod_cli > 0 ),
     lim_credito  number(9,2)   not null  check( lim_credito >= 0 ),
     sld_devedor  number(9,2)   not null  check( sld_devedor >= 0 ),
     nom_cli      varchar2(40)  not null,
     fones        varchar2(30),
     constraint cli_pk primary key( cod_cli ) );
create index cli_idx_nom_cli on clientes( nom_cli );
/**********************************************************************************/
prompt Tabela de Notas Fiscais
create table notas_fiscais(
     num_nota      number(5)     not null  check( num_nota > 0 ),
     cod_forn      number(3)     not null  check( cod_forn > 0 ),
     val_nota      number(9,2)   not null  check( val_nota >= 0 ),
     per_icms      number(4,1)   not null  check( per_icms between 0 and 100 ),
     per_ipi       number(4,1)   not null  check( per_ipi between 0 and 100 ),
     per_frete     number(4,1)   not null  check( per_frete between 0 and 100 ),
     val_total     number(10,2)  not null  check( val_total >= 0 ),
     dat_nota      date          not null,
     dat_venc      date          not null,
     sta_nota      char(1)       not null  check( sta_nota in( 'L', 'N', 'P' ) ),
     constraint not_pk primary key( num_nota ),
     constraint not_fk_for foreign key( cod_forn ) references fornecedores( cod_forn ),  
     constraint not_ck_valores check( val_total >= val_nota ),
     constraint not_ck_datas check( dat_nota < dat_venc ) ); 
create index not_idx_cod_forn on notas_fiscais( cod_forn );
/**********************************************************************************/
prompt Tabela de Itens de Nota
create table itens_de_nota(
     num_nota      number(5)     not null  check( num_nota > 0 ),
     cod_prod      number(5)     not null  check( cod_prod > 0 ),
     qtd_ped       number(4)     not null  check( qtd_ped > 0 ),
     preco_pro     number(6,2)   not null  check( preco_pro > 0 ),
     constraint itn_pk primary key( num_nota, cod_prod ),
     constraint itn_fk_not foreign key( num_nota ) references notas_fiscais( num_nota ),  
     constraint itn_fk_pro foreign key( cod_prod ) references produtos( cod_prod ) ); 
create index itn_idx_num_nota on itens_de_nota( num_nota );
create index itn_idx_cod_prod on itens_de_nota( cod_prod );
/**********************************************************************************/
prompt Tabela de Pedidos
create table pedidos(
     num_ped       number(5)     not null  check( num_ped > 0 ),
     cod_cli       number(5)     not null  check( cod_cli > 0 ),
     dat_ped       date          not null,
     sta_pedido    char(1)       not null  check( sta_pedido in( 'A', 'C', 'F', 'T' ) ),
     val_ped       number(9,2)   not null  check( val_ped >= 0 ),
     val_a_vista   number(9,2)   not null  check( val_a_vista >= 0 ),
     val_a_prazo   number(9,2)   not null  check( val_a_prazo >= 0 ),
     sld_devedor   number(9,2)   not null  check( sld_devedor >= 0 ),
     constraint ped_pk primary key( num_ped ),
     constraint ped_fk_cli foreign key( cod_cli ) references clientes( cod_cli ),  
     constraint ped_ck_valoressaldo check( val_ped >= val_a_vista + sld_devedor ),
     constraint ped_ck_valoresparc check( val_ped >= val_a_vista + val_a_prazo ) ); 
create index ped_idx_cod_cli on pedidos( cod_cli );
/**********************************************************************************/
prompt Tabela de Itens de Pedido
create table itens_de_pedido(
     num_ped       number(5)     not null  check( num_ped > 0 ),
     cod_prod      number(5)     not null  check( cod_prod > 0 ),
     qtd_ped       number(4)     not null  check( qtd_ped > 0 ),
     preco_pro     number(6,2)   not null  check( preco_pro > 0 ),
     constraint itp_pk primary key( num_ped, cod_prod ),
     constraint itp_fk_ped foreign key( num_ped ) references pedidos( num_ped ),  
     constraint itp_fk_pro foreign key( cod_prod ) references produtos( cod_prod ) ); 
create index itp_idx_num_ped on itens_de_pedido( num_ped );
create index itp_idx_cod_prod on itens_de_pedido( cod_prod );
/**********************************************************************************/
prompt Tabela de Parcelas
create table parcelas(
     num_ped       number(5)     not null  check( num_ped > 0 ),
     dat_venc      date          not null,
     val_parc      number(8,2)   not null  check( val_parc > 0 ),
     parc_paga     char(1)       not null check( parc_paga in( 'V', 'F' ) ),
     constraint par_pk primary key( num_ped, dat_venc ),
     constraint par_fk_ped foreign key( num_ped ) references pedidos( num_ped ) ); 
create index par_idx_num_ped on parcelas( num_ped );
