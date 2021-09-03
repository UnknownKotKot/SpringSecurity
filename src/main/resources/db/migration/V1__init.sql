create table users (
    id          bigserial,
    username    varchar(30) not null unique,
    password    varchar(80) not null,
    email       varchar(50) unique,
    primary key (id)
);

insert into users (username, password, email)
values
('user0', '$2a$12$hzUtHGx1y0QNeFyF7j2vKePDyS2CIvsDD96PIBydjIbNZvtqRhjja', 'user0@email.com'),
('user1', '$2a$12$hzUtHGx1y0QNeFyF7j2vKePDyS2CIvsDD96PIBydjIbNZvtqRhjja', 'user1@email.com'),
('user2', '$2a$12$hzUtHGx1y0QNeFyF7j2vKePDyS2CIvsDD96PIBydjIbNZvtqRhjja', 'user2@email.com');

create table roles (
    id              serial,
    role_name       varchar(50) not null,
    primary key (id)
);

insert into roles (role_name)
values
('ROLE_USER'), ('ROLE_ADMIN');

create table users_roles (
user_id     bigint not null,
role_id     bigint not null,
primary key (user_id, role_id),
foreign key (user_id) references users (id),
foreign key (role_id) references roles (id)
);

insert into users_roles (user_id, role_id)
values
(1, 1),
(2, 1),
(3, 2);

create table privileges (
    id     bigserial,
    p_name     varchar(50) not null,
    primary key (id)
);

insert into privileges(id, p_name)
values
       (1, 'A'),
       (2, 'B');

create table roles_privileges (
    role_id             bigint not null,
    privilege_id        bigint not null,
    primary key (role_id, privilege_id ),
    foreign key (role_id) references roles (id),
    foreign key (privilege_id) references privileges (id)
);

insert into roles_privileges(role_id, privilege_id)
values
       (1, 1),
       (2, 1),
       (2, 2);