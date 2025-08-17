-- Задание № 2

--Название и продолжительность самого длительного трека.
select track_name, duration from tracks
where duration = (select max(duration) from tracks)

--Название треков, продолжительность которых не менее 3,5 минут.
select track_name from tracks
where duration > 310

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select collection_name from collections 
where extract(year from  year_release) between 2018 and 2020

--Исполнители, чьё имя состоит из одного слова.
select performer_name from performers
where performer_name not like '% %'

--Название треков, которые содержат слово «мой» или «my»
select track_name from tracks
where track_name like '%my%' or track_name like '%мой%'

-- Задание № 3

--Количество исполнителей в каждом жанре.
select g.genre_name as "Жанр",
    count(pg.performer_id) as "Количество исполнителей"
from genres g
left join performers_genres pg on g.genre_id = pg.genre_id
group by g.genre_id, g.genre_name

--Количество треков, вошедших в альбомы 2019–2020 годов.
select a.album_name as "Альбомы",
	count(t.track_id) as "Количество треков"
from albums a
join tracks t on a.album_id = t.album_id
where extract(year from a.year_release) between 2019 and 2020
group by a.album_id, a.album_name

--Средняя продолжительность треков по каждому альбому.
select a.album_name as "Альбом",
	round(avg(t.duration)) as "Средняя продолжительность треков"
from tracks t
join albums a on t.album_id = a.album_id
group by a.album_id, a.album_name 

--Все исполнители, которые не выпустили альбомы в 2020 году.
select performer_name as "Исполнитель"
from performers p
where p.performer_id not in (
	select distinct pa.performer_id from performers_albums pa
	join albums a on pa.album_id = a.album_id
	where extract(year from year_release) = 2020)

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct c.collection_name as "Название сборника"
from collections c
join collections_tracks ct on ct.collection_id = c.collection_id
join tracks t on ct.track_id = t.track_id 
join albums a on t.album_id = a.album_id 
join performers_albums pa on pa.album_id  = a.album_id
join performers p on pa.performer_id = p.performer_id 
where p.performer_name = 'godsmack'

--Задание № 4

--названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select distinct a.album_name as "Название альбома"
from albums a
join performers_albums pa on a.album_id = pa.album_id
join performers p on pa.performer_id = p.performer_id
join performers_genres pg on p.performer_id = pg.performer_id
group by a.album_id, a.album_name
having count(distinct pg.genre_id) > 1

--Наименования треков, которые не входят в сборники.
select t.track_name as "Трек не в сборниках"
from tracks t
left join collections_tracks ct on t.track_id = ct.track_id
where ct.track_id is null

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
select distinct p.performer_name as "Исполнитель", 
       t.track_name as "Трек",
       t.duration as "Длительность"
from performers p
join performers_albums pa on p.performer_id = pa.performer_id
join albums a on pa.album_id = a.album_id
join tracks t on a.album_id = t.album_id
where t.duration = (
    select min(duration) 
    from tracks)
    
--Названия альбомов, содержащих наименьшее количество треков.
select a.album_name as "Название альбома", 
       count(t.track_id) as "Количество треков"
from albums a
join tracks t on a.album_id = t.album_id
group by a.album_id, a.album_name
having count(t.track_id) = (
    select count(track_id) 
    from tracks 
    group by album_id 
    order by count(track_id) 
    limit 1)





