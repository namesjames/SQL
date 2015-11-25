drop table if exists users cascade;

create table users (
  id serial primary key,
  username varchar,
  password varchar,
  dob date
);

drop table if exists commitments;

create table commitments (
  id serial primary key,
  user_id integer references users(id),
  task varchar,
  interval varchar,
  fulfilled boolean
);

insert into users (username, password, dob) values ('zztop', '1234', '5/12/2015');
insert into users (username, password, dob) values ('firsties', 'pass', '2/15/2010');
insert into users (username, password, dob) values ('weeblo', 'kittens', '1/1/2008');

insert into commitments (user_id, task, interval, fulfilled) values
  ((select id from users where username = 'zztop'), 'eat less', 'always', false),
  ((select id from users where username = 'zztop'), 'eat less', 'always', false),
  ((select id from users where username = 'zztop'), 'eat less', 'always', false);
