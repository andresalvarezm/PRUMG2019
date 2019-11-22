/*==============================================================*/
/* TABLE: CANAL                                                 */
/*==============================================================*/
CREATE TABLE CANAL (
   IDCANAL              NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   NOMBRECANAL          VARCHAR2(255)         CONSTRAINT CANAL_NOMBRECANAL_CC CHECK (NOMBRECANAL IN ('DIRECTO','ENLINEA','TELEFONO')) NOT NULL,
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(50)          NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(50)          NOT NULL,
   CONSTRAINT PK_CANAL PRIMARY KEY (IDCANAL)
);

COMMENT ON TABLE CANAL IS
'CANAL_DE_ENTREGA';

/*==============================================================*/
/* TABLE: CLIENTE                                               */
/*==============================================================*/
CREATE TABLE CLIENTE (
   IDCLIENTE            NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDPERSONA            NUMBER(14),
   DPI                  VARCHAR2(20),
   IDESTADO             NUMBER(14),
   CONSTRAINT PK_CLIENTE PRIMARY KEY (IDCLIENTE)
);

/*==============================================================*/
/* TABLE: COLONIA                                               */
/*==============================================================*/
CREATE TABLE COLONIA (
   IDCOLONIA            NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDMUNICIPIO          NUMBER(14)            NOT NULL,
   COLONIA              VARCHAR2(50)          NOT NULL,
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(100)         NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100)         NOT NULL,
   CONSTRAINT PK_COLONIA PRIMARY KEY (IDCOLONIA)
);

/*==============================================================*/
/* TABLE: DEPARTAMENTO                                          */
/*==============================================================*/
CREATE TABLE DEPARTAMENTO (
   IDDEPARTAMENTO       NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDPAIS               NUMBER(14)            NOT NULL,
   DEPARTAMENTO         VARCHAR2(50),
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(100)         NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100)         NOT NULL,
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (IDDEPARTAMENTO, DEPARTAMENTO)
);

/*==============================================================*/
/* TABLE: DIRECCION                                             */
/*==============================================================*/
CREATE TABLE DIRECCION (
   IDDIRECCION          NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDZONA               NUMBER(14),
   IDCOLONIA            NUMBER(14),
   IDMUNICIPIO          NUMBER(14),
   CALLE_AVENIDA        VARCHAR2(50),
   NUMERO               VARCHAR2(50),
   EDIFICIO             VARCHAR2(50),
   CONSTRAINT PK_DIRECCION PRIMARY KEY (IDDIRECCION)
);

/*==============================================================*/
/* TABLE: DIRECCION_PERSONA                                     */
/*==============================================================*/
CREATE TABLE DIRECCION_PERSONA (
   IDPERSONA            NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   DPI                  VARCHAR2(20)          NOT NULL,
   IDDIRECCION          NUMBER(14)            NOT NULL,
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(100)         NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100)         NOT NULL
);

/*==============================================================*/
/* TABLE: EMPLEADO                                              */
/*==============================================================*/
CREATE TABLE EMPLEADO (
   FECHAINGRESO         DATE,
   IDEMPLEADO           NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDPERSONA            NUMBER(14),
   DPI                  VARCHAR2(20),
   IDESTADO             NUMBER(5),
   IDESPECIALIDADES     NUMBER(14),
   FECHASALIDA          DATE,
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(100)         NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100)         NOT NULL,
   CONSTRAINT PK_EMPLEADO PRIMARY KEY (IDEMPLEADO)
);

/*==============================================================*/
/* TABLE: ESPECIALIDADES                                        */
/*==============================================================*/
CREATE TABLE ESPECIALIDADES (
   IDESPECIALIDADES     NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   ESPECIALIDADES       VARCHAR2(50),
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(100)         NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100)         NOT NULL,
   CONSTRAINT PK_ESPECIALIDADES PRIMARY KEY (IDESPECIALIDADES)
);

/*==============================================================*/
/* TABLE: ESTADO                                                */
/*==============================================================*/
CREATE TABLE ESTADO (
   IDESTADO             NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   ESTADO               VARCHAR2(50),
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(100)         NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100)         NOT NULL,
   CONSTRAINT PK_ESTADO PRIMARY KEY (IDESTADO)
);

/*==============================================================*/
/* TABLE: FACTURA                                               */
/*==============================================================*/
CREATE TABLE FACTURA (
   NOFACTURA            NUMBER(14)            NOT NULL,
   IDVENTA              NUMBER(14)            NOT NULL,
   NO_PAGO              NUMBER(14),
   FECHA                DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(50)          NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(50)          NOT NULL,
   CONSTRAINT PK_FACTURA PRIMARY KEY (NOFACTURA, IDVENTA)
);

/*==============================================================*/
/* TABLE: MODO_PAGO                                             */
/*==============================================================*/
CREATE TABLE MODO_PAGO (
   NO_PAGO              NUMBER(14)            NOT NULL,
   NOMBRE               VARCHAR2(50)          NOT NULL,
   OTRODETALLE          VARCHAR2(100)         NOT NULL,
   CONSTRAINT PK_MODO_PAGO PRIMARY KEY (NO_PAGO)
);

/*==============================================================*/
/* TABLE: MUNICIPIO                                             */
/*==============================================================*/
CREATE TABLE MUNICIPIO (
   IDMUNICIPIO          NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDDEPARTAMENTO       NUMBER(14),
   DEP_IDPAIS           NUMBER(14),
   IDPAIS               NUMBER(14),
   MUNICIPIO            VARCHAR2(50),
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(100)         NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100)         NOT NULL,
   CONSTRAINT PK_MUNICIPIO PRIMARY KEY (IDMUNICIPIO, MUNICIPIO)
);

/*==============================================================*/
/* TABLE: PAIS                                                  */
/*==============================================================*/
CREATE TABLE PAIS (
   IDPAIS               NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   PAIS                 VARCHAR2(50),
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(100)         NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100)         NOT NULL,
   CONSTRAINT PK_PAIS PRIMARY KEY (IDPAIS, PAIS)
);

/*==============================================================*/
/* TABLE: PERSONA                                               */
/*==============================================================*/
CREATE TABLE PERSONA (
   IDPERSONA            NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   NOMBRE1              VARCHAR2(60)          NOT NULL,
   NOMBRE2              VARCHAR2(60)          NOT NULL,
   NOMBRE3              VARCHAR2(60)          NOT NULL,
   APELLIDO1            VARCHAR2(60)          NOT NULL,
   APELLIDO2            VARCHAR2(60)          NOT NULL,
   APECASADA            VARCHAR2(60)          NOT NULL,
   FECHA_NACIMIENTO     DATE                  NOT NULL,
   GENERO               VARCHAR2(1)           NOT NULL,
   TIPOSANGRE           VARCHAR2(5)           NOT NULL,
   TELEFONO             NUMBER(8)             NOT NULL,
   EMAIL                VARCHAR2(60)          NOT NULL,
   ESTADOCIVIL          VARCHAR2(20)          NOT NULL,
   DPI                  VARCHAR2(20)          NOT NULL,
   NIT                  VARCHAR2(20)          NOT NULL,
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(50)          NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(50)          NOT NULL,
   CONSTRAINT PK_PERSONA PRIMARY KEY (IDPERSONA, DPI)
);

/*==============================================================*/
/* TABLE: PRODUCTO                                              */
/*==============================================================*/
CREATE TABLE PRODUCTO (
   IDPRODUCTO           NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   NOMBREPRODUCTO       VARCHAR2(50)          NOT NULL,
   STOCK                NUMBER(14)            NOT NULL,
   DESCRIPCION          VARCHAR2(200)         NOT NULL,
   SKU                  VARCHAR2(30)          NOT NULL,
   UNIDAD               NUMBER(14)            NOT NULL,
   PRECIOUNIDAD         NUMBER(14,2)          NOT NULL,
   CONSTRAINT PK_PRODUCTO PRIMARY KEY (IDPRODUCTO, NOMBREPRODUCTO)
);

/*==============================================================*/
/* TABLE: PROMOCION                                             */
/*==============================================================*/
CREATE TABLE PROMOCION (
   IDPROMO              NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   NOMBREPROMO          VARCHAR2(100)         NOT NULL,
   CODIGO               VARCHAR2(10)          NOT NULL,
   FECHAINICIO          DATE                  NOT NULL,
   FECHAFIN             DATE                  NOT NULL,
   PRORCENTAJEPROMO     VARCHAR2(50)          NOT NULL,
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(50)          NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(50)          NOT NULL,
   CONSTRAINT PK_PROMOCION PRIMARY KEY (IDPROMO)
);

/*==============================================================*/
/* TABLE: SUCURSAL                                              */
/*==============================================================*/
CREATE TABLE SUCURSAL (
   IDSUCURSAL           NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   SUCURSAL             VARCHAR2(100)         NOT NULL,
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(50)           NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(50)          NOT NULL,
   CONSTRAINT PK_SUCURSAL PRIMARY KEY (IDSUCURSAL)
);

/*==============================================================*/
/* TABLE: USUARIO                                               */
/*==============================================================*/
CREATE TABLE USUARIO (
   IDUSUARIO            NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDEMPLEADO           NUMBER(14),
   IDSUCURSAL           NUMBER(14),
   USUARIO              VARCHAR2(50)          NOT NULL,
   PW                   VARCHAR2(50)          NOT NULL,
   CONSTRAINT PK_USUARIO PRIMARY KEY (IDUSUARIO)
);

/*==============================================================*/
/* TABLE: VENTA                                                 */
/*==============================================================*/
CREATE TABLE VENTA (
   IDVENTA              NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDPRODUCTO           NUMBER(14),
   NOMBREPRODUCTO       VARCHAR2(50),
   IDPROMO              NUMBER(14),
   IDCANAL              NUMBER(14),
   IDCLIENTE            NUMBER(14),
   FECHAVENTA           DATE                  NOT NULL,
   CANTIDAD             NUMBER(14)            NOT NULL,
   PRECIOUNIDAD         NUMBER(14,2)          NOT NULL,
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(50)          NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(50)          NOT NULL,
   CONSTRAINT PK_VENTA PRIMARY KEY (IDVENTA)
);

/*==============================================================*/
/* TABLE: ZONA                                                  */
/*==============================================================*/
CREATE TABLE ZONA (
   IDZONA               NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDMUNICIPIO          NUMBER(14),
   ZONA                 NUMBER(5),
   CREADO               DATE                  NOT NULL,
   CREADO_POR           VARCHAR2(100)         NOT NULL,
   ACTUALIZADO          DATE                  NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100)         NOT NULL,
   CONSTRAINT PK_ZONA PRIMARY KEY (IDZONA)
);

ALTER TABLE CLIENTE
   ADD CONSTRAINT FK_CLIENTE_REFERENCE_PERSONA FOREIGN KEY (IDPERSONA, DPI)
      REFERENCES PERSONA (IDPERSONA, DPI);

ALTER TABLE CLIENTE
   ADD CONSTRAINT FK_CLIENTE_REFERENCE_ESTADO FOREIGN KEY (IDESTADO)
      REFERENCES ESTADO (IDESTADO);

ALTER TABLE COLONIA
   ADD CONSTRAINT FK_COLONIA_REFERENCE_MUNICIPI FOREIGN KEY (IDMUNICIPIO)
      REFERENCES MUNICIPIO (IDMUNICIPIO);

ALTER TABLE DEPARTAMENTO
   ADD CONSTRAINT FK_DEPARTAM_REFERENCE_PAIS FOREIGN KEY (IDPAIS)
      REFERENCES PAIS (IDPAIS);

ALTER TABLE DIRECCION
   ADD CONSTRAINT FK_DIRECCIO_REFERENCE_COLONIA FOREIGN KEY (IDCOLONIA)
      REFERENCES COLONIA (IDCOLONIA);

ALTER TABLE DIRECCION
   ADD CONSTRAINT FK_DIRECCIO_REFERENCE_MUNICIPI FOREIGN KEY (IDMUNICIPIO)
      REFERENCES MUNICIPIO (IDMUNICIPIO);

ALTER TABLE DIRECCION
   ADD CONSTRAINT FK_DIRECCIO_REFERENCE_ZONA FOREIGN KEY (IDZONA)
      REFERENCES ZONA (IDZONA);

ALTER TABLE DIRECCION_PERSONA
   ADD CONSTRAINT FK_DIRECCIO_REFERENCE_DIRECCIO FOREIGN KEY (IDDIRECCION)
      REFERENCES DIRECCION (IDDIRECCION);

ALTER TABLE DIRECCION_PERSONA
   ADD CONSTRAINT FK_DIRECCIO_REFERENCE_PERSONA FOREIGN KEY (IDPERSONA, DPI)
      REFERENCES PERSONA (IDPERSONA, DPI);

ALTER TABLE EMPLEADO
   ADD CONSTRAINT FK_EMPLEADO_REFERENCE_ESPECIAL FOREIGN KEY (IDESPECIALIDADES)
      REFERENCES ESPECIALIDADES (IDESPECIALIDADES);

ALTER TABLE EMPLEADO
   ADD CONSTRAINT FK_EMPLEADO_REFERENCE_ESTADO FOREIGN KEY (IDESTADO)
      REFERENCES ESTADO (IDESTADO);

ALTER TABLE EMPLEADO
   ADD CONSTRAINT FK_EMPLEADO_REFERENCE_PERSONA FOREIGN KEY (IDPERSONA, DPI)
      REFERENCES PERSONA (IDPERSONA, DPI);

ALTER TABLE FACTURA
   ADD CONSTRAINT FK_FACTURA_REFERENCE_VENTA FOREIGN KEY (IDVENTA)
      REFERENCES VENTA (IDVENTA);

ALTER TABLE FACTURA
   ADD CONSTRAINT FK_FACTURA_REFERENCE_MODO_PAG FOREIGN KEY (NO_PAGO)
      REFERENCES MODO_PAGO (NO_PAGO);

ALTER TABLE MUNICIPIO
   ADD CONSTRAINT FK_MUNICIPI_REFERENCE_DEPARTAM FOREIGN KEY (IDDEPARTAMENTO, DEP_IDPAIS)
      REFERENCES DEPARTAMENTO (IDDEPARTAMENTO, IDPAIS);

ALTER TABLE MUNICIPIO
   ADD CONSTRAINT FK_MUNICIPI_REFERENCE_PAIS FOREIGN KEY (IDPAIS)
      REFERENCES PAIS (IDPAIS);

ALTER TABLE USUARIO
   ADD CONSTRAINT FK_USUARIO_REFERENCE_EMPLEADO FOREIGN KEY (IDEMPLEADO)
      REFERENCES EMPLEADO (IDEMPLEADO);

ALTER TABLE USUARIO
   ADD CONSTRAINT FK_USUARIO_REFERENCE_SUCURSAL FOREIGN KEY (IDSUCURSAL)
      REFERENCES SUCURSAL (IDSUCURSAL);

ALTER TABLE VENTA
   ADD CONSTRAINT FK_VENTA_REFERENCE_PRODUCTO FOREIGN KEY (IDPRODUCTO, NOMBREPRODUCTO)
      REFERENCES PRODUCTO (IDPRODUCTO, NOMBREPRODUCTO);

ALTER TABLE VENTA
   ADD CONSTRAINT FK_VENTA_REFERENCE_PROMOCIO FOREIGN KEY (IDPROMO)
      REFERENCES PROMOCION (IDPROMO);

ALTER TABLE VENTA
   ADD CONSTRAINT FK_VENTA_REFERENCE_CANAL FOREIGN KEY (IDCANAL)
      REFERENCES CANAL (IDCANAL);

ALTER TABLE VENTA
   ADD CONSTRAINT FK_VENTA_REFERENCE_CLIENTE FOREIGN KEY (IDCLIENTE)
      REFERENCES CLIENTE (IDCLIENTE);

ALTER TABLE ZONA
   ADD CONSTRAINT FK_ZONA_REFERENCE_MUNICIPI FOREIGN KEY (IDMUNICIPIO)
      REFERENCES MUNICIPIO (IDMUNICIPIO);