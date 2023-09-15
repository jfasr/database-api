set search_path to lojinha;

-- 1. consulta simples

select * from usuario where nome = 'Pedro';

-- 2. LIKE

select * from usuario where email_primario like '%@gmail.com';

-- 3. operadores de conjuntos

select * from item where nome like 'Janna%' union
 (select * from item where nome like '%Neve%' intersect
  select * from item where nome like '%Tempo%');

-- 4. um join

select u.nome, c.id from usuario u join
    carrinho c on (u.email_primario = c.usuario_email_primario);

-- 5. mais de um join

select ic.nome, is.nome from skin s
    join is item on (s.id_skin = is.id_item)
    join campeao c on (s.id_campeao = c.id_campeao)
    join ic item on (c.id_campeao = ic.id_item);

-- 6. agregacao

select avg(preco_final) from item;

-- 7. group by

select sum(i.preco_final) from item_carrinho ic join
    item i on (ic.id_item = i.id_item)
group by ic.id_carrinho;

-- 8. 
