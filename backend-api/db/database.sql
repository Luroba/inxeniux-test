CREATE DATABASE IF NOT EXISTS [yourDataBase];

USE [yourDataBase];


CREATE TABLE `[yourDataBase]`.`usuarios` ( 
   `id` INT(10) NOT NULL AUTO_INCREMENT ,
   `nombre` VARCHAR(50) NOT NULL ,
   `apellidos` VARCHAR(80) NOT NULL ,
   `edad` TINYINT(2) NOT NULL ,
   `fechaNacimiento` DATE NOT NULL ,
   `estadoCivil` VARCHAR(30) NOT NULL ,
   `pais` VARCHAR(40) NOT NULL ,
   `estado` VARCHAR(40) NOT NULL ,
   `municipio` VARCHAR(40) NOT NULL ,
   `localidad` VARCHAR(40) NOT NULL ,
   `idioma` VARCHAR(40) NOT NULL ,
   `pasatiempos` CHAR(255) NULL ,
   `telefono` VARCHAR(20) NOT NULL ,
   `cp` VARCHAR(20) NOT NULL ,
   PRIMARY KEY (`id`)
);