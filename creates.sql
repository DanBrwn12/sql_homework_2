-- создание таблицы с исполнителями
create table if not exists Performers (
	performer_id SERIAL primary key,
	performer_name VARCHAR(60) not null 
);

-- создание таблицы с жанрами
create table if not exists Genres (
	genre_id SERIAL primary key,
	genre_name VARCHAR(60) not null
);

-- создание таблицы с альбомами
create table if not exists Albums (
	album_id SERIAL primary key,
	album_name VARCHAR(60) not null,
	year_release date
);

-- создание таблицы с треками
create table if not exists Tracks (
	track_id SERIAL primary key,
	album_id INTEGER not null references Albums(album_id) ON DELETE CASCADE,
	track_name VARCHAR(60) not null,
	duration INTEGER not null check (duration > 0)
);

-- создание таблицы коллекций
create table if not exists Collections (
	collection_id SERIAL primary key,
	collection_name VARCHAR(60) not null,
	year_release date
);

-- общая таблица для исполнителей и жанров 
create table if not exists Performers_Genres (
	performer_id INTEGER not null references Performers(performer_id),
	genre_id INTEGER not null references Genres(genre_id),
	constraint pk_performer_genre primary key (performer_id, genre_id)
);

-- общая таблица для исполнителей и альбомов
create table if not exists Performers_Albums (
	performer_id INTEGER not null references Performers(performer_id),
	album_id INTEGER not null references Albums(album_id),
	constraint pk_performer_album primary key (performer_id, album_id)
);

-- общая таблица для коллекций и треков
create table if not exists Collections_Tracks (
	collection_id INTEGER not null references Collections(collection_id),
	track_id INTEGER not null references Tracks(track_id),
	constraint pk_collection_track primary key (collection_id, track_id)
);