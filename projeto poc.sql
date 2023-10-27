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
    carga_horaria int not null,
    id_curso int,
    
    foreign key (id_curso) references cursos(id)
);


create table professores (
    id int primary key not null,
    nome varchar(60) not null,
    cpf bigint(11) not null,
    telefone bigint(15),
    data_nascimento date not null,
    data_contratacao date not null,
    endereco varchar(60),
    email varchar(60),
    id_disciplina int,
    
    foreign key (id_disciplina) references disciplinas(id)
    
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

create table turmas (
    id int primary key not null,
    ano_escolar int not null,
    id_professor int,
    id_curso int,
    foreign key (id_professor) references professores(id),
    foreign key (id_curso) references cursos(id)
);

create table alunos (
    id int primary key not null,
    nome varchar(60) not null,
    cpf bigint(11) not null,
    telefone bigint(15),
    data_nascimento date not null,
    endereco varchar(60),
    email varchar(60),
    id_turma int, 
    
    foreign key (id_turma) references turmas(id)
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
    descricao varchar(200)
);

create table frequencia (
    id int primary key not null,
    id_aluno int,
    data_aula date not null,
    presenca varchar(15),
    foreign key (id_aluno) references alunos(id)
);

create table atividades_extras (
    id int primary key not null,
    nome varchar(80) not null,
    tipo_atividade varchar(80),
    id_turma int,
    
    foreign key (id_turma) references turmas(id)
);

insert into empresas (id, nome, cnpj, tipo_parceria, duracao_parceria) 
values
(1, "Senai", 76095658000196, "Estágios", 2),
(2, "YouTube", 09622667000109, "Projetos", 4),
(3, "Google", 22044876000172, "Estágios", 8),
(4, "Fiap", 61554609000105, "Projetos", 3);

insert into cursos (id, nome, tipo_formacao, carga_horaria)
values
(111, "Desenvolvimento Web", "FIC", 72),
(222, "Python", "FIC", 144),
(333, "Redes", "Ensino Médio Tecnico", 1382);

insert into disciplinas (id, nome, carga_horaria, id_curso)
values
(10, "HTML e CSS", 33, 111),
(11, "JavaScript", 33, 111),
(12, "MongoDB", 6, 222),
(13, "Fundamentos de Redes", 87, 333),
(14, "Cabeamento", 24, 333),
(15, "Cloud", 72, 111);

INSERT INTO professores (id, nome,cpf,telefone,data_nascimento,data_contratacao,endereco,email, id_disciplina)
VALUES
(100, "Tanisha Harrell","129442227800", 11988099363, "1994-1-1" ,"2020-06-30","Ap #776-4126 Dolor St.","tanishaharrell@gmail.com", 10 ),
(200, "Dante Guerra","008651524679",1194631536,"1978-09-14","2023-12-26","192 Dis Ave","danteguerra@gmail.com", 11 ),
(300, "Yvette Gibson","407218467402", 11963674418,"1967-1-8","2023-8-4","660-8184 Quis, Ave","yvettegibson@gmail.com",12 ),
(400, "Joelle Salinas","645075378740", 11991380230, "1989-10-13", "2024-5-3","495 Mattis. Road","joellesalinas1901@gmail.com", 13 ),
(500, "Cynthia Carson","352151036886", 11987654567,"1999-1-10","2022-11-24","Ap #554-3308 Vestibulum Street","cynthiacarson8755@gmail.com", 14);

insert into instituicao (id, nome, filial, cnpj, id_empresas, id_cursos)
values
(20, 'Senai SP', 'Jandira', 76095658000198, 1, 111);

INSERT INTO alunos (id, nome, cpf, telefone, data_nascimento, endereco, email)
VALUES
(123, "Jackson Luna","155645198335", 11945631536 ,"2004-2-26","Ap #513-9001 Sem Rd.","jacksonluna9185@gmail.com"),
(321, "May Barker","366946617872", 11988099363,"2006-12-12","Ap #297-9276 Nunc Avenue","maybarker4949@gmail.com"),
(456, "Eleanor Harrison","536554914771", 11963674418 ,"2005-12-09","3361 Sed Av.","eleanorharrison6928@gmail.com"),
(654, "Quon Hardy","653652872821", 11291694731,"2007-10-17","Ap #523-6817 A Rd.","quonhardy@gmail.com"),
(789, "Molly Good","679688721389", 11991380230,"2006-1-31","9635 Quis St.","mollygood9938@gmail.com");

insert into turmas (id, ano_escolar, id_disciplina, id_professor)
values
(90, 2023, 10, 100),
(91, 2024, 12, 500),
(92, 2023, 14, 300),
(93, 2024, 11, 400);

INSERT INTO matriculas (id, id_aluno, id_curso, data_matricula) 
VALUES 
(1000, 123, 111, '2023-01-15'),
(1001, 321, 222, '2023-02-20'),
(1002, 456, 333, '2023-03-25'),
(1003, 654, 111, '2023-04-10'),
(1004, 789, 333, '2023-05-05');

INSERT INTO notas (id, id_aluno, id_disciplina, nota, data_avaliacao)
VALUES 
(80, 123, 10, 100, '2023-01-10'),
(81, 321, 13, 80, '2023-02-15'),
(82, 456, 10, 80, '2023-03-20'),
(83, 654, 12, 100, '2023-04-05'),
(84, 789, 14, 90, '2023-05-12');

INSERT INTO eventos_academicos (id, nome, data_evento, descricao) 
VALUES 
(999, 'Semana de Ciências', '2023-03-01', 'Palestras e workshops'),
(888, 'Feira de Carreiras', '2023-04-10', 'Oportunidades de emprego'),
(777, 'Conferência de Tecnologia', '2023-05-15', 'Últimas tendências tecnológicas'),
(666, 'Seminário de Literatura', '2023-06-20', "Apresentações dos TCC's do Senai SP"),
(555, 'Dia da Ciência', '2023-07-05', 'Apresentações de projetos de pesquisa');

INSERT INTO frequencia (id, id_aluno, data_aula, presenca) 
VALUES 
(1212, 123, '2023-01-03', 'Presente'),
(1313, 321, '2023-02-08', 'Faltou'),
(1414, 456, '2023-03-13', 'Presente'),
(1515, 654, '2023-04-19', 'Presente'),
(1616, 789, '2023-05-24', 'Faltou');

INSERT INTO atividades_extras (id, nome, tipo_atividade, id_turma) 
VALUES 
(9999, 'Clube de Leitura', 'Cultural', 90),
(8888, 'Clube de Programação', 'Técnica', 93),
(7777, 'Clube de Música', 'Cultural', 91),
(6666, 'Clube de Esportes', 'Esportiva', 92),
(5555, 'Clube dos Games', 'Voluntariado Social', 90);

-- Relatório de desempenho

select alunos.nome as aluno, disciplinas.nome as disciplina, notas.nota as nota
from alunos inner join matriculas on alunos.id = matriculas.id_aluno
inner join cursos on matriculas.id_curso = cursos.id inner join disciplinas 
on cursos.id = disciplinas.id_curso left join notas on alunos.id = notas.id_aluno 
and disciplinas.id = notas.id_disciplina;

-- Histórico Escolar
select alunos.nome as aluno, cursos.nome as curso, disciplinas.nome as disciplina, notas.nota as nota
from alunos inner join matriculas on alunos.id = matriculas.id_aluno inner join cursos on matriculas.id_curso = cursos.id
inner join disciplinas on cursos.id = disciplinas.id_curso left join notas on alunos.id = notas.id_aluno 
and disciplinas.id = notas.id_disciplina;

-- Eventos acadêmicos

select * from eventos_academicos;

-- Frequência dos alunos

select frequencia.*, alunos.nome from frequencia inner join alunos on frequencia.id_aluno = alunos.id;

-- Gestão de matriculas e inscrições

select matriculas.id, alunos.nome, cursos.nome, matriculas.data_matricula from matriculas
inner join alunos on matriculas.id_aluno = alunos.id
inner join cursos on matriculas.id_curso = cursos.id;



