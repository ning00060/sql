

create database db_movie;
use db_movie;

-- drop table movie;

create table movie(
id int not null primary key auto_increment,
title varchar(50) not null,
director varchar(20) not null,
release_date date not null,
genre varchar(10),
rating float(3) );

desc movie;

insert into movie(title,director,release_date,genre,rating)
values('괴물','봉준호','2006-07-27','드라마',8.28),
('극한직업','이병헌','2019-0-23','코미디',9.20),
('명량','김한민','2014-07-30','사극',9.17),
('신과함께-죄와 벌','김용화','2017-12-20','판타지',7.56),
('밀양','임권택','2016-09-07','드라마',7.76),
('반도','연상호','2020-07-15','액션',6.71),
('베테랑','류승완','2015-08-05','액션',8.49),
('변호인','양우석','2013-12-18','드라마',8.41),
('군함도','류승완','2017-07-26','사극',8.01),
('암살','최동훈','2015-07-22','액션',8.37);

select * from movie;

-- 문제 2010년대에 출시된 영화 이름을 조회 해주세요
select * 
from movie
where release_date like '%201%';

-- 문제 id가 2자리를 넘지않고 감독이 류승완인 작품의 평점8.1이상을 조회해주세요
select *
from movie
where id<10 and director='류승완'and rating>8.1;

-- 문제  장르가 드라마,액션을 제외한 감독이 김씨가 아닌 작품을 조회해주세요 
select *
from movie
where (genre != '드라마'and genre !='액션') and director not like "김%";

-- 문제 id 4,6 작품의 장르와 감독을 조회해주세요
select genre,director
from movie
where id=4 or id=6;

-- 문제 극한직업의 평점을 조회해주세요
select rating
from movie
where title='극한직업';

--  17년 이후 개봉 작품을 출력해주세요
select *
from movie
where release_date like '2017%'or release_date like'2018%'or release_date like'2019%'or release_date like'2020%';


select title, director, rating
from movie
where rating >= 9;