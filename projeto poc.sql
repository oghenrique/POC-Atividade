create schema poc_sql_gustavo_nicolas;

use poc_sql_gustavo_nicolas;

create table empresas(
	id int primary key not null,
    nome varchar(60),
    cnpj bigint(14),
    tipo_parceria varchar(30),
    duracao_parceria int
);

create table instituicao(
	id integer primary key not null,
    nome varchar(100)  not null,
    filial varchar (20) not null,
    cnpj bigint (14) not null,
    id_empresas_parceiras int,
    cursos int,
    
    foreign key (id_empresas_parceiras) references empresas (id),
    foreign key (cursos) references cursos(id)
);

create table alunos(
	id int primary key not null,
	nome varchar(60) not null,
    cpf bigint(11) not null,
    telefone bigint(15),
    data_nascimento date not null,
    endereco varchar(60),
    email varchar(60)
);

create table professor(
	id integer primary key not null,
	nome varchar(60) not null,
    cpf bigint(11) not null,
    telefone bigint(15),
    data_nascimento date not null,
    data_contratacao date not null,
    endereco varchar(60),
    email varchar(60)
);

create table cursos (
id integer primary key not null,
nome varchar(60) not null,
tipo_formacao varchar (40) not null,
carga_horaria int not null,
turmas int,

foreign key (turmas) references  turmas(id)
);

create table turmas (
id integer primary key not null,
ano_escolar int not null,
id_disciplina int,
id_professor int,
alunos int,

foreign key (id_disciplina) references disciplinas (id),
foreign key (id_professor) references professor(id),
foreign key (alunos) references alunos(id)
);

create table disciplinas (
id integer primary key not null,
nome varchar (60) not null,
carga_horario int not null
);

create table atividades_extras (
id integer primary key not null,
nome varchar (80) not null,
tipo_atividade varchar (80),
turma int,

foreign key (turma) references turmas(id)
);



