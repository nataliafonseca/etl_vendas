# Importações
import sqlalchemy
import pandas as pd

# bugs da oracle
import cx_Oracle
import os

pathname = os.path.join(os.getcwd(), "assets", "instantclient_21_3")

try:
    cx_Oracle.init_oracle_client(lib_dir=pathname)
except:
    pass

# Criação da engine do sql alchemy para a tabela
db_connection = sqlalchemy.create_engine(
    "oracle+cx_oracle://system:123456@localhost:1521/?encoding=UTF-8&nencoding=UTF-8"
)

# Extração da tabela produtos para dataframe do pandas
produtos_df = pd.read_sql("SELECT * FROM operacional.produtos", db_connection)

# Extração da tabela fornecedores para dataframe do pandas
fornecedores_df = pd.read_sql("SELECT * FROM operacional.fornecedores", db_connection)

# Extração da tabela notas_fiscais para dataframe do pandas
notas_fiscais_df = pd.read_sql("SELECT * FROM operacional.notas_fiscais", db_connection)

# Extração da tabela itens_de_nota para dataframe do pandas
itens_de_nota_df = pd.read_sql("SELECT * FROM operacional.itens_de_nota", db_connection)

# Extração da tabela pedidos para dataframe do pandas
pedidos_df = pd.read_sql("SELECT * FROM operacional.pedidos", db_connection)

# Extração da tabela itens_de_pedido para dataframe do pandas
itens_de_pedido_df = pd.read_sql(
    "SELECT * FROM operacional.itens_de_pedido", db_connection
)

# Extração da tabela clientes para dataframe do pandas
clientes_df = pd.read_sql("SELECT * FROM operacional.clientes", db_connection)

# Extração da tabela produtos para dataframe do pandas
produtos_df = pd.read_sql("SELECT * FROM operacional.produtos", db_connection)

# Extração da tabela parcelas para dataframe do pandas
parcelas_df = pd.read_sql("SELECT * FROM operacional.parcelas", db_connection)


dm_produtos_df = produtos_df.rename(columns={"cod_prod": "id_prod"}, inplace=False)


def get_classe(precos):
    lista = []
    for preco in precos:
        if preco <= 200:
            lista.append("Linha Popular")
        elif preco <= 1000:
            lista.append("Linha Média")
        else:
            lista.append("Alta Linha")
    return lista


dm_produtos_df["classe_prod"] = get_classe(dm_produtos_df["preco_pro"])
dm_produtos_df.drop(
    columns=["qtd_estoque", "per_parc", "preco_pro", "cod_forn"], inplace=True
)

dm_fornecedores_df = fornecedores_df.rename(
    columns={"cod_forn": "id_forn"}, inplace=False
)


def get_regiao(ufs):
    lista = []
    for uf in ufs:
        if uf in ["DF", "GO", "MT", "MS"]:
            lista.append("Centro-Oeste")
        elif uf in ["AL", "BA", "CE", "MA", "PB", "PE", "PI", "RN", "SE"]:
            lista.append("Nordeste")
        elif uf in ["AC", "AP", "AM", "PA", "RO", "RR", "TO"]:
            lista.append("Norte")
        elif uf in ["ES", "MG", "RJ", "SP"]:
            lista.append("Sudeste")
        else:
            lista.append("Sul")
    return lista


dm_fornecedores_df["regiao_forn"] = get_regiao(dm_fornecedores_df["uf_forn"])
dm_fornecedores_df.drop(
    columns=[
        "uf_forn",
        "sld_credor",
    ],
    inplace=True,
)

dm_tipos_venda_df = pd.DataFrame(
    {
        "id_tipo_venda": [1, 2],
        "desc_tipo_venda": ["a vista", "a prazo"],
    }
)

dm_tempo_df = pd.DataFrame()

dm_tempo_df["data"] = pedidos_df["dat_ped"]
dm_tempo_df["id_tempo"] = (dm_tempo_df["data"].astype(str).str.replace("-", "")).astype(
    int
)
dm_tempo_df.drop_duplicates(inplace=True)


dm_tempo_df["nu_ano"] = pd.DatetimeIndex(dm_tempo_df["data"]).year
dm_tempo_df["nu_mes"] = pd.DatetimeIndex(dm_tempo_df["data"]).month
dm_tempo_df["nu_dia"] = pd.DatetimeIndex(dm_tempo_df["data"]).day

dm_tempo_df["nu_anomes"] = (
    dm_tempo_df["nu_ano"].astype(str) + dm_tempo_df["nu_mes"].astype(str).str.zfill(2)
).astype(int)

dm_tempo_df["nm_mes"] = dm_tempo_df["nu_mes"]
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(1, "janeiro")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(2, "fevereiro")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(3, "março")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(4, "abril")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(5, "maio")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(6, "junho")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(7, "julho")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(8, "agosto")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(9, "setembro")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(10, "outubro")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(11, "novembro")
dm_tempo_df["nm_mes"] = dm_tempo_df["nm_mes"].replace(12, "dezembro")

dm_tempo_df["sg_mes"] = dm_tempo_df["nm_mes"].astype(str).str[0:3]

dm_tempo_df["nm_mesano"] = (
    dm_tempo_df["sg_mes"] + "/" + dm_tempo_df["nu_ano"].astype(str)
)

dm_tempo_df.drop(columns=["data"], inplace=True)

dm_clientes_df = clientes_df.rename(
    columns={"cod_cli": "id_cliente", "nom_cli": "nome_cliente"}, inplace=False
)
dm_clientes_df.drop(columns=["lim_credito", "sld_devedor", "fones"], inplace=True)

ft_vendas_df = pd.merge(
    left=itens_de_pedido_df, right=pedidos_df, how="left", on="num_ped"
)
ft_vendas_df = pd.merge(left=ft_vendas_df, right=produtos_df, how="left", on="cod_prod")
ft_vendas_df.rename(
    columns={
        "cod_prod": "id_prod",
        "cod_forn": "id_forn",
        "preco_pro_x": "valor_venda",
        "per_parc": "id_tipo_venda",
    },
    inplace=True,
)
ft_vendas_df["id_tipo_venda"] = ft_vendas_df["id_tipo_venda"].replace("F", 1)
ft_vendas_df["id_tipo_venda"] = ft_vendas_df["id_tipo_venda"].replace("V", 2)
ft_vendas_df["id_tempo"] = (
    ft_vendas_df["dat_ped"].astype(str).str.replace("-", "")
).astype(int)
ft_vendas_df.drop(
    columns=[
        "num_ped",
        "qtd_ped",
        "cod_cli",
        "dat_ped",
        "sta_pedido",
        "val_ped",
        "val_a_vista",
        "val_a_prazo",
        "sld_devedor",
        "qtd_estoque",
        "preco_pro_y",
        "dsc_prod",
    ],
    inplace=True,
)

ft_impontualidade_df = pd.merge(
    left=pedidos_df, right=clientes_df, how="left", on="cod_cli"
)
ft_impontualidade_df = pd.merge(
    left=ft_impontualidade_df, right=parcelas_df, how="left", on="num_ped"
)

ft_impontualidade_df.rename(
    columns={
        "cod_cli": "id_cliente",
        "sld_devedor_x": "valor_parc_atrasadas",
        "val_a_prazo": "valor_parc_total",
    },
    inplace=True,
)
ft_impontualidade_df["id_tempo"] = (
    ft_impontualidade_df["dat_ped"].astype(str).str.replace("-", "")
).astype(int)
ft_impontualidade_df.drop(
    columns=[
        "num_ped",
        "dat_ped",
        "sta_pedido",
        "val_ped",
        "val_a_vista",
        "lim_credito",
        "sld_devedor_y",
        "nom_cli",
        "fones",
        "parc_paga",
        "dat_venc",
        "val_parc",
    ],
    inplace=True,
)
ft_impontualidade_df.drop_duplicates(inplace=True)

# Função para calculo do chunksize
def get_chunksize(table_columns):
    cs = 2097 // len(table_columns)
    cs = 1000 if cs > 1000 else cs
    return cs


# Exportação do dataframe dm_produtos_df do pandas para a tabela dm_produtos
dm_produtos_df.to_sql(
    name="dm_produtos",
    schema="dimensional",
    con=db_connection,
    index=False,
    if_exists="append",
    chunksize=get_chunksize(dm_produtos_df.columns),
)

# Exportação do dataframe dm_clientes_df do pandas para a tabela dm_clientes
dm_clientes_df.to_sql(
    name="dm_clientes",
    schema="dimensional",
    con=db_connection,
    index=False,
    if_exists="append",
    chunksize=get_chunksize(dm_clientes_df.columns),
)

# Exportação do dataframe dm_fornecedores_df do pandas para a tabela dm_fornecedores
dm_fornecedores_df.to_sql(
    name="dm_fornecedores",
    schema="dimensional",
    con=db_connection,
    index=False,
    if_exists="append",
    chunksize=get_chunksize(dm_fornecedores_df.columns),
)

# Exportação do dataframe dm_tipos_venda_df do pandas para a tabela dm_tipos_venda
dm_tipos_venda_df.to_sql(
    name="dm_tipos_vendas",
    schema="dimensional",
    con=db_connection,
    index=False,
    if_exists="append",
    chunksize=get_chunksize(dm_tipos_venda_df.columns),
)

# Exportação do dataframe dm_tempo_df do pandas para a tabela dm_tempo
dm_tempo_df.to_sql(
    name="dm_tempo",
    schema="dimensional",
    con=db_connection,
    index=False,
    if_exists="append",
    chunksize=get_chunksize(dm_tempo_df.columns),
)

# Exportação do dataframe ft_vendas_df do pandas para a tabela ft_vendas
ft_vendas_df.to_sql(
    name="ft_vendas",
    schema="dimensional",
    con=db_connection,
    index=False,
    if_exists="append",
    chunksize=get_chunksize(ft_vendas_df.columns),
)

# Exportação do dataframe ft_impontualidade_df do pandas para a tabela ft_impontualidade
ft_impontualidade_df.to_sql(
    name="ft_impontualidade",
    schema="dimensional",
    con=db_connection,
    index=False,
    if_exists="append",
    chunksize=get_chunksize(ft_impontualidade_df.columns),
)
