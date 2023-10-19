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
