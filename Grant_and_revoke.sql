


Create User da20user with password 'admin' nocreatedb;

grant select on customer to da20user
grant insert on customer to da20user

revoke select, insert on customer from da20user

revoke all on customer from da20user

