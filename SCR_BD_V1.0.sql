/*==============================================================*/
/* TABLE: COLONIA                                               */
/*==============================================================*/
CREATE TABLE COLONIA (
   IDCOLONIA            NUMBER(14) GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDMUNICIPIO          NUMBER(14) NOT NULL,
   COLONIA              VARCHAR2(50) NOT NULL,
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_COLONIA PRIMARY KEY (IDCOLONIA)
);

/*==============================================================*/
/* TABLE: DEPARTAMENTO                                          */
/*==============================================================*/
CREATE TABLE DEPARTAMENTO (
   IDDEPARTAMENTO       NUMBER(14)            GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDPAIS               NUMBER(14)             NOT NULL,
   DEPARTAMENTO         VARCHAR2(50) NOT NULL,
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL,   
   CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (IDDEPARTAMENTO, DEPARTAMENTO)
);

/*==============================================================*/
/* TABLE: DIRECCION                                             */
/*==============================================================*/
CREATE TABLE DIRECCION (
   IDDIRECCION          NUMBER(14)            GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
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
   IDPERSONA            NUMBER(14),
   IDDIRECCION          NUMBER(14),
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL
);

/*==============================================================*/
/* TABLE: EMPLEADO                                              */
/*==============================================================*/
CREATE TABLE EMPLEADO (
   FECHAINGRESO         DATE,
   IDEMPLEADO           NUMBER(14)            GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDPERSONA            NUMBER(14),
   IDESTADO             NUMBER(5),
   IDESPECIALIDADES     NUMBER(14),
   FECHASALIDA          DATE,
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL, 
   CONSTRAINT PK_EMPLEADO PRIMARY KEY (IDEMPLEADO)
);

/*==============================================================*/
/* TABLE: ESPECIALIDADES                                        */
/*==============================================================*/
CREATE TABLE ESPECIALIDADES (
   IDESPECIALIDADES     NUMBER(14)            GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   ESPECIALIDADES       VARCHAR2(50),
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_ESPECIALIDADES PRIMARY KEY (IDESPECIALIDADES)
);

/*==============================================================*/
/* TABLE: ESTADO                                                */
/*==============================================================*/
CREATE TABLE ESTADO (
   IDESTADO             NUMBER(14)             GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   ESTADO               VARCHAR2(50),
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_ESTADO PRIMARY KEY (IDESTADO)
);

/*==============================================================*/
/* TABLE: MUNICIPIO                                             */
/*==============================================================*/
CREATE TABLE MUNICIPIO (
   IDMUNICIPIO          NUMBER(14)            GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDDEPARTAMENTO       NUMBER(14),
   DEP_IDPAIS           NUMBER(14),
   IDPAIS               NUMBER(14),
   MUNICIPIO            VARCHAR2(50) NOT NULL,
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_MUNICIPIO PRIMARY KEY (IDMUNICIPIO, MUNICIPIO)
);

/*==============================================================*/
/* TABLE: PAIS                                                  */
/*==============================================================*/
CREATE TABLE PAIS (
   IDPAIS               NUMBER(14)             GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   PAIS                 VARCHAR2(50) NOT NULL,
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_PAIS PRIMARY KEY (IDPAIS, PAIS)
);

/*==============================================================*/
/* TABLE: PERSONA                                               */
/*==============================================================*/
CREATE TABLE PERSONA (
   IDPERSONA            NUMBER(14)            GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDTIPOSANGRE         NUMBER(14),
   NOMBRE1              VARCHAR2(60),
   NOMBRE2              VARCHAR2(60),
   NOMBRE3              VARCHAR2(60),
   APELLIDO1            VARCHAR2(60),
   APELLIDO2            VARCHAR2(60),
   APECASADA            VARCHAR2(60),
   FECHA_NACIMIENTO     DATE,
   GENERO               VARCHAR2(1),
   TIPOSANGRE           VARCHAR2(5),
   TELEFONO             NUMBER(8),
   EMAIL                VARCHAR2(60),
   ESTADOCIVIL          VARCHAR2(20),
   DPI                  VARCHAR2(20) NOT NULL,
   NIT                  VARCHAR2(20),
   CONSTRAINT PK_PERSONA PRIMARY KEY (IDPERSONA, DPI)
);

/*==============================================================*/
/* TABLE: TIPO_SANGRE                                           */
/*==============================================================*/
CREATE TABLE TIPO_SANGRE (
   IDTIPOSANGRE         NUMBER(14)             GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   TIPOSANGRE           VARCHAR2(5),
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_TIPO_SANGRE PRIMARY KEY (IDTIPOSANGRE)
);

/*==============================================================*/
/* TABLE: ZONA                                                  */
/*==============================================================*/
CREATE TABLE ZONA (
   IDZONA               NUMBER(14)            GENERATED  ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20  NOORDER  NOCYCLE  NOT NULL ENABLE,
   IDMUNICIPIO          NUMBER(14),
   ZONA                 NUMBER(5),
   CREADO               DATE NOT NULL,
   CREADO_POR           VARCHAR2(100) NOT NULL,
   ACTUALIZADO          DATE NOT NULL,
   ACTUALIZADO_POR      VARCHAR2(100) NOT NULL,
   CONSTRAINT PK_ZONA PRIMARY KEY (IDZONA)
);


/*==============================================================*/
/* TABLE: BITACORA                                              */
/*==============================================================*/
CREATE TABLE BITACORA (
	FECHA				DATE,
	USUARIO				VARCHAR2(50),
	NOMBRE_TABLA		VARCHAR2(100),
	NOMBRE_CAMPO		VARCHAR2(100),
	LLAVE				VARCHAR2(50),
	VALOR_ANTERIOR		VARCHAR2(100),
	VALOR_NUEVO			VARCHAR2(100),
	OBSERVACIONES		VARCHAR2(200)
);

