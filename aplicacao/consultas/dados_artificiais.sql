SET search_path TO lojinha;

DELETE from lojinha.usuario;
DELETE from lojinha.campeao;
DELETE from lojinha.carrinho;
DELETE from lojinha.item;

INSERT INTO lojinha.usuario (email_primario, nome, riot_points)
VALUES 
    ('joaophillipe2003@hotmail.com','xXJoaozinhoXx','390'),
    ('pedrov@gmail.com', 'bike do arrascaeta','390'),
    ('bianunes_lindah@yahoo.com','JANnasci assim','2250'),
    ('tylerdrumf220@hotmail.com','theKatanaMaster','390'),
    ('patricia3201@hotmail.com','Paty Swift','7'),
    ('ana_prado_2002@gmail.com','shyGirl','12'),
    ('guiga22052003@gmail.com','a kiyara','221'),
    ('brunomatoso87@hotmail.com','krakenSlayer','675'),
    ('belinhacampos123@gmail.com','lóvely','1200'),
    ('gusta_santos1000@gmail.com','gustalkns','390'),
    ('thiagomascarenhas1@hotmail.com','vayne fogosa','103'),
    ('brenovitor888@gmail.com','BV dinasty','0'),
    ('jamesclyde32@hotmail.com','i have no enemie','390'),
    ('tinowns_loud@gmail.com','tinowns01','38200'),
    ('panemtone@gmail.com','Panemtone','1002');
    

INSERT INTO lojinha.email_secundario_usuario
VALUES 
    ('pedro.vini@academico.ufpr.br','pedrov@gmail.com'),
    ('joaofilipe2003@gmail.com','joaophillipe2003@hotmail.com'),
    ('thiago1997@hotmail.com','tinowns_loud@gmail.com'),
    ('beatriznunes00@gmail.com','bianunes_lindah@yahoo.com');


INSERT INTO lojinha.carrinho
VALUES 
    ('0000001221','joaophillipe2003@hotmail.com'),
    ('0000027856','pedrov@gmail.com'),
    ('0012145841', 'bianunes_lindah@yahoo.com'),
    ('0174748562', 'bianunes_lindah@yahoo.com'),
    ('012524780', 'bianunes_lindah@yahoo.com'),
    ('000145721','ana_prado_2002@gmail.com'),
    ('000879142','ana_prado_2002@gmail.com'),
    ('000125476', 'ana_prado_2002@gmail.com'),
    ('054124786', 'panemtone@gmail.com'),
    ('000001111', 'thiagomascarenhas1@hotmail.com'),
    ('000020012', 'brenovitor888@gmail.com'),
    ('000154756', 'guiga22052003@gmail.com'),
    ('033624412', 'pedrov@gmail.com'),
    ('041250010', 'pedrov@gmail.com');
    
    
	
INSERT INTO lojinha.item (id_item, nome, tipo, data_lancamento, raridade, preco_rp)
VALUES
    ('001','Garen','campeão','2009-02-11','comum','270'),
    ('002','Ashe','campeão','2009-02-11','comum','270'),
    ('003','Morgana','campeão','2009-02-11','incomum','290'),
    ('004','Warwick','campeão','2009-02-11','comum','270'),
    ('005','Amumu','campeão','2009-02-11','raro','350'),
    ('006','Alistar','campeão','2009-03-09','comum','270'),
    ('007','Sivir','campeão','2009-03-09','comum','270'),
    ('008','Blitzcrank','campeão','2009-03-09','comum','270'),
    ('120','Hades','campeão','2022-10-22','raro','350'),
    ('121','Tyron','campeão','2022-11-22','épico','420'),
    ('122','Apollo','campeão','2022-12-22','comum','270'),
    ('123','Neith','campeão','2023-01-22','lendário','500'),
    ('124','Janna','campeão','2023-02-22','incomum','290');
    

INSERT INTO lojinha.item
VALUES
    ('010', 'General Garen','skin','2009-02-11','comum','675','1.0'),
    ('011','Ashe Caçadora','skin','2009-02-11','comum','675','0.8'),
    ('012','Morgana Ascendida','skin','2009-02-11','comum','675','1.0'),
    ('013','Black Alistar','skin','2009-02-11','lendário', '999999','1.0'),
    ('014','Young Hades','skin','2022-10-22','incomum','780','1.0'),
    ('015','Janna Reporter','skin','2023-10-22','raro','1362','0.5'),
    ('016','Sentinela Dragão','skin sentinela','2023-09-25','comum','225','1.0'),
    ('017','Sentinela KDA','skin sentinela','2023-08-25','comum','225','0.9'),
    ('018','Sentinela Legado','skin sentinela','2010-05-08','lendário','654','1.0'),
    ('019','Ícone Juntinhos','ícone','2022-05-10','comum','310','1.0'),
    ('020','Ícone PRIDE','ícone','2020-06-01','comum','310','0.5'),
    ('021','Ícone Vastaya','ícone','2021-09-24','comum','310','1.0'),
    ('022','Emote Sério Isso?','emote','2021-09-24','comum','195','1.0'),
    ('023','Emote GG','emote','2023-05-16','comum','195','0.8'),
    ('024','Croma Rubi','croma','2023-09-29','incomum','300','1.0'),
    ('025','Croma Prateado','croma','2022-01-05','raro','300','1.0'),
    ('026','Croma Esmeralda', 'croma','2025-01-08','comum','300','1.0'),
    ('027','Amumu Caçador','skin','2009-02-11','comum','675','1.0'),
    ('028','Apollo Reporter','skin','2023-10-22','comum','675','0.5'),
    ('029','Não é o Blitzcrank','skin','2014-02-11','raro','1362','1.0'),
    ('030','Não é a Ashe','skin','2014-02-11','incomum','780','1.0'),
    ('031','Rainha Morgana','skin','2018-04-27','épico','2410','0.7'),
    ('032','General Hades','skin','2023-07-31','raro','1362','0.4'),
    ('033','Croma Dourado','croma','2022-01-05','raro','300','1.0'),
    ('034','Croma Diamante','croma','2022-01-05','épico','400','1.0');


INSERT INTO lojinha.classe_campeao
VALUES 
    ('lutador'),
    ('tanque'),
    ('mago'),
    ('assassino'),
    ('atirador'),
    ('encantador');
    
    
  INSERT INTO lojinha.campeao
  VALUES
    ('001','lutador','fácil','tanque'),
    ('002','atirador','fácil',NULL),
    ('003','mago','médio','encantador'),
    ('004','lutador','fácil','tanque'),
    ('005','tanque','fácil', 'mago'),
    ('006','tanque','médio',NULL),
    ('007','atirador','fácil',NULL),
    ('008','tanque','fácil','mago'),
    ('120','mago','difícil','assassino'),
    ('121','lutador','médio','tanque'),
    ('122','atirador','médio',NULL),
    ('123','assassino','difícil','assassino'),
    ('124','encantador','difícil','mago');
    
    
  INSERT INTO lojinha.linha_skin
  VALUES
    ('Comando'),
    ('Hunter'),
    ('Previsão do Tempo'),
    ('Esconde-Esconde');
    

  INSERT INTO lojinha.skin
  VALUES
    ('010','001','Comando'),
    ('011','002','Hunter'),
    ('012','003', NULL),
    ('013','006', NULL),
    ('014','120',NULL),
    ('015','124','Previsão do Tempo'),
    ('027','005','Hunter'),
    ('028','122','Previsão do Tempo'),
    ('029','008','Esconde-Esconde'),
    ('030','002','Esconde-Esconde'),
    ('031','003',NULL),
    ('032','120','Comando');
    
    
  INSERT INTO lojinha.croma
  VALUES 
    ('024','010'),
    ('025','031'),
    ('026','032'),
    ('033','031'),
    ('034','031');
    
    
  INSERT INTO lojinha.item_carrinho
  VALUES
    ('comprado','0012145841','006','2023-01-02'),
    ('comprado','0012145841','003','2023-01-02'),
    ('comprado','0012145841','008','2023-01-02'),
    ('comprado','0012145841','124','2023-01-02'),
    ('comprado','0012145841','015','2023-01-02'),
    ('reembolsado','0012145841','016','2023-01-02'),
    ('comprado','0012145841','017','2023-01-02'),
    ('comprado','0000001221','034','2023-09-27'),
    ('comprado','0000001221','033','2023-09-27'),
    ('cancelado','0000001221','028','2023-09-27'),
    ('a reembolsar','0000001221','032','2023-09-27'),
    ('comprado','0000001221','024','2023-09-27'),
    ('comprado','0000027856','019','2021-10-31'),
    ('comprado','0000027856','020','2021-11-01'),
    ('comprado','0000027856','021','2021-11-01'),
    ('comprado','000145721','123','2023-12-10'),
    ('a reembolsar','000879142','123','2023-12-10'),
    ('reembolsado','000125476','123','2023-12-10'),
    ('comprado','000125476','124','2023-12-10'),
    ('comprado','000145721', '015', '2023-12-12'),
    ('comprado', '000145721', '020','2023-12-12'),
    ('comprado', '54124786' ,'121', '2020-06-08'),
    ('cancelado', '41250010', '019', '2023-09-25');
    

SELECT * from lojinha.usuario;
SELECT * from lojinha.campeao;
SELECT * from lojinha.carrinho;
SELECT * from lojinha.item;
