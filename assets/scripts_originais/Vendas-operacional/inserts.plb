/**********************************************************************************/
/**********************************************************************************/
prompt Inserção na tabela de fornecedores
insert into fornecedores( cod_forn, uf_forn, sld_credor, nom_forn ) values( 1, 'SE', 0, 'SS Distribuidora de Equipamentos' );
insert into fornecedores( cod_forn, uf_forn, sld_credor, nom_forn ) values( 2, 'BA', 0, 'Salvador Equipamentos de Informática' );
insert into fornecedores( cod_forn, uf_forn, sld_credor, nom_forn ) values( 3, 'SE', 0, 'Casa dos Computadores' );
insert into fornecedores( cod_forn, uf_forn, sld_credor, nom_forn ) values( 4, 'AL', 0, 'Total Computadores' );
insert into fornecedores( cod_forn, uf_forn, sld_credor, nom_forn ) values( 5, 'PE', 0, 'PE Distribuidora de Computadores' );
commit;
/**********************************************************************************/
prompt Inserção na Tabela de Produtos
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 1, 0, 'F', 350, 1, 'Placa Mãe Soyo' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 2, 0, 'V', 250, 2, 'Placa Mãe Asus' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 3, 0, 'V', 150, 3, 'Placa Mãe PC Chips' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 4, 0, 'F', 200, 4, 'Placa Mãe MSI' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 5, 0, 'F', 180, 1, 'Placa de Vídeo Trident' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 6, 0, 'V', 120, 2, 'Placa de Vídeo MSI' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 7, 0, 'F', 120, 3, 'Placa de Vídeo Mercury' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 8, 0, 'V', 110, 4, 'Placa de Vídeo NVidea' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 9, 0, 'F', 115, 5, 'Placa de Vídeo PINE' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 11, 0, 'V', 450, 1, 'Monitor Sansung' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 12, 0, 'V', 570, 2, 'Monitor Philips' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 13, 0, 'V', 450, 3, 'Monitor Compac' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 14, 0, 'F', 300, 5, 'Monitor LG' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 15, 0, 'V', 120, 1, 'Memória 128Mb' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 16, 0, 'F', 200, 2, 'Memória 256Mb' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 17, 0, 'V', 140, 4, 'Memória 512Mb' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 18, 0, 'F', 210, 5, 'Memória 64Mb' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 19, 0, 'V', 450, 1, 'Impressora HP Deskjet' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 20, 0, 'F', 570, 3, 'Impressora HP Laserjet' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 21, 0, 'V', 250, 4, 'Impressora Epson' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 22, 0, 'F', 300, 5, 'Impressora Canon' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 23, 0, 'F', 450, 1, 'HD Sansung' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 24, 0, 'V', 570, 2, 'HD Maxtor' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 25, 0, 'F', 450, 3, 'HD Seagate' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 26, 0, 'F', 300, 5, 'HD Fugitsu' );
insert into produtos ( cod_prod, qtd_estoque, per_parc, preco_pro, cod_forn, dsc_prod ) values ( 27, 0, 'F', 40, 5, 'Cooler' );
commit;
/**********************************************************************************/
prompt Inserção na Tabela de Clientes
insert into clientes( cod_cli, lim_credito, sld_devedor, nom_cli, fones ) values ( 1, 8000, 0, 'Casa Santo Antônio', '222-3434/222-8578' );
insert into clientes( cod_cli, lim_credito, sld_devedor, nom_cli, fones ) values ( 2, 9500, 0, 'Fiat Veículos', '211-3434/211-7878' );
insert into clientes( cod_cli, lim_credito, sld_devedor, nom_cli, fones ) values ( 3, 5000, 0, 'Restaurante Tudo Bom', '242-3439' );
insert into clientes( cod_cli, lim_credito, sld_devedor, nom_cli, fones ) values ( 4, 5500, 0, 'Construtora Tudo Faz', '243-6766/214-5454' );
insert into clientes( cod_cli, lim_credito, sld_devedor, nom_cli, fones ) values ( 5, 9500, 0, 'Clínica SOS', '254-2565' );
insert into clientes( cod_cli, lim_credito, sld_devedor, nom_cli, fones ) values ( 6, 4500, 0, 'Lojas Sergipe', '222-8888' );
commit;
/**********************************************************************************/
prompt Inserção na Tabela de Notas_Fiscais e itens_de_nota
declare
  type t_prod is table of number index by binary_integer;
  prod    t_prod;
  tNot    number(10,2);
  nIte    number(2);   
  v_num   number(4);
  v_dia   number(2);
  v_mes   number(2);
  v_ano   number(4);
  v_val   number(10,2);
  v_qtd   number(2);
  N       binary_integer;
  K       binary_integer;
  v_dat   date;
  
begin
  v_num := 0;
  v_dia := 1;
  v_mes := 1;
  v_ano := to_char( sysdate, 'YYYY' ) - 1;
  nIte  := 0;
  for I in ( select cod_forn 
                from fornecedores ) loop
    
    prod.delete;
    for P in( select cod_prod
                  from produtos
                  where cod_forn = I.cod_forn ) loop
      prod( prod.count + 1 ) := P.cod_prod;
    end loop;
    
    for N in 1 .. 21 loop
      v_num := v_num + 1;
      tNot  := 0;
      v_dat := to_date( lpad( v_dia, 2, '0' )||'/'||lpad( v_mes, 2, '0' )||'/'||v_ano, 'DD/MM/YYYY' );
      insert into notas_fiscais 
         ( num_nota, cod_forn, val_nota, per_icms, per_ipi, per_frete, val_total, dat_nota, dat_venc, sta_nota )
      values
         ( v_num, I.cod_forn, 0, decode( mod( v_dia/v_mes, 2 ), 0, 10, 7 ), decode( mod( v_dia-v_mes, 2 ), 0, 3, 5 ),
           decode( mod( v_mes + v_dia, 2 ), 0, 8 , 12 ), 0, v_dat, v_dat + decode( mod( v_mes * v_dia, 2 ), 0, 15 , 30 ), 
           decode( to_char( mod( v_num + v_mes * v_dia, 2 ) ), '0', 'N', 'P' ) );
       
      nIte := nIte + 1;
      if nIte > prod.count then
        nIte := 2;
      end if;
      
      for K in 1 .. nIte loop
        select preco_pro into v_val
            from produtos
            where cod_prod = prod( K );
        if v_mes in( 1, 2, 3, 4 ) then
          v_val := v_val * ( 0.9 + ( v_mes/100 ) );
        end if;
        v_qtd := v_dia + prod( K ) + v_mes;
        if v_qtd > 10 then
          v_qtd := trunc( v_qtd / 10 ) + ( v_qtd mod 10 );
        end if;  
        v_qtd := v_qtd * 6;
        insert into itens_de_nota 
           ( num_nota, cod_prod, qtd_ped, preco_pro )
        values
          ( v_num, prod( K ), v_qtd, v_val );
        tNot := tNot + trunc( ( v_qtd * v_val ), 2 );
      end loop;
      
      update notas_fiscais
          set val_nota = tNot, val_total = trunc( tNot * ( 1 + ( ( per_icms + per_ipi + per_frete )/100 ) ), 2 )
          where num_nota = v_num;
      
      v_dia := v_dia + 3;
      if ( v_dia > 28 ) and ( v_mes = 2 ) then
        v_dia := v_dia - 28;
        v_mes := v_mes + 1;
      elsif v_dia > 30 then
        v_dia := v_dia - 30;
        v_mes := v_mes + 1;
      end if;
    end loop;
    commit;
  end loop;
end;
/
/**********************************************************************************/
prompt Tabela de Pedidos, Itens de Pedido e parcelas
declare
  type t_prod is table of number index by binary_integer;
  prod    t_prod;
  tIte    number(2);
  nIte    number(2);
  v_num   number(4);
  v_dia   number(2);
  v_mes   number(2);
  v_dat   date;
  v_val   number(10,2);
  v_qtd   number(2);
  v_par   char(1);
  v_tot   number(10,2);
  v_prz   number(10,2);
  v_ano   number(4);

begin

  
  v_ano := to_char( sysdate, 'YYYY' ) - 1;
  prod.delete;
  for P in( select cod_prod
                  from produtos ) loop
    prod( prod.count + 1 ) := P.cod_prod;
  end loop;

  
  tIte  := 2;
  nIte  := 0;
  v_num := 0;
  v_dia := 1;
  v_mes := 1;
  for I in ( select cod_cli 
                from clientes ) loop
    
    for N in 1 .. 21 loop
      
      v_num := v_num + 1;
      v_dat := to_date( lpad( v_dia, 2, '0' )||'/'||lpad( v_mes, 2, '0' )||'/'||v_ano, 'DD/MM/YYYY' );
      insert into pedidos 
         ( num_ped, cod_cli, dat_ped, sta_pedido, val_ped, val_a_vista, val_a_prazo, sld_devedor )
      values
         ( v_num, I.cod_cli, v_dat, 'F', 0, 0, 0, 0 );
      
      v_tot := 0;
      v_prz := 0;
      for k in 1 .. tIte loop
        nIte := nIte + 1;
        if nIte > prod.count then
          nIte := 1;
        end if;
        select preco_pro, per_parc into v_val, v_par
            from produtos
            where cod_prod = prod( nIte );
        if v_mes in( 1, 2, 3, 4 ) then
          v_val := v_val * ( 0.9 + ( v_mes/100 ) );
        end if;
        v_qtd := v_dia + prod( nIte ) + v_mes;
        if v_qtd > 10 then
          v_qtd := trunc( v_qtd / 10 ) + ( v_qtd mod 10 );
        end if;  
        insert into itens_de_pedido
            ( num_ped, cod_prod, qtd_ped, preco_pro )
        values
            ( v_num, prod( nIte ), v_qtd, v_val );
        
        v_tot := v_tot + trunc( v_qtd * v_val, 2 );
        if v_par = 'V' then
          v_prz := v_prz + trunc( v_qtd * v_val, 2 );
        end if;
        update pedidos
             set val_ped = v_tot, val_a_prazo = v_prz, val_a_vista = v_tot - v_prz
             where num_ped = v_num;
      end loop;
      if tIte = 5 then
        tIte := 2;
      else
        tIte := tIte + 1;
      end if;
      
      v_dia := v_dia + 2;
      if ( v_dia > 28 ) and ( v_mes = 2 ) then
        v_dia := v_dia - 28;
        v_mes := v_mes + 1;
      elsif v_dia > 30 then
        v_dia := v_dia - 30;
        v_mes := v_mes + 1;
      end if;
    end loop;
    commit;
  end loop;
end;
/
/**********************************************************************************/
prompt Atualiza o saldo devedor dos pedidos
declare
  tParc   number(2); 
  nQuit   number(2);
  v_sld   number(10,2);
  v_tot   number(10,2);
  v_sta   char(1);
  v_parc  number(10,2);
begin
  tParc := 1;
  for I in( select num_ped, dat_ped, val_a_prazo
                from pedidos
                where val_a_prazo > 0
                order by val_ped ) loop
    
    tParc := 12 - to_char( I.dat_ped, 'MM' );
    if tParc < 2 then 
      tParc := 2;
    end if;  
    
    if to_number( to_char( I.dat_ped, 'DD' ) ) = 1 then
      nQuit := tParc;
    elsif mod( to_number( to_char( I.dat_ped, 'DD' ) ) + to_number( to_char( I.dat_ped, 'MM' ) ), 2 ) = 0 then
      nQuit := trunc( tParc / 2 );
    else   
      nQuit := trunc( tParc / 3 );
    end if;  
    
    v_sld := 0;
    v_tot := 0;
    v_parc := trunc( I.val_a_prazo / tParc, 2 );
    for P in 1 .. tParc loop
      if P = tParc then
        v_parc := I.val_a_prazo - v_tot;
      else
        v_tot := v_tot + v_parc;  
      end if;
      if p <= nQuit then
        v_sta := 'V';
      else  
        v_sta := 'F';
        v_sld := v_sld + v_parc;
      end if;  
      insert into parcelas
          ( num_ped, dat_venc, val_parc, parc_paga )
      values
          ( I.num_ped, I.dat_ped + ( p * 30 ), v_parc, v_sta );
    end loop;
    update pedidos
       set sld_devedor = v_sld
       where num_ped = I.num_Ped;
    commit;
  end loop;
end;
/
/**********************************************************************************/
prompt Atualização os campos calculados das tabelas
declare
  v_lim  number(9,2);
begin
  
  for I in ( select c.cod_cli, sum( p.sld_devedor ) "SALDO"
                from clientes c join pedidos p on p.cod_cli = c.cod_cli
                group by c.cod_cli ) loop
    if I.cod_cli mod 2 = 0 then
      v_lim := trunc( I.saldo * 1.3, -3 );
    elsif I.cod_cli mod 3 = 0 then
      v_lim := trunc( I.saldo * 1.1, -3 );
    else
      v_lim := I.saldo;
    end if;
    update clientes
        set sld_devedor = I.saldo, lim_credito = v_lim
        where cod_cli = I.cod_cli;
  end loop;
  commit;
  
  for I in ( select f.cod_forn, sum( n.val_total ) "SALDO"
                from fornecedores f join notas_fiscais n on f.cod_forn = n.cod_forn
                where sta_nota = 'N'
                group by f.cod_forn ) loop
    update fornecedores
        set sld_credor = I.saldo
        where cod_forn = I.cod_forn;
  end loop;
  commit;
  
  for I in( select p.cod_prod, 
                   ( select sum( qtd_ped )
                         from itens_de_nota
                         where cod_prod = p.cod_prod ) -
                   ( select nvl( sum( qtd_ped ), 0 )
                         from itens_de_pedido
                         where cod_prod = p.cod_prod ) saldo
               from produtos p ) loop
    update produtos
        set qtd_estoque = I.saldo
        where cod_prod = I.cod_prod;
  end loop;
  commit;
end;
/
