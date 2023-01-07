
-- ----------------------------
-- Structure
-- ----------------------------

create table category (id uuid not null, created_at timestamp not null, name varchar(255) not null, updated_at timestamp not null, primary key (id));
create table role (id uuid not null, created_at timestamp not null, description text not null, name varchar(255) not null, updated_at timestamp not null, primary key (id));
create table role_hierarchy (child_role_id uuid not null, parent_role_id uuid not null, primary key (parent_role_id, child_role_id));
create table "user" (id uuid not null, created_at timestamp not null, email varchar(255) not null, name varchar(255) not null, password varchar(255) not null, status int4 not null, updated_at timestamp not null, primary key (id));
create table user_role (user_id uuid not null, role_id uuid not null, primary key (user_id, role_id));

alter table role add constraint role_name_uk unique (name);
alter table "user" add constraint user_email_uk unique (email);
alter table role_hierarchy add constraint role_hierarchy_parent_role_id_fk foreign key (parent_role_id) references role;
alter table role_hierarchy add constraint role_hierarchy_child_role_id_fk foreign key (child_role_id) references role;
alter table user_role add constraint user_role_role_id_fk foreign key (role_id) references role;
alter table user_role add constraint user_role_user_id_fk foreign key (user_id) references "user";




