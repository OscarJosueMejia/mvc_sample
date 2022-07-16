use nw202202;

CREATE TABLE candidato (
	id_candidato int auto_increment,
	identidad varchar(13) not null,
    nombre varchar(50) not null,
    edad int not null,
    
    primary key (id_candidato)
)