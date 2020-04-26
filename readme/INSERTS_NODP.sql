USE NODP_BD;
INSERT INTO categorias_postagens(descricao) VALUES('ensinando'),
('aprendendo'),('quero aprender'),('quero ensinar');
INSERT INTO metodos_ensino (descricao) VALUES('online'),
('presencial'),('online/presencial');
INSERT INTO tipos_avaliacoes (descricao) VALUES ('Professor'), ('Aluno'),
('Aula');
INSERT INTO tipos_notificacoes (descricao) VALUES ('Enviou mensagem'), ('Deu medalha na sua postagem'),
('Deu moeda na sua postagem'), ('Apoiou você'), ('Comentou na sua postagem');
SELECT * FROM metodos_ensino;