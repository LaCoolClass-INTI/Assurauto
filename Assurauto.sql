--Création des tables 
create table Client(
id_client int primary key identity,
nom varchar(10) not null,
prenom varchar(10) not null,
date_Naiss date not null ,
adresse varchar (30) not null ,
ville varchar(15),
code_Postal int not null
);

create table Dossier_Sinistre(
numero_dossier varchar (50) primary key,
date_Accident varchar (50) not null,
adresse_Dossier varchar(30) not null,
lieu_Dossier varchar (250) not null ,
code_Postal int not null,
id_client int ,
foreign key (id_client) references Client(id_client)
);


create table Expert(
id_expert int primary key identity,
nom varchar(15) not null,
prenom varchar(15) not null,
num_domicile int not null ,
num_porte int not null,
num_travail int not null
);

create table Expertise(
id_expertise int primary key identity,
nom_lieu varchar(15) not null,
adresse_Expertise varchar(30) not null,
code_Postal_Expertise int not null ,
ville varchar(15) not null,
delai varchar(10) not null,
id_expert int , 
numero_dossier varchar (50),
foreign key (numero_dossier) references Dossier_Sinistre(numero_dossier),
foreign key (id_expert) references Expert(id_expert)
);



create table Vehicule(
immatriculation varchar(15) primary key,
modele_vehicule varchar(15),
nom_assurance varchar(15)
);

create table Contrat(
id_Contrat int primary key identity,
id_client int ,
immatriculation varchar(15),
type_Contrat varchar(15),
date_debut date ,
date_fin date,
foreign key (id_client) references Client(id_Client),
foreign key (immatriculation) references Vehicule (immatriculation)
);

-- Insertion des valeurs

insert into client values ('benjamin','koukou','1976-09-15','3, rue de victor hugo','toulouse',31300);
insert into client values ('ben','kou','1945-09-29','5, rue de hugo','toulouse',31000);
insert into Vehicule values ('A396555','ford Mustang','assurAuto');
insert into Vehicule values ('B255888','ford Raptor','AssurPasAuto');
insert into Contrat values (1,'A396555','tout risque','2021-01-15','2022-01-18');
insert into Contrat values (2,'B255888','tout risque','2021-08-15','2022-09-18');
insert into Expert values ('patrick','dupont','0652525252','2065353535','065959595');
insert into Expert values ('michel','duprut','0654984949','208196415','09651165');
insert into Dossier_Sinistre values ('SIS20020934','2010-02-23','Adresse','Croisement rue de rivoli et rue renard','75000',1);
insert into Expertise values ('Garage ça roule','45 rue rousseau','75002','Paris','15 jours',1,'SIS20020934');

