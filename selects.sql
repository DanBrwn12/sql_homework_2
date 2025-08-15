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



--Средняя продолжительность треков по каждому альбому.
--Все исполнители, которые не выпустили альбомы в 2020 году.
--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).

--Количество исполнителей в каждом жанре.
select g.genre_name as "Жанр",
    count(pg.performer_id) as "Количество исполнителей"
from genres g
left join performers_genres pg on g.genre_id = pg.genre_id
group by g.genre_id, g.genre_name

--Количество треков, вошедших в альбомы 2019–2020 годов.
select t.album_name as "Альбомы",
	count(t.track_id) as "Количество треков"
from tracks t
where 
	
