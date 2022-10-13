create database demo;

use demo;

create table if not exists pagos
(
    id_pago        int auto_increment
        primary key,
    concepto       varchar(100) null,
    cantidad       int          null,
    usuario_mov    varchar(70)  null,
    cliente_pagado varchar(100) null,
    monto_pago     double       null,
    estatus_pago   varchar(50)  null
);

INSERT INTO pagos values ('PAGO DE NOMINA',3,'ADMIN','Manuel Morales',3550.45,'Rechazado');
INSERT INTO pagos values ('PAGO DE NOMINA',4,'ADMIN','Manuel Morales',3550.45,'Pendiente');
INSERT INTO pagos values ('PAGO DE NOMINA',5,'ADMIN','Manuel Morales',3550.45,'Pagado');
INSERT INTO pagos values ('PAGO DE NOMINA',6,'ADMIN','Manuel Morales',3550.45,'Rechazado');
INSERT INTO pagos values ('PAGO DE NOMINA',7,'ADMIN','Manuel Morales',3550.45,'Pendiente');
INSERT INTO pagos values ('PAGO DE NOMINA',8,'ADMIN','Manuel Morales',3550.45,'Pagado');
INSERT INTO pagos values ('PAGO DE NOMINA',9,'ADMIN','Manuel Morales',3550.45,'Rechazado');
INSERT INTO pagos values ('PAGO DE NOMINA',10,'ADMIN','Manuel Morales',3550.45,'Pendiente');
INSERT INTO pagos values ('PAGO DE NOMINA',11,'ADMIN','Manuel Morales',3550.45,'Pagado');
INSERT INTO pagos values ('PAGO DE NOMINA',12,'ADMIN','Manuel Morales',3550.45,'Rechazado');
commit;

