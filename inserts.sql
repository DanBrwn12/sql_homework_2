--Задание № 1
insert into genres (genre_name)
values ('rock'), ('heavy metal'), ('metal core'), ('alternative'), ('post pank'), ('punk rock')
returning genre_id, genre_name

insert into performers (performer_name)
values ('rob zombie'), ('linkin park'), ('ill nino'), ('green day'), ('blink 182'), ('sum 41'), ('godsmack'), ('nirvana'), ('bring me the horizon'), ('bullet for my valentine')
returning performer_id, performer_name

insert into performers_genres (genre_id, performer_id)
values (1, 1),
	(4, 2),
	(4, 3),
	(6, 4),
	(6, 5),
	(6, 6),
	(2, 7),
	(4, 8),
	(3, 9),
	(3, 10)
	
insert into albums (album_name, year_release)
values ('nevermind', '1994-09-24'),
	('meteora', '2003-03-25'),
	('Mondo Sex Head', '2012-05-23'),
	('Revolution Revolucion', '2003-06-09'),
	('BBC Sessions Part 2', '2021-09-12'),
	('Neighborhoods', '2011-05-05'),
	('All Killer No Filler', '2001-05-08'),
	('Godsmack', '1998-08-25'),
	('amo', '2019-01-25'),
	('Venom', '2015-08-14')
returning album_id, album_name

insert into tracks (track_name, duration, album_id)
values ('smells like teen spirit', 301, 1),
	('in bloom', 255, 1),
	('dont stay', 228, 2),
	('living dead girl', 540, 3),
	('i am loco', 240, 4),
	('revolution', 240, 4),
	('liar', 241, 4),
	('driving south', 331, 5),
	('this is home', 166, 6),
	('summer', 169, 7),
	('keep away', 290, 8),
	('voodoo', 282, 8),
	('in the dark', 271, 9),
	('heavy metal', 240, 9),
	('broken', 208, 10),
	('skin', 239, 10),
	('no way out', 233, 10),
	('this is my bad', 222, 1)
returning track_name, track_id, album_id

insert into collections (collection_name, year_release)
values ('best of 2000th', '2000-08-08'), ('smile', '2022-03-22'), ('sunny day', '2020-12-12'), ('psycho', '2025-05-11')
returning collection_id, collection_name, extract(year from  year_release)

insert into performers_albums (performer_id, album_id)
values (1, 8),
	(2, 2),
	(3, 1),
	(4, 3),
	(5, 4),
	(6, 5),
	(7, 6),
	(8, 7),
	(9, 9),
	(10, 10)
	
insert into collections_tracks (collection_id, track_id)
values (1, 5),
	(1, 8),
	(1, 3),
	(1, 4),
	(1, 17),
	(2, 17),
	(2, 14),
	(2, 10),
	(2, 7),
	(2, 4),
	(2, 3),
	(3, 1),
	(3, 2),
	(3, 5),
	(3, 9),
	(4, 6),
	(4, 11),
	(4, 12),
	(4, 13),
	(4, 15),
	(4, 16),
	(4, 4)
	
	
	
	
	
	
	