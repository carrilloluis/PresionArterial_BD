/*
@description Lecturas de la Presión Arterial en pacientes con hipertensión arterial.
@author Luis Carrillo Gutiérrez
@date Diciembre, 2017
@version 0.0.1
*/
-- HospitalPrimario
DROP TABLE IF EXISTS [Centro de Atención];
CREATE TABLE IF NOT EXISTS [Centro de Atención]
(
	[id] INTEGER NOT NULL PRIMARY KEY,
	[denominación] VARCHAR(128) NOT NULL
) WITHOUT ROWID;

DROP TABLE IF EXISTS [Programa de Salud];
CREATE TABLE IF NOT EXISTS [Programa de Salud]
(
	[id] INTEGER NOT NULL PRIMARY KEY,
	[id hospital] INTEGER NOT NULL REFERENCES [Centro de Atención](id),
	[denominación] VARCHAR(128) NOT NULL
) WITHOUT ROWID;

DROP TABLE IF EXISTS [Paciente];
CREATE TABLE IF NOT EXISTS [Paciente]
(
	[id] INTEGER NOT NULL PRIMARY KEY,
	[id programa de salud] INTEGER NOT NULL REFERENCES [Programa de Salud](id),
	[nombre y apellidos] VARCHAR(128) NOT NULL,
	[fecha de nacimiento] DATE NOT NULL,
	[género] CHAR(1) NOT NULL
) WITHOUT ROWID;

-- Control / Medición / Lectura de la ...
DROP TABLE IF EXISTS [Presión Arterial];
CREATE TABLE IF NOT EXISTS [Presión Arterial]
(
	[id] INTEGER NOT NULL PRIMARY KEY,
	[id paciente] INTEGER NOT NULL REFERENCES [Paciente](id),
	[fecha y hora] DATETIME NOT NULL,
	[brazo] CHAR(1) NOT NULL DEFAULT '0', -- DRCH IZQ > ENUM(0, 1),
	[posición] CHAR(1) NOT NULL DEFAULT '0', -- de cúbito/sentado > ENUM(0, 1) 
	[presión arterial sistólica] INTEGER NOT NULL, 
	[presión arterial diastólica] INTEGER NOT NULL
) WITHOUT ROWID;
