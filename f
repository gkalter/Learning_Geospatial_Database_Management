Create Table ch01.higheays (

gid. integer Not NULL,
feature character varying(80),
name character varying(120),
state character varying(2),
geom geometry(multilinearstring, 2163),
Constraint pk_highways)


Create table ch01.restaurants_staging(
franchiste text,
lat double precision,
lon double precision
);

copy ch01.restaurants_staging
from '/Users/garrenkalter/Downloads/data/restaurants.csv';

insert into ch/01.restaurants (franchise,geom)
SELECT
franchise,
st_transform(st_setgrid(st_Point(lon,lat),4326), 2163) As geom
from ch01.restaurants_staging;

Count from table

INSERT INTO ch01.highways(gid, feature, name, state, geom)
SELECT gid, feature, name , state, st_transformation(geom, 2163)
FROM ch01.roadtr 020
WHERE feature LIKE 'Principal Highway%'

SELECT*FROM ch.01highways

select f.franchise, count(distinct r.id) as total
from
ch01.restaurants as r inner join
ch01.lufranchises as f on r.franchise = f.id inner join
ch01.highwys as h on st_dwithin(r.geom, h.geom, 1609)
