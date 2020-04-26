-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA NODP_BD;
USE NODP_BD;
-- -----------------------------------------------------
-- Table `usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuarios` ;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(80) NOT NULL,
  `senha` VARCHAR(250) NOT NULL,
  `admin` TINYINT(1) NOT NULL DEFAULT 0,
  `ativo` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `estados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `estados` ;

CREATE TABLE IF NOT EXISTS `estados` (
  `cod_estados` INT NOT NULL AUTO_INCREMENT,
  `sigla` VARCHAR(2) NOT NULL,
  `nome` VARCHAR(72) NOT NULL,
  PRIMARY KEY (`cod_estados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cidades` ;

CREATE TABLE IF NOT EXISTS `cidades` (
  `cod_cidades` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(72) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `estado` INT NOT NULL,
  PRIMARY KEY (`cod_cidades`),
  INDEX `FK_cidades_1_idx` (`estado` ASC)  ,
  CONSTRAINT `FK_cidades_1`
    FOREIGN KEY (`estado`)
    REFERENCES `estados` (`cod_estados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cursos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cursos` ;

CREATE TABLE IF NOT EXISTS `cursos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `instituicoes_ensino`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instituicoes_ensino` ;

CREATE TABLE IF NOT EXISTS `instituicoes_ensino` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  `estado_id` INT NOT NULL,
  `sigla` VARCHAR(20) NOT NULL DEFAULT 'NI',
  PRIMARY KEY (`id`),
  INDEX `FK_instituicoes_ensino_1_idx` (`estado_id` ASC)  ,
  CONSTRAINT `FK_instituicoes_ensino_1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `estados` (`cod_estados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `metodos_ensino`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `metodos_ensino` ;

CREATE TABLE IF NOT EXISTS `metodos_ensino` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC)  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `perfis` ;

CREATE TABLE IF NOT EXISTS `perfis` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `nome` VARCHAR(80) NOT NULL DEFAULT 'Anônimo',
  `cidade_id` INT NOT NULL,
  `curso_id` INT NOT NULL,
  `bio` VARCHAR(250) NOT NULL DEFAULT 'Ao infinito e além',
  `celular` VARCHAR(20) NOT NULL DEFAULT '(00) 99999-9999',
  `metodo_ensino_id` INT NOT NULL,
  `quantidade_moedas` INT NOT NULL DEFAULT 0,
  `metodo_aprendizado_id` INT NOT NULL,
  `instituicao_ensino_id` INT NOT NULL,
  `capa` VARCHAR(250) NOT NULL DEFAULT 'NI',
  `avatar` VARCHAR(250) NOT NULL DEFAULT 'NI',
  `turma` INT NOT NULL DEFAULT 9999,
  PRIMARY KEY (`id`),
  INDEX `FK_perfis_1_idx` (`usuario_id` ASC)  ,
  INDEX `FK_perfis_2_idx` (`cidade_id` ASC)  ,
  INDEX `FK_perfis_3_idx` (`curso_id` ASC)  ,
  INDEX `FK_perfis_4_idx` (`instituicao_ensino_id` ASC)  ,
  INDEX `FK_perfis_5_idx` (`metodo_ensino_id` ASC)  ,
  INDEX `FK_perfis_6_idx` (`metodo_aprendizado_id` ASC)  ,
  CONSTRAINT `FK_perfis_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_perfis_2`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `cidades` (`cod_cidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_perfis_3`
    FOREIGN KEY (`curso_id`)
    REFERENCES `cursos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_perfis_4`
    FOREIGN KEY (`instituicao_ensino_id`)
    REFERENCES `instituicoes_ensino` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_perfis_5`
    FOREIGN KEY (`metodo_ensino_id`)
    REFERENCES `metodos_ensino` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_perfis_6`
    FOREIGN KEY (`metodo_aprendizado_id`)
    REFERENCES `metodos_ensino` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `interesses_ensino`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interesses_ensino` ;

CREATE TABLE IF NOT EXISTS `interesses_ensino` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `interesses_aprendizado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interesses_aprendizado` ;

CREATE TABLE IF NOT EXISTS `interesses_aprendizado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `categorias_postagens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `categorias_postagens` ;

CREATE TABLE IF NOT EXISTS `categorias_postagens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postagens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `postagens` ;

CREATE TABLE IF NOT EXISTS `postagens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `data_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quantidade_medalhas` INT NOT NULL DEFAULT 0,
  `quantidade_apoios` INT NOT NULL DEFAULT 0,
  `categoria_id` INT NOT NULL,
  `titulo` VARCHAR(30) NOT NULL DEFAULT 'NI',
  `descricao` VARCHAR(250) NOT NULL,
  `imagem` VARCHAR(200) NOT NULL DEFAULT 'NI',
  `urgente` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `FK_postagens_1_idx` (`usuario_id` ASC)  ,
  INDEX `FK_postagens_2_idx` (`categoria_id` ASC)  ,
  CONSTRAINT `FK_postagens_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_postagens_2`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `categorias_postagens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comentarios` ;

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(250) NOT NULL,
  `usuario_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_comentarios_idx` (`post_id` ASC)  ,
  INDEX `FK_comentarios_2_idx` (`usuario_id` ASC)  ,
  CONSTRAINT `FK_comentarios_1`
    FOREIGN KEY (`post_id`)
    REFERENCES `postagens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_comentarios_2`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apoiadores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `apoiadores` ;

CREATE TABLE IF NOT EXISTS `apoiadores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `apoiador_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_apoiadores_1_idx` (`usuario_id` ASC)  ,
  INDEX `FK_apoiadores_2_idx` (`apoiador_id` ASC)  ,
  CONSTRAINT `FK_apoiadores_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_apoiadores_2`
    FOREIGN KEY (`apoiador_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `apoiados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `apoiados` ;

CREATE TABLE IF NOT EXISTS `apoiados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `apoiador_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_apoiados_1_idx` (`usuario_id` ASC)  ,
  INDEX `FK_apoiados_2_idx` (`apoiador_id` ASC)  ,
  CONSTRAINT `FK_apoiados_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_apoiados_2`
    FOREIGN KEY (`apoiador_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mensagens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mensagens` ;

CREATE TABLE IF NOT EXISTS `mensagens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `destinatario_id` INT NOT NULL,
  `mensagem` TEXT NOT NULL,
  `data_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `FK_mensagens_1_idx` (`usuario_id` ASC)  ,
  INDEX `FK_mensagens_2_idx` (`destinatario_id` ASC)  ,
  CONSTRAINT `FK_mensagens_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_mensagens_2`
    FOREIGN KEY (`destinatario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aulas_ministradas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aulas_ministradas` ;

CREATE TABLE IF NOT EXISTS `aulas_ministradas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `aluno_id` INT NOT NULL,
  `titulo_aula` VARCHAR(250) NOT NULL,
  `descricao` VARCHAR(250) NOT NULL,
  `qnt_moedas` INT NOT NULL,
  `duracao_minutos` INT NOT NULL,
  `data_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `FK_aulas_ministradas_1_idx` (`aluno_id` ASC)  ,
  INDEX `FK_aulas_ministradas_2_idx` (`usuario_id` ASC)  ,
  CONSTRAINT `FK_aulas_ministradas_1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_aulas_ministradas_2`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tipos_avaliacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipos_avaliacoes` ;

CREATE TABLE IF NOT EXISTS `tipos_avaliacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `avaliacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `avaliacoes` ;

CREATE TABLE IF NOT EXISTS `avaliacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `aula_id` INT NOT NULL,
  `tipo_avaliacao` INT NOT NULL,
  `nota` INT NOT NULL DEFAULT 5,
  PRIMARY KEY (`id`),
  INDEX `FK_avaliacoes_1_idx` (`tipo_avaliacao` ASC)  ,
  INDEX `FK_avaliacoes_2_idx` (`aula_id` ASC)  ,
  CONSTRAINT `FK_avaliacoes_1`
    FOREIGN KEY (`tipo_avaliacao`)
    REFERENCES `tipos_avaliacoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_avaliacoes_2`
    FOREIGN KEY (`aula_id`)
    REFERENCES `aulas_ministradas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tipos_notificacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipos_notificacoes` ;

CREATE TABLE IF NOT EXISTS `tipos_notificacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `notificacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `notificacoes` ;

CREATE TABLE IF NOT EXISTS `notificacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(250) NOT NULL,
  `tipo_notificacao_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  `remetente_id` INT NOT NULL,
  `lida` TINYINT(1) NOT NULL DEFAULT 0,
  `data_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `FK_notificacoes_1_idx` (`tipo_notificacao_id` ASC)  ,
  INDEX `FK_notificacoes_2_idx` (`usuario_id` ASC)  ,
  INDEX `FK_notificacoes_3_idx` (`remetente_id` ASC)  ,
  CONSTRAINT `FK_notificacoes_1`
    FOREIGN KEY (`tipo_notificacao_id`)
    REFERENCES `tipos_notificacoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_notificacoes_2`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_notificacoes_3`
    FOREIGN KEY (`remetente_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medalhas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medalhas` ;

CREATE TABLE IF NOT EXISTS `medalhas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_post` INT NOT NULL,
  `remetente_id` INT NOT NULL,
  `data_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `FK_medalhas_1_idx` (`remetente_id` ASC)  ,
  INDEX `FK_medalhas_2_idx` (`id_post` ASC)  ,
  CONSTRAINT `FK_medalhas_1`
    FOREIGN KEY (`remetente_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_medalhas_2`
    FOREIGN KEY (`id_post`)
    REFERENCES `postagens` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moedas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moedas` ;

CREATE TABLE IF NOT EXISTS `moedas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `remetente_id` INT NOT NULL,
  `qtd_moedas` INT NOT NULL,
  `data_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `FK_moedas_1_idx` (`usuario_id` ASC)  ,
  INDEX `FK_moedas_2_idx` (`remetente_id` ASC)  ,
  CONSTRAINT `FK_moedas_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_moedas_2`
    FOREIGN KEY (`remetente_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `anuncios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `anuncios` ;

CREATE TABLE IF NOT EXISTS `anuncios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `imagem` VARCHAR(250) NOT NULL DEFAULT 'NI',
  `valido_ate` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `usuarios_tem_interesses_ensino`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuarios_tem_interesses_ensino` ;

CREATE TABLE IF NOT EXISTS `usuarios_tem_interesses_ensino` (
  `usuario_id` INT NOT NULL,
  `interesse_id` INT NOT NULL,
  INDEX `FK_interesses_ensino_1_idx` (`usuario_id` ASC)  ,
  INDEX `FK_interesses_ensino_2_idx` (`interesse_id` ASC)  ,
  PRIMARY KEY (`usuario_id`, `interesse_id`),
  CONSTRAINT `FK_interesses_ensino_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_interesses_ensino_2`
    FOREIGN KEY (`interesse_id`)
    REFERENCES `interesses_ensino` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `usuarios_tem_interesses_aprendizado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuarios_tem_interesses_aprendizado` ;

CREATE TABLE IF NOT EXISTS `usuarios_tem_interesses_aprendizado` (
  `usuario_id` INT NOT NULL,
  `interesse_id` INT NOT NULL,
  INDEX `FK_interesse_aprendizado_1_idx` (`usuario_id` ASC)  ,
  INDEX `FK_interesse_aprendizado_2_idx` (`interesse_id` ASC)  ,
  PRIMARY KEY (`usuario_id`, `interesse_id`),
  CONSTRAINT `FK_interesse_aprendizado_1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_interesse_aprendizado_2`
    FOREIGN KEY (`interesse_id`)
    REFERENCES `interesses_aprendizado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
