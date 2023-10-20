create schema poc_sql_gustavo_nicolas;

use poc_sql_gustavo_nicolas;

create table empresas (
    id int primary key not null,
    nome varchar(60),
    cnpj bigint(14),
    tipo_parceria varchar(30),
    duracao_parceria int
);

create table cursos (
    id int primary key not null,
    nome varchar(60) not null,
    tipo_formacao varchar(40) not null,
    carga_horaria int not null
);

create table disciplinas (
    id int primary key not null,
    nome varchar(60) not null,
    carga_horaria int not null
);

create table professores (
    id int primary key not null,
    nome varchar(60) not null,
    cpf bigint(11) not null,
    telefone bigint(15),
    data_nascimento date not null,
    data_contratacao date not null,
    endereco varchar(60),
    email varchar(60)
);

create table instituicao (
    id int primary key not null,
    nome varchar(100) not null,
    filial varchar(20) not null,
    cnpj bigint(14) not null,
    id_empresas int,
    id_cursos int,
    foreign key (id_empresas) references empresas(id),
    foreign key (id_cursos) references cursos(id)
);

create table alunos (
    id int primary key not null,
    nome varchar(60) not null,
    cpf bigint(11) not null,
    telefone bigint(15),
    data_nascimento date not null,
    endereco varchar(60),
    email varchar(60)
);

create table turmas (
    id int primary key not null,
    ano_escolar int not null,
    id_disciplina int,
    id_professor int,
    id_curso int,
    foreign key (id_disciplina) references disciplinas(id),
    foreign key (id_professor) references professores(id),
    foreign key (id_curso) references cursos(id)
);

create table matriculas (
    id int primary key not null,
    id_aluno int,
    id_curso int,
    data_matricula date not null,
    foreign key (id_aluno) references alunos(id),
    foreign key (id_curso) references cursos(id)
);

create table notas (
    id int primary key not null,
    id_aluno int,
    id_disciplina int,
    nota int not null,
    data_avaliacao date not null,
    foreign key (id_aluno) references alunos(id),
    foreign key (id_disciplina) references disciplinas(id)
);

create table eventos_academicos (
    id int primary key not null,
    nome varchar(80) not null,
    data_evento date not null,
    descricao varchar(200),
    id_instituicao int,
    
    foreign key (id_instituicao) references instituicao (id)
);

create table frequencia (
    id int primary key not null,
    id_aluno int,
    id_turma int,
    data_aula date not null,
    presenca varchar(15),
    foreign key (id_aluno) references alunos(id),
    foreign key (id_turma) references turmas(id)
);

create table atividades_extras (
    id int primary key not null,
    nome varchar(80) not null,
    tipo_atividade varchar(80),
    id_turma int,
    
    foreign key (id_turma) references turmas(id)
);

insert into empresas (nome, cnpj, tipo_parceria, duracao_parceria) 
values
("Senai", 76095658000196, "Estágios", 2)
("YouTube", 09622667000109, "Projetos", 4)
("Google", 22044876000172, "Estágios", 8)
("Fiap", 61554609000105, "Projetos", 3)


INSERT INTO professores (nome,cpf,telefone,data_nascimento,data_contratacao,endereco,email)
VALUES
("Tanisha Harrell","129442227800","(882) 247-1794","Jan 1, 2020","Jun 30, 2024","Ap #776-4126 Dolor St.","tanishaharrell@gmail.com"),
("Dante Guerra","008651524679","(474) 574-8063","Sep 14, 2019","Dec 26, 2023","192 Dis Ave","danteguerra@gmail.com"),
("Yvette Gibson","407218467402","(942) 557-9560","Jan 8, 2023","Aug 4, 2023","660-8184 Quis, Ave","yvettegibson@gmail.com"),
("Joelle Salinas","645075378740","(551) 856-4453","Oct 13, 2023","May 3, 2024","495 Mattis. Road","joellesalinas1901@gmail.com"),
("Cynthia Carson","352151036886","(496) 464-7684","Jan 10, 2024","Nov 24, 2022","Ap #554-3308 Vestibulum Street","cynthiacarson8755@gmail.com");

INSERT INTO alunos (nome,cpf,telefone,data_nascimento,endereco,email)
VALUES
("Jackson Luna","155645198335","(569) 476-8670","Feb 26, 2024","Ap #513-9001 Sem Rd.","jacksonluna9185@gmail.com"),
("May Barker","366946617872","(123) 574-2512","Jan 27, 2024","Ap #297-9276 Nunc Avenue","maybarker4949@gmail.com"),
("Eleanor Harrison","536554914771","(836) 273-1426","Sep 27, 2018","3361 Sed Av.","eleanorharrison6928@gmail.com"),
("Quon Hardy","653652872821","(245) 599-8199","Dec 12, 2022","Ap #523-6817 A Rd.","quonhardy@gmail.com"),
("Molly Good","679688721389","(435) 553-8441","May 7, 2020","9635 Quis St.","mollygood9938@gmail.com");
