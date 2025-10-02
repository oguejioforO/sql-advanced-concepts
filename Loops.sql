use marketers;

# alter the table o add another column
alter table marketers_reward
add column yearly_increment int;

Delimiter $$
create procedure insert_data1()
Begin
set @var = 10;
generate_data: loop
insert into marketers_reward(yearly_increment) values (@var);
set @var = @var + 1;
if @var = 100 then
    leave generate_data;
end if;
end loop generate_data;
End $$

call insert_data1();

select * from marketers_reward;

