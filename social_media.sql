create table if not exists account
(
    id_account  serial
        primary key,
    first_name  varchar(80),
    last_name   varchar(80)  not null,
    nickname    varchar(50),
    birthday    date         not null,
    gender      char         not null,
    email       varchar(100) not null
        unique,
    profile_pic varchar(250) default 'default.png'::character varying
);

create table if not exists send_invite
(
    id_account_sender   integer not null
        references account,
    id_account_receiver integer not null
        references account,
    is_accepted         boolean default false,
    friendship_birthday date    default CURRENT_DATE
);

create table if not exists message
(
    id_account_sender   integer not null
        references account,
    id_account_receiver integer not null
        references account,
    message_datetime    timestamp default now(),
    message_content     text
        constraint message_message_content_check
            check (message_content <> ''::text),
    seen_datetime       timestamp,
    constraint message_check
        check (seen_datetime >= message_datetime)
);

create table if not exists post
(
    id_post      serial
        primary key,
    posting_date date default CURRENT_DATE,
    posting_time time default now(),
    post_content text,
    id_account   integer not null
        references account
);

create table if not exists react_post
(
    id_account        integer                                       not null
        references account,
    id_post           integer                                       not null
        references post,
    reaction_type     varchar(20) default 'like'::character varying not null,
    reaction_datetime timestamp   default now()
);


