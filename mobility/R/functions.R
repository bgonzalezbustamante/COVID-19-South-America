## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Script ID ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Mobility and COVID-19 in South America Functions
## R version 4.0.2 (2020-06-22) -- "Taking Off Again"
## Date: March-April 2021

## Bastián González-Bustamante (University of Oxford, UK)
## E-mail: bastian.gonzalezbustamante@politics.ox.ac.uk
## https://bgonzalezbustamante.com/

## COVID-19 Pandemic in South America Project
## OSF-Project DOI: 10.17605/OSF.IO/6FM7X
## http://bgonzalezbustamante.github.io/COVID-19-South-America/

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#### Functions ####

## +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

## Integer Function
is.integer0 <- function(x)
{
  is.integer(x) && length(x) == 0L
}

## Poverty in Argentina
## GitHub Repository ~/tree/master/docs/poverty-sources/ARG
mean_poverty_ARG <- 40.9
f.poverty.ARG <- function(x)
{ if(is.integer0(x)){
  print(NA)
} else if(x == "Buenos Aires"){
  print(17.3)
} else if(x == "Buenos Aires Province"){
  print(47.5)
} else if(x == "Catamarca Province"){
  print(35.2)
} else if(x == "Chaco Province"){
  print(NA)
} else if(x == "Chubut Province"){
  print(NA)
} else if(x == "Cordoba"){
  print(40.7)
} else if(x == "Corrientes"){
  print(41.2)
} else if(x == "Entre Rios"){
  print(NA)
} else if(x == "Formosa Province"){
  print(42.4)
} else if(x == "Jujuy"){
  print(38)
} else if(x == "La Pampa"){
  print(NA)
} else if(x == "La Rioja Province"){
  print(29.8)
} else if(x == "Mendoza Province"){
  print(41.5)
} else if(x == "Misiones Province"){
  print(NA)
} else if(x == "Neuquen"){
  print(NA)
} else if(x == "Rio Negro"){
  print(NA)
} else if(x == "Salta Province"){
  print(45.5)
} else if(x == "San Juan Province"){
  print(35.8)
} else if(x == "San Luis Province"){
  print(39.2)
} else if(x == "Santa Cruz Province"){
  print(NA)
} else if(x == "Santa Fe Province"){
  print(42.6)
} else if(x == "Santiago del Estero Province"){
  print(42.9)
} else if(x == "Tierra del Fuego Province"){
  print(NA)
} else if(x == "Tucuman"){
  print(41.5)
} else {
  print(NA)
}}

## Poverty in Chile
## GitHub Repository ~/tree/master/docs/poverty-sources/CHL
mean_poverty_CHL <- 8.6
f.poverty.CHL <- function(x)
{ if(is.integer0(x)){
  print(NA)
} else if(x == "Arica y Parinacota"){
  print(8.4)
} else if(x == "Tarapacá"){
  print(6.4)
} else if(x == "Antofagasta"){
  print(5.1)
} else if(x == "Atacama"){
  print(7.9)
} else if(x == "Coquimbo"){
  print(11.9)
} else if(x == "Valparaíso"){
  print(7.1)
} else if(x == "Santiago Metropolitan Region"){
  print(5.4)
} else if(x == "O'Higgins"){
  print(10.1)
} else if(x == "Maule"){
  print(12.7)
} else if(x == "Ñuble"){
  print(16.1)
} else if(x == "Bio Bio"){
  print(12.3)
} else if(x == "Araucania"){
  print(17.2)
} else if(x == "Los Ríos"){
  print(12.1)
} else if(x == "Los Lagos"){
  print(11.7)
} else if(x == "Aysén"){
  print(4.6)
} else if(x == "Magallanes and Chilean Antarctica"){
  print(2.1)
} else {
  print(NA)
}}

## Multidimensional Poverty in Chile
## GitHub Repository ~/tree/master/docs/poverty-sources/CHL
mean_multi_CHL <- 20.7
f.multi.CHL <- function(x)
{ if(is.integer0(x)){
  print(NA)
} else if(x == "Arica y Parinacota"){
  print(21.8)
} else if(x == "Tarapacá"){
  print(24.9)
} else if(x == "Antofagasta"){
  print(16.4)
} else if(x == "Atacama"){
  print(23.2)
} else if(x == "Coquimbo"){
  print(22.6)
} else if(x == "Valparaíso"){
  print(19)
} else if(x == "Santiago Metropolitan Region"){
  print(20)
} else if(x == "O'Higgins"){
  print(18.5)
} else if(x == "Maule"){
  print(22.5)
} else if(x == "Ñuble"){
  print(24.7)
} else if(x == "Bio Bio"){
  print(17.4)
} else if(x == "Araucania"){
  print(28.5)
} else if(x == "Los Ríos"){
  print(22.2)
} else if(x == "Los Lagos"){
  print(25.5)
} else if(x == "Aysén"){
  print(19)
} else if(x == "Magallanes and Chilean Antarctica"){
  print(10.8)
} else {
  print(NA)
}}

## Poverty in Colombia
## GitHub Repository ~/tree/master/docs/poverty-sources/COL
mean_poverty_COL <- 35.7
f.poverty.COL <- function(x)
{ if(is.integer0(x)){
  print(NA)
} else if(x == "Amazonas"){
  print(NA)
} else if(x == "Antioquia"){
  print(29.8)
} else if(x == "Arauca"){
  print(NA)
} else if(x == "Atlantico"){
  print(27.3)
} else if(x == "Bogota"){
  print(27.2)
} else if(x == "Bolivar"){
  print(46)
} else if(x == "Boyaca"){
  print(NA)
} else if(x == "Caldas"){
  print(28.7)
} else if(x == "Caqueta"){
  print(48.8)
} else if(x == "Casanare"){
  print(NA)
} else if(x == "Cauca"){
  print(59.6)
} else if(x == "Cesar"){
  print(51.7)
} else if(x == "Choco"){
  print(68.4)
} else if(x == "Cordoba"){
  print(54.2)
} else if(x == "Cundinamarca"){
  print(20.4)
} else if(x == "Guaviare"){
  print(NA)
} else if(x == "Huila"){
  print(51.2)
} else if(x == "La Guajira"){
  print(61.8)
} else if(x == "Magdalena"){
  print(53.5)
} else if(x == "Meta"){
  print(32.7)
} else if(x == "Narino"){
  print(51)
} else if(x == "North Santander"){
  print(51.9)
} else if(x == "Putamayo"){
  print(NA)
} else if(x == "Risaralda"){
  print(28.7)
} else if(x == "San Andres and Providencia"){
  print(NA)
} else if(x == "Santander"){
  print(31.1)
} else if(x == "Sucre"){
  print(50.3)
} else if(x == "Tolima"){
  print(39.3)
} else if(x == "Valle del Cauca"){
  print(24)
} else if(x == "Vichada"){
  print(NA)
} else {
  print(NA)
}}

## Poverty in Peru
## GitHub Repository ~/tree/master/docs/poverty-sources/PER
mean_poverty_PER <- 16.0020707435589
f.poverty.PER <- function(x)
{ if(is.integer0(x)){
  print(NA)
} else if(x == "Amazonas"){
  print(30.1724485103745)
} else if(x == "Ancash"){
  print(17.2014035176195)
} else if(x == "Apurimac"){
  print(11.3483419932819)
} else if(x == "Arequipa"){
  print(10.5929218558695)
} else if(x == "Ayacucho"){
  print(19.1847914434206)
} else if(x == "Cajamarca"){
  print(17.1953111040605)
} else if(x == "Callao Region"){
  print(5.11481472685651)
} else if(x == "Cusco"){
  print(13.546762877841)
} else if(x == "Huancavelica"){
  print(20.5397542865539)
} else if(x == "Huanuco"){
  print(23.8404272441335)
} else if(x == "Ica"){
  print(8.96345334783655)
} else if(x == "Junin"){
  print(23.1032758602094)
} else if(x == "La Libertad"){
  print(10.1432418346883)
} else if(x == "Lambayeque"){
  print(10.2376802573772)
} else if(x == "Lima Region"){
  print(15.4991405118145)
} else if(x == "Loreto"){
  print(52.4256305274022)
} else if(x == "Madre de Dios"){
  print(23.2150761977107)
} else if(x == "Metropolitan Municipality of Lima"){
  print(8.80510784789396)
} else if(x == "Moquegua"){
  print(10.9651994187931)
} else if(x == "Pasco"){
  print(29.896691812666)
} else if(x == "Piura"){
  print(22.3131259897851)
} else if(x == "Puno"){
  print(20.8666595807204)
} else if(x == "San Martin"){
  print(29.0546286229956)
} else if(x == "Tacna"){
  print(7.48157860009444)
} else if(x == "Tumbes"){
  print(20.7392401397941)
} else if(x == "Ucayali"){
  print(43.447542619887)
} else {
  print(NA)
}}
