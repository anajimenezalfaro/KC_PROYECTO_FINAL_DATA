-- Esquema de trabajo
create schema airbnb authorization irqorcet;

--Tabla países (COUNTRIES)
create table airbnb.countries(
	ID_COUNTRY varchar(100) not null, --PK
	ISO_CODE varchar(2) not null,
	NAME varchar(50) not null,
	DESCRIPTION varchar(512) null
);

alter table airbnb.countries
add constraint countries_PK primary key (ID_COUNTRY);

-- Carga de datos

insert into airbnb.countries (ID_COUNTRY, ISO_CODE, NAME, DESCRIPTION) values('1', 'ES', 'SPAIN',  ' ');
insert into airbnb.countries (ID_COUNTRY, ISO_CODE, NAME, DESCRIPTION) values('2', 'PT', 'PORTUGAL',  ' ');
insert into airbnb.countries (ID_COUNTRY, ISO_CODE, NAME, DESCRIPTION) values('3', 'IT', 'ITALY',  ' ');




--Tabla provincias (STATE_CLEANSED)
create table airbnb.states(
	ID_STATE varchar(100) not null, --PK
	NAME varchar(50) not null,
	ID_COUNTRY varchar(100) not null, --FK
	DESCRIPTION varchar(512) null
);

alter table airbnb.states
add constraint states_PK primary key (ID_STATE);

alter table airbnb.states
add constraint states_countries_FK foreign key (ID_COUNTRY)
references airbnb.countries(ID_COUNTRY);

-- Carga de datos
insert into airbnb.states (ID_STATE, NAME, ID_COUNTRY, DESCRIPTION) values('1', 'BARCELONA', '1',  ' ');
insert into airbnb.states (ID_STATE, NAME, ID_COUNTRY, DESCRIPTION) values('2', 'MADRID', '1',  ' ');
insert into airbnb.states (ID_STATE, NAME, ID_COUNTRY, DESCRIPTION) values('3', 'VALENCIA', '1',  ' ');




--Tabla ciudades (CITY_CLEANSED)
create table airbnb.cities(
	ID_CITY varchar(100) not null, --PK
	NAME varchar(50) not null,
	ID_STATE varchar(100) not null, --FK
	DESCRIPTION varchar(512) null
);

alter table airbnb.cities
add constraint cities_PK primary key (ID_CITY);

alter table airbnb.cities
add constraint cities_states_FK foreign key (ID_STATE)
references airbnb.states(ID_STATE);

-- Carga de datos
insert into airbnb.cities (ID_CITY, NAME, ID_STATE, DESCRIPTION) values('1', 'BARCELONA', '1',  ' ');
insert into airbnb.cities (ID_CITY, NAME, ID_STATE, DESCRIPTION) values('2', 'MADRID', '2',  ' ');
insert into airbnb.cities (ID_CITY, NAME, ID_STATE, DESCRIPTION) values('3', 'VALENCIA', '3',  ' ');


--Tabla barrios (NEIGHBOURHOOD_CLEANSED)
create table airbnb.neighbourhoods(
	ID_NEIGHBOURHOOD varchar(100) not null, --PK
	NAME varchar(50) not null,
	ID_CITY varchar(100) not null, --FK
	DESCRIPTION varchar(512) null
);

alter table airbnb.neighbourhoods
add constraint neighbourhoods_PK primary key (ID_NEIGHBOURHOOD);

alter table airbnb.neighbourhoods
add constraint neighbourhoods_cities_FK foreign key (ID_CITY)
references airbnb.cities(ID_CITY);

-- Carga de datos
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('1', 'ABRANTES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('2', 'ACACIAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('3', 'ADELFAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('4', 'AEROPUERTO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('5', 'AGUILAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('6', 'ALAMEDA DE OSUNA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('7', 'ALMAGRO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('8', 'ALMENARA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('9', 'ALMENDRALES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('10', 'ALUCHE', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('11', 'AMBROZ', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('12', 'AMPOSTA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('13', 'APOSTOL SANTIAGO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('14', 'ARAPILES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('15', 'ARAVACA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('16', 'ARCOS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('17', 'ARGUELLES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('18', 'ATOCHA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('19', 'BELLAS VISTAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('20', 'BERRUGUETE', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('21', 'BUENAVISTA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('22', 'BUTARQUE', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('23', 'CAMPAMENTO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('24', 'CANILLAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('25', 'CANILLEJAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('26', 'CARMENES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('27', 'CASA DE CAMPO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('28', 'CASCO HISTORICO DE BARAJAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('29', 'CASCO HISTORICO DE VALLECAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('30', 'CASCO HISTORICO DE VICALVARO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('31', 'CASTELLANA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('32', 'CASTILLA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('33', 'CASTILLEJOS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('34', 'CHOPERA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('35', 'CIUDAD JARDIN', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('36', 'CIUDAD UNIVERSITARIA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('37', 'COLINA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('38', 'COMILLAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('39', 'CONCEPCION', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('40', 'CORRALEJOS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('41', 'CORTES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('42', 'COSTILLARES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('43', 'CUATRO CAMINOS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('44', 'CUATRO VIENTOS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('45', 'DELICIAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('46', 'EL GOLOSO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('47', 'EL PARDO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('48', 'EL PLANTIO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('49', 'EL VISO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('50', 'EMBAJADORES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('51', 'ENTREVIAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('52', 'ESTRELLA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('53', 'FONTARRON', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('54', 'FUENTE DEL BERRO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('55', 'FUENTELAREINA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('56', 'GAZTAMBIDE', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('57', 'GOYA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('58', 'GUINDALERA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('59', 'HELLIN', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('60', 'HISPANOAMERICA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('61', 'IBIZA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('62', 'IMPERIAL', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('63', 'JERONIMOS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('64', 'JUSTICIA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('65', 'LA PAZ', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('66', 'LEGAZPI', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('67', 'LISTA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('68', 'LOS ANGELES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('69', 'LOS ROSALES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('70', 'LUCERO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('71', 'MARROQUINA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('72', 'MEDIA LEGUA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('73', 'MIRASIERRA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('74', 'MOSCARDO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('75', 'NEIGHBOURHOOD_CLEANSED', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('76', 'NINO JESUS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('77', 'NUEVA ESPANA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('78', 'NUMANCIA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('79', 'OPANEL', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('80', 'ORCASITAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('81', 'ORCASUR', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('82', 'PACIFICO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('83', 'PALACIO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('84', 'PALOMAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('85', 'PALOMERAS BAJAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('86', 'PALOMERAS SURESTE', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('87', 'PALOS DE MOGUER', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('88', 'PAVONES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('89', 'PENAGRANDE', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('90', 'PILAR', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('91', 'PINAR DEL REY', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('92', 'PIOVERA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('93', 'PORTAZGO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('94', 'PRADOLONGO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('95', 'PROSPERIDAD', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('96', 'PUEBLO NUEVO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('97', 'PUERTA BONITA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('98', 'PUERTA DEL ANGEL', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('99', 'QUINTANA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('100', 'RECOLETOS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('101', 'REJAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('102', 'RIOS ROSAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('103', 'ROSAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('104', 'SALVADOR', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('105', 'SAN ANDRES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('106', 'SAN CRISTOBAL', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('107', 'SAN DIEGO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('108', 'SAN FERMIN', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('109', 'SAN ISIDRO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('110', 'SAN JUAN BAUTISTA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('111', 'SAN PASCUAL', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('112', 'SANTA EUGENIA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('113', 'SIMANCAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('114', 'SOL', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('115', 'TIMON', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('116', 'TRAFALGAR', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('117', 'UNIVERSIDAD', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('118', 'VALDEACEDERAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('119', 'VALDEFUENTES', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('120', 'VALDEMARIN', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('121', 'VALDEZARZA', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('122', 'VALLEHERMOSO', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('123', 'VALVERDE', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('124', 'VENTAS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('125', 'VINATEROS', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('126', 'VISTA ALEGRE', '2',  ' ');
insert into airbnb.neighbourhoods (ID_NEIGHBOURHOOD, NAME, ID_CITY, DESCRIPTION) values('127', 'ZOFIO', '2',  ' ');


--Tabla de los tipos de propiedades
create table airbnb.property_type(
	ID_PROPERTY_TYPE varchar(100) not null, --PK
	NAME varchar(50) not null,
	DESCRIPTION varchar(512) null
);

alter table airbnb.property_type
add constraint property_type_PK primary key (ID_PROPERTY_TYPE);

-- Carga de datos
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('1', 'APARTMENT', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('2', 'BED & BREAKFAST', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('3', 'BOAT', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('4', 'BOUTIQUE HOTEL', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('5', 'BUNGALOW', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('6', 'CAMPER/RV', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('7', 'CASA PARTICULAR', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('8', 'CHALET', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('9', 'CONDOMINIUM', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('10', 'DORM', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('11', 'EARTH HOUSE', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('12', 'GUEST SUITE', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('13', 'GUESTHOUSE', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('14', 'HOSTEL', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('15', 'HOUSE', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('16', 'LOFT', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('17', 'OTHER', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('18', 'SERVICED APARTMENT', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('19', 'TENT', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('20', 'TIMESHARE', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('21', 'TOWNHOUSE', ' ');
insert into airbnb.property_type (ID_PROPERTY_TYPE, NAME, DESCRIPTION) values('22', 'VILLA', ' ');


--Tabla de los tipos de habitación
create table airbnb.room_type(
	ID_ROOM_TYPE varchar(100) not null, --PK
	NAME varchar(50) not null,
	DESCRIPTION varchar(512) null
);

alter table airbnb.room_type
add constraint room_type_PK primary key (ID_ROOM_TYPE);

-- Carga de datos
insert into airbnb.room_type (ID_ROOM_TYPE, NAME, DESCRIPTION) values('1', 'ENTIRE HOME/APT', ' ');
insert into airbnb.room_type (ID_ROOM_TYPE, NAME, DESCRIPTION) values('2', 'PRIVATE ROOM', ' ');
insert into airbnb.room_type (ID_ROOM_TYPE, NAME, DESCRIPTION) values('3', 'SHARED ROOM', ' ');



--Tabla de los tipos de cama
create table airbnb.bed_type(
	ID_BED_TYPE varchar(100) not null, --PK
	NAME varchar(50) not null,
	DESCRIPTION varchar(512) null
);

alter table airbnb.bed_type
add constraint bed_type_PK primary key (ID_BED_TYPE);

-- Carga de datos
insert into airbnb.bed_type (ID_BED_TYPE, NAME, DESCRIPTION) values('1', 'AIRBED', ' ');
insert into airbnb.bed_type (ID_BED_TYPE, NAME, DESCRIPTION) values('2', 'COUCH', ' ');
insert into airbnb.bed_type (ID_BED_TYPE, NAME, DESCRIPTION) values('3', 'FUTON', ' ');
insert into airbnb.bed_type (ID_BED_TYPE, NAME, DESCRIPTION) values('4', 'PULL-OUT SOFA', ' ');
insert into airbnb.bed_type (ID_BED_TYPE, NAME, DESCRIPTION) values('5', 'REAL BED', ' ');





--Tabla de las divisas
create table airbnb.currencies(
	ID_CURRENCY varchar(100) not null, --PK
	NAME varchar(50) not null,
	DESCRIPTION varchar(512) null
);

alter table airbnb.currencies
add constraint currencies_PK primary key (ID_CURRENCY);

-- Carga de datos

insert into airbnb.currencies (id_currency, name, description) values('1', 'EUR', ' ');
insert into airbnb.currencies (id_currency, name, description) values('2', 'GBP', ' ');
insert into airbnb.currencies (id_currency, name, description) values('3', 'MYR', ' ');
insert into airbnb.currencies (id_currency, name, description) values('4', 'USD', ' ');

--Tabla de los hosts
create table airbnb.hosts(
	HOST_ID varchar(100) not null, --PK
	HOST_SINCE date null default '4000-01-01',
	HOST_LOCATION varchar(512) null,
	HOST_RESPONSE_TIME varchar(512) null,
	HOST_RESPONSE_RATE int null,
	DESCRIPTION varchar(512) null
);

alter table airbnb.hosts
add constraint hosts_PK primary key (HOST_ID);

-- Carga de datos

insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('17453', '2009-05-17', 'LONDON, ENGLAND, UNITED KINGDOM', '0', '0', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('19854', '2009-06-02', 'BERKELEY, CALIFORNIA, UNITED STATES', 'WITHIN A FEW HOURS', '100', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('31622', '2009-08-14', 'NEW YORK, NEW YORK, UNITED STATES', 'WITHIN A FEW HOURS', '100', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('53526', '2009-11-12', 'MADRID, MADRID, SPAIN', 'WITHIN AN HOUR', '100',  ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('70273', '2010-01-13', 'MADRID, COMMUNITY OF MADRID, SPAIN', 'WITHIN AN HOUR', '100', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('70604', '2010-01-14', 'MADRID, MADRID, SPAIN', 'WITHIN AN HOUR', '100', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('71597', '2010-01-19', 'MADRID, MADRID, SPAIN', 'WITHIN AN HOUR', '100', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('74966', '2010-01-29', 'ESPANA', 'WITHIN AN HOUR', '100', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('75744', '2010-01-31', 'PALMA DE MALLORCA, BALEARIC ISLANDS, SPAIN', 'WITHIN A DAY', '77', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('1647109', '2012-01-24', 'REGION OF MURCIA, SPAIN', 'WITHIN AN HOUR', '100', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('9738650', '2013-10-31', 'MADRID, COMMUNITY OF MADRID, SPAIN', 'WITHIN A FEW HOURS', '100', ' ');
insert into airbnb.hosts (HOST_ID, HOST_SINCE, HOST_LOCATION, HOST_RESPONSE_TIME, HOST_RESPONSE_RATE, DESCRIPTION) values('15258781', '2014-05-08', 'MADRID, COMMUNITY OF MADRID, SPAIN', 'WITHIN A FEW HOURS', '100', ' ');


--Tabla de las condiciones de cancelación
create table airbnb.cancel_policy_type(
	ID_CANCEL_POLICY varchar(100) not null, --PK
	NAME varchar(50) not null,
	DESCRIPTION varchar(512) null
);

alter table airbnb.cancel_policy_type
add constraint cancel_policy_type_PK primary key (ID_CANCEL_POLICY);

-- Carga de datos

insert into airbnb.cancel_policy_type (ID_CANCEL_POLICY, NAME, DESCRIPTION) values('1', 'FLEXIBLE', ' ');
insert into airbnb.cancel_policy_type (ID_CANCEL_POLICY, NAME, DESCRIPTION) values('2', 'MODERATE', ' ');
insert into airbnb.cancel_policy_type (ID_CANCEL_POLICY, NAME, DESCRIPTION) values('3', 'STRICT', ' ');
insert into airbnb.cancel_policy_type (ID_CANCEL_POLICY, NAME, DESCRIPTION) values('4', 'SUPER_STRICT_30', ' ');
insert into airbnb.cancel_policy_type (ID_CANCEL_POLICY, NAME, DESCRIPTION) values('5', 'SUPER_STRICT_60', ' ');




--Tabla de las propiedades
create table airbnb.properties(
	ID_PROPERTY varchar(100) not null, --PK
	HOST_ID varchar(100) not null, --FK
	ZIPCODE varchar(100) null default '0',
	ID_NEIGHBOURHOOD varchar(100) not null, --fK
	LATITUDE DECIMAL(9, 6) not null,
	LONGITUDE DECIMAL(9, 6) not null,
	ID_PROPERTY_TYPE varchar(100) not null, --FK
	ID_ROOM_TYPE varchar(100) not null, --FK
	ACCOMMODATES int not null,
	BATHROOMS decimal not null,
	BEDROOMS int not null,
	BEDS int not null,
	ID_BED_TYPE varchar(100) not null, --FK
	SECURITY_DEPOSIT decimal not null,
	CLEANING_FEE decimal not null,
	GUESTS_INCLUDED int not null,
	EXTRA_PEOPLE int not null,
	MINIMUM_NIGHTS int not null,
	MAXIMUM_NIGHTS int not null,
	ID_CANCEL_POLICY varchar(100) not null, --FK
	FEATURES varchar(512) not null,
	PRICE decimal null default 0,
	ID_CURRENCY varchar(100) null default 1, --FK
	DESCRIPTION varchar(512) null
);


alter table airbnb.properties
add constraint properties_PK primary key (ID_PROPERTY);

alter table airbnb.properties
add constraint properties_neighbourhoods_FK foreign key (ID_NEIGHBOURHOOD)
references airbnb.neighbourhoods(ID_NEIGHBOURHOOD);

alter table airbnb.properties
add constraint properties_hosts_FK foreign key (HOST_ID)
references airbnb.hosts(HOST_ID);

alter table airbnb.properties
add constraint properties_property_type_FK foreign key (ID_PROPERTY_TYPE)
references airbnb.property_type(ID_PROPERTY_TYPE);

alter table airbnb.properties
add constraint properties_room_type_FK foreign key (ID_ROOM_TYPE)
references airbnb.room_type(ID_ROOM_TYPE);

alter table airbnb.properties
add constraint properties_bed_type_FK foreign key (ID_BED_TYPE)
references airbnb.bed_type(ID_BED_TYPE);

alter table airbnb.properties
add constraint properties_cancel_policy_type_FK foreign key (ID_CANCEL_POLICY)
references airbnb.cancel_policy_type(ID_CANCEL_POLICY);

alter table airbnb.properties
add constraint properties_currencies_FK foreign key (ID_CURRENCY)
references airbnb.currencies(ID_CURRENCY);

-- Carga de datos
insert into airbnb.properties (ID_PROPERTY, HOST_ID, ZIPCODE, ID_NEIGHBOURHOOD, LATITUDE, LONGITUDE, ID_PROPERTY_TYPE, ID_ROOM_TYPE, ACCOMMODATES, BATHROOMS, BEDROOMS, BEDS, ID_BED_TYPE, SECURITY_DEPOSIT, CLEANING_FEE, GUESTS_INCLUDED, EXTRA_PEOPLE, MINIMUM_NIGHTS, MAXIMUM_NIGHTS, ID_CANCEL_POLICY, FEATURES, PRICE, ID_CURRENCY) values('18628', '71597', '28004', '64', '40.4247153175373', '-3.69863818770583', '1', '1', '2', '1', '0', '1', '4', '100', '30', '1', '0', '28', '1825', '3', 'HOST HAS PROFILE PIC,IS LOCATION EXACT,REQUIRES LICENSE,INSTANT BOOKABLE', '49', '1');
insert into airbnb.properties (ID_PROPERTY, HOST_ID, ZIPCODE, ID_NEIGHBOURHOOD, LATITUDE, LONGITUDE, ID_PROPERTY_TYPE, ID_ROOM_TYPE, ACCOMMODATES, BATHROOMS, BEDROOMS, BEDS, ID_BED_TYPE, SECURITY_DEPOSIT, CLEANING_FEE, GUESTS_INCLUDED, EXTRA_PEOPLE, MINIMUM_NIGHTS, MAXIMUM_NIGHTS, ID_CANCEL_POLICY, FEATURES, PRICE, ID_CURRENCY) values('19864', '74966', '28012', '50', '40.4134181798486', '-3.70683844591936', '1', '1', '2', '1', '0', '1', '4', '250', '50', '1', '0', '5', '365', '3', 'HOST HAS PROFILE PIC,IS LOCATION EXACT,REQUIRES LICENSE', '80', '1');
insert into airbnb.properties (ID_PROPERTY, HOST_ID, ZIPCODE, ID_NEIGHBOURHOOD, LATITUDE, LONGITUDE, ID_PROPERTY_TYPE, ID_ROOM_TYPE, ACCOMMODATES, BATHROOMS, BEDROOMS, BEDS, ID_BED_TYPE, SECURITY_DEPOSIT, CLEANING_FEE, GUESTS_INCLUDED, EXTRA_PEOPLE, MINIMUM_NIGHTS, MAXIMUM_NIGHTS, ID_CANCEL_POLICY, FEATURES, PRICE, ID_CURRENCY) values('17810037', '19854', '28035', '88', '40.4755647381597', '-3.72735864140159', '1', '1', '6', '1', '0', '4', '5', '500', '49', '2', '9', '5', '1125', '3', 'HOST HAS PROFILE PIC,HOST IDENTITY VERIFIED,IS LOCATION EXACT,REQUIRES LICENSE,INSTANT BOOKABLE', '69', '1');
insert into airbnb.properties (ID_PROPERTY, HOST_ID, ZIPCODE, ID_NEIGHBOURHOOD, LATITUDE, LONGITUDE, ID_PROPERTY_TYPE, ID_ROOM_TYPE, ACCOMMODATES, BATHROOMS, BEDROOMS, BEDS, ID_BED_TYPE, SECURITY_DEPOSIT, CLEANING_FEE, GUESTS_INCLUDED, EXTRA_PEOPLE, MINIMUM_NIGHTS, MAXIMUM_NIGHTS, ID_CANCEL_POLICY, FEATURES, PRICE, ID_CURRENCY) values('6822839', '17453', '28012', '113', '40.4148575388884', '-3.70725343159415', '1', '1', '3', '1', '1', '2', '5', '200', '24', '2', '30', '3', '1125', '3', 'HOST HAS PROFILE PIC,HOST IDENTITY VERIFIED,IS LOCATION EXACT,REQUIRES LICENSE', '90', '1');
insert into airbnb.properties (ID_PROPERTY, HOST_ID, ZIPCODE, ID_NEIGHBOURHOOD, LATITUDE, LONGITUDE, ID_PROPERTY_TYPE, ID_ROOM_TYPE, ACCOMMODATES, BATHROOMS, BEDROOMS, BEDS, ID_BED_TYPE, SECURITY_DEPOSIT, CLEANING_FEE, GUESTS_INCLUDED, EXTRA_PEOPLE, MINIMUM_NIGHTS, MAXIMUM_NIGHTS, ID_CANCEL_POLICY, FEATURES, PRICE, ID_CURRENCY) values('9832499', '1647109', '0', '82', '40.423192717381', '-3.7112486513892', '1', '1', '4', '1', '1', '2', '5', '250', '15', '2', '5', '3', '1900', '3', 'HOST IS SUPERHOST,HOST HAS PROFILE PIC,HOST IDENTITY VERIFIED,REQUIRES LICENSE,INSTANT BOOKABLE', '112', '1');
insert into airbnb.properties (ID_PROPERTY, HOST_ID, ZIPCODE, ID_NEIGHBOURHOOD, LATITUDE, LONGITUDE, ID_PROPERTY_TYPE, ID_ROOM_TYPE, ACCOMMODATES, BATHROOMS, BEDROOMS, BEDS, ID_BED_TYPE, SECURITY_DEPOSIT, CLEANING_FEE, GUESTS_INCLUDED, EXTRA_PEOPLE, MINIMUM_NIGHTS, MAXIMUM_NIGHTS, ID_CANCEL_POLICY, FEATURES, PRICE, ID_CURRENCY) values('1868170', '9738650', '28005', '82', '40.4165139326016', '-3.71784275295469', '1', '1', '8', '3', '3', '4', '5', '200', '20', '6', '40', '3', '1125', '2', 'HOST IS SUPERHOST,HOST HAS PROFILE PIC,HOST IDENTITY VERIFIED,IS LOCATION EXACT,REQUIRES LICENSE', '190', '1');
insert into airbnb.properties (ID_PROPERTY, HOST_ID, ZIPCODE, ID_NEIGHBOURHOOD, LATITUDE, LONGITUDE, ID_PROPERTY_TYPE, ID_ROOM_TYPE, ACCOMMODATES, BATHROOMS, BEDROOMS, BEDS, ID_BED_TYPE, SECURITY_DEPOSIT, CLEANING_FEE, GUESTS_INCLUDED, EXTRA_PEOPLE, MINIMUM_NIGHTS, MAXIMUM_NIGHTS, ID_CANCEL_POLICY, FEATURES, PRICE, ID_CURRENCY) values('6554204', '15258781', '28013', '82', '40.4168339455733', '-3.71023975571296', '1', '2', '2', '2', '1', '1', '5', '0', '15', '1', '5', '10', '1125', '3', 'HOST HAS PROFILE PIC,IS LOCATION EXACT,REQUIRES LICENSE', '30', '1');

--Tabla de los amenities
create table airbnb.amenities(
	ID_PROPERTY varchar(100) not null, --PK / FK
	INTERNET boolean not null,
	AC boolean not null,
	TWENTYFOUR_CHECKING boolean not null,
	WASHER boolean not null,
	SMOKING_ALLOWED boolean not null,
	PETS_ALLOWED boolean not null,
	ELEVATOR_IN_BUILDING boolean not null,
	SECURITY_DEPOSIT_BOOL boolean not null,
	DESCRIPTION varchar(512) null
);

alter table airbnb.amenities
add constraint amenities_PK primary key (ID_PROPERTY);

alter table airbnb.amenities
add constraint amenities_properties_FK foreign key (ID_PROPERTY)
references airbnb.properties(ID_PROPERTY);

-- Carga de datos
insert into airbnb.amenities(ID_PROPERTY, INTERNET, AC, TWENTYFOUR_CHECKING, WASHER, SMOKING_ALLOWED, PETS_ALLOWED, ELEVATOR_IN_BUILDING, SECURITY_DEPOSIT_BOOL, DESCRIPTION) values('3150371',  'TRUE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'FALSE', ' ');
insert into airbnb.amenities(ID_PROPERTY, INTERNET, AC, TWENTYFOUR_CHECKING, WASHER, SMOKING_ALLOWED, PETS_ALLOWED, ELEVATOR_IN_BUILDING, SECURITY_DEPOSIT_BOOL, DESCRIPTION) values('3378181', 'TRUE', 'TRUE', 'FALSE', 'TRUE', 'FALSE', 'FALSE', 'TRUE', 'TRUE', ' ');


--Tabla de las reseñas de los huespedes
create table airbnb.reviews(
	ID_PROPERTY varchar(100) not null, --PK / FK
	LAST_REVIEW date null default '4000-01-01',
	FIRST_REVIEW date null,
	NUMBER_OF_REVIEWS int null default 0,
	REVIEW_SCORES_RATING int null default 0,
	REVIEW_SCORES_ACCURACY int null default 0,
	REVIEW_SCORES_CLEANLINESS int null default 0,
	REVIEW_SCORES_CHECKIN int null default 0,
	REVIEW_SCORES_COMMUNICATION int null default 0,
	REVIEW_SCORES_LOCATION int null default 0,
	REVIEW_SCORES_VALUE int null default 0,
	DESCRIPTION varchar(512) null
);

alter table airbnb.reviews
add constraint reviews_PK primary key (ID_PROPERTY);

alter table airbnb.reviews
add constraint reviews_properties_FK foreign key (ID_PROPERTY)
references airbnb.properties(ID_PROPERTY);
 
-- Carga de datos
insert into airbnb.reviews(ID_PROPERTY, LAST_REVIEW, FIRST_REVIEW, NUMBER_OF_REVIEWS, REVIEW_SCORES_RATING, REVIEW_SCORES_ACCURACY, REVIEW_SCORES_CLEANLINESS, REVIEW_SCORES_CHECKIN, REVIEW_SCORES_COMMUNICATION, REVIEW_SCORES_LOCATION, REVIEW_SCORES_VALUE, DESCRIPTION) values('1868170', '2017-03-26', '2013-12-09', '46', '96', '10', '10', '10', '10', '10', '9',  ' ');
insert into airbnb.reviews(ID_PROPERTY, LAST_REVIEW, FIRST_REVIEW, NUMBER_OF_REVIEWS, REVIEW_SCORES_RATING, REVIEW_SCORES_ACCURACY, REVIEW_SCORES_CLEANLINESS, REVIEW_SCORES_CHECKIN, REVIEW_SCORES_COMMUNICATION, REVIEW_SCORES_LOCATION, REVIEW_SCORES_VALUE, DESCRIPTION) values('6554204', '2015-08-03', '2015-07-01', '3', '67', '8', '5', '10', '10', '10', '7', ' ');


