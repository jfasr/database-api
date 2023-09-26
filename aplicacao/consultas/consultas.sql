set search_path to lojinha;

-- 1. consulta simples
-- itens de raridade >= raro
-- o legal é que usa a ordem do tipo definido no banco
select * from item where raridade >= 'raro';

-- 2. like
-- todos usuarios cujo email primário termina com '@gmail.com'
select * from usuario where email_primario like '%@gmail.com';

-- 3. operadores de conjuntos
-- todos os items que cujos nomes começam com 'Janna' OU possuem 'Neve' e 'Tempo'
select * from item where nome like 'Janna%' union
 (select * from item where nome like '%Neve%' intersect
  select * from item where nome like '%Tempo%');

-- 4. um join
-- lista usuarios e seus carrinhos
select u.nome, c.id_carrinho from usuario u join
    carrinho c on (u.email_primario = c.email_usuario);

-- 5. mais de um join
-- lista as skins de todos campeoes
select ic.nome, isk.nome from skin s
    join item isk on (s.id_item = isk.id_item)
    join campeao c on (s.id_campeao = c.id_item)
    join item ic on (c.id_item = ic.id_item);

-- 6. agregacao
-- média dos preços finais de todos os items, exceto Black Alistar
select avg(preco_final) from item where not nome = 'Black Alistar';

-- 7. group by
-- soma dos preços finais de cada item efetivamente comprado num carrinho
select ic.id_carrinho, sum(i.preco_final) from item_carrinho ic join
    item i on (ic.id_item = i.id_item)
    where status = 'comprado'
group by ic.id_carrinho;

-- 8. group by com having
-- id dos carrinhos cujo preços finais estão >= média
select ic.id_carrinho, sum(i.preco_final) as soma
    from item_carrinho ic
    join item i on (ic.id_item = i.id_item)
group by ic.id_carrinho
having sum(i.preco_final) >= (select avg(preco_final) from item where not nome = 'Black Alistar');

-- 9. in
-- seleciona os cromas de um jeito... diferente
-- todo: deve ter uma query mais interessante que isso
select * from item where id_item in (select id_item from croma);

-- 10. exists 
-- seleciona os itens que apareceram em algum carrinho
select i.nome from item i where exists (
    select 1 from item_carrinho ic
    where ic.id_item = i.id_item);

-- 11. some/any
-- implementa in com any: nome dos usuarios que não criaram nenhum carrinho
select u.nome from usuario u where not
    u.email_primario = any (select email_usuario from carrinho);

-- 12. all
-- outro jeito de implementar max: pega os itens de maior preco final
select i.nome from item i where
    i.preco_final >= all (select preco_final from item);

-- 13. consulta aninhada no from
-- retorna os emails secundarios dos compradores
with compradores as (
    select u.email_primario from usuario u join
    carrinho c on (u.email_primario = c.email_usuario)
)

select * from email_secundario_usuario join
    compradores using (email_primario);
