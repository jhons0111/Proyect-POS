USE [ElectronPOS]
GO
/****** Object:  StoredProcedure [dbo].[BodegaTieneMovimientos]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BodegaTieneMovimientos]
(
	@IDBodega int
)
AS
	SET NOCOUNT ON;
SELECT TOP 1 1 FROM Kardex WHERE IDBodega = @IDBodega


GO
/****** Object:  StoredProcedure [dbo].[CambioClave]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CambioClave]
(
	@Clave nvarchar(10),
	@FechaModificacionClave date,
	@IDUsuario nvarchar(10)
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Usuario] SET 
[Clave] = @Clave, 
[FechaModificacionClave] = @FechaModificacionClave 
WHERE [IDUsuario] = @IDUsuario



GO
/****** Object:  StoredProcedure [dbo].[DeleteBarra]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBarra]
(
	@Barra bigint
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Barra] WHERE [Barra] = @Barra


GO
/****** Object:  StoredProcedure [dbo].[DeleteBarraByIDProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBarraByIDProducto]
(
	@IDProducto int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Barra] WHERE [IDProducto] = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[DeleteBodega]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBodega]
(
	@IDBodega int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Bodega] WHERE [IDBodega] = @IDBodega


GO
/****** Object:  StoredProcedure [dbo].[DeleteBodegaProductoByIDProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBodegaProductoByIDProducto]
(
	@IDProducto int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[BodegaProducto] WHERE [IDProducto] = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[DeleteCliente]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCliente]
(
	@IDCliente int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Cliente] WHERE [IDCliente] = @IDCliente


GO
/****** Object:  StoredProcedure [dbo].[DeleteProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProducto]
(
	@IDProducto int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Producto] WHERE [IDProducto] = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[DeleteProveedor]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProveedor]
(
	@IDProveedor int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Proveedor] WHERE [IDProveedor] = @IDProveedor


GO
/****** Object:  StoredProcedure [dbo].[DisminuirStock]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DisminuirStock]
(
	@Cantidad float,
	@IDBodega int,
	@IDProducto int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[BodegaProducto] SET 
[Stock] = [Stock] - @Cantidad
WHERE [IDBodega] = @IDBodega AND [IDProducto] = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[ExisteMedida]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteMedida]
(
	@IDMedida nvarchar(2)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM Medida WHERE IDMedida = @IDMedida


GO
/****** Object:  StoredProcedure [dbo].[ExisteUsuario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExisteUsuario]
(
	@IDUsuario nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM Usuario WHERE IDUsuario = @IDUsuario


GO
/****** Object:  StoredProcedure [dbo].[GetBodegaInventario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBodegaInventario]
(
	@IDIventario int
)
AS
	SET NOCOUNT ON;
SELECT IDBodega FROM Inventario WHERE IDIventario = @IDIventario


GO
/****** Object:  StoredProcedure [dbo].[GetBodegaProductoByIDBodegaAndIDProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBodegaProductoByIDBodegaAndIDProducto]
(
	@IDBodega int,
	@IDProducto int
)
AS
	SET NOCOUNT ON;
SELECT IDBodega, IDProducto, Stock, Minimo, Maximo, DiasReposicion, CantidadMinima 
FROM dbo.BodegaProducto
WHERE IDBodega = @IDBodega AND IDProducto = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[GetClienteByIDTipoDocumentoAndDocumento]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClienteByIDTipoDocumentoAndDocumento]
(
	@IDTipoDocumento int,
	@Documento nvarchar(20)
)
AS
	SET NOCOUNT ON;
SELECT IDCliente, IDTipoDocumento, Documento, NombreComercial, NombresContacto, ApellidosContacto, Direccion, Telefono1, Telefono2, Correo, Notas, Aniversario 
FROM dbo.Cliente
WHERE  IDTipoDocumento = @IDTipoDocumento AND Documento = @Documento


GO
/****** Object:  StoredProcedure [dbo].[GetClienteByTipoDocumentoAndDocumento]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClienteByTipoDocumentoAndDocumento]
(
	@IDTipoDocumento int,
	@Documento nvarchar(20)
)
AS
	SET NOCOUNT ON;
SELECT IDCliente, IDTipoDocumento, Documento, NombreComercial, NombresContacto, ApellidosContacto, Direccion, Telefono1, Telefono2, Correo, Notas, Aniversario 
FROM dbo.Cliente
WHERE IDTipoDocumento = @IDTipoDocumento AND Documento = @Documento


GO
/****** Object:  StoredProcedure [dbo].[GetCompra]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompra]
(
	@IDCompra int
)
AS
	SET NOCOUNT ON;
SELECT IDCompra, Fecha, IDProveedor, IDBodega 
FROM dbo.Compra
WHERE IDCompra = @IDCompra


GO
/****** Object:  StoredProcedure [dbo].[GetCompraDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCompraDetalle]
(
	@IDCompra int
)
AS
	SET NOCOUNT ON;
SELECT IDLinea, IDCompra, IDProducto, Descripcion, Costo, Cantidad, IDKardex, PorcentajeIVA, PorcentajeDescuento 
FROM dbo.CompraDetalle
WHERE IDCompra = @IDCompra


GO
/****** Object:  StoredProcedure [dbo].[GetFechaInventario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFechaInventario]
(
	@IDIventario int
)
AS
	SET NOCOUNT ON;
SELECT fecha FROM Inventario WHERE IDIventario = @IDIventario


GO
/****** Object:  StoredProcedure [dbo].[GetHistoriaDevolucionCliente]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetHistoriaDevolucionCliente]
(
	@IDVenta int,
	@IDProducto int
)
AS
	SET NOCOUNT ON;
SELECT SUM(DevolucionClienteDetalle.Cantidad) 
FROM DevolucionCliente INNER JOIN
 DevolucionClienteDetalle ON DevolucionCliente.IDDevolucionCliente = DevolucionClienteDetalle.IDDevolucionCliente
WHERE (DevolucionCliente.IDVenta = @IDVenta) AND (DevolucionClienteDetalle.IDProducto = @IDProducto)



GO
/****** Object:  StoredProcedure [dbo].[GetHistoriaDevolucionProveedor]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetHistoriaDevolucionProveedor]
(
	@IDCompra int,
	@IDProducto int
)
AS
	SET NOCOUNT ON;
SELECT SUM(DevolucionProveedorDetalle.Cantidad) 
FROM DevolucionProveedorDetalle INNER JOIN
 DevolucionProveedor ON DevolucionProveedorDetalle.IDDevolucionProveedor = DevolucionProveedorDetalle.IDDevolucionProveedor
WHERE (DevolucionProveedor.IDCompra = @IDCompra) AND (DevolucionProveedorDetalle.IDProducto = @IDProducto)


GO
/****** Object:  StoredProcedure [dbo].[GetInventarioXAjustar]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInventarioXAjustar]
(
	@IDInventario int
)
AS
	SET NOCOUNT ON;
SELECT IDLinea, IDInventario, IDProducto, Descripcion, Stock, Conteo1, Conteo2, Conteo3, Ajuste, IDKardex FROM dbo.InventarioDetalle
WHERE Stock <> Conteo1
AND Stock <> Conteo2
AND Stock <> Conteo3
AND IDInventario = @IDInventario


GO
/****** Object:  StoredProcedure [dbo].[GetIVA]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIVA]
(
	@IDIVA int
)
AS
	SET NOCOUNT ON;
SELECT IDIVA, Descripcion, Tarifa 
FROM dbo.IVA
WHERE IDIVA = @IDIVA



GO
/****** Object:  StoredProcedure [dbo].[GetKardexByIDBodegaAndIDProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetKardexByIDBodegaAndIDProducto]
(
	@IDBodega int,
	@IDProducto int
)
AS
	SET NOCOUNT ON;
SELECT IDKardex, IDBodega, IDProducto, Fecha, Documento, Entrada, Salida, Saldo, UltimoCosto, CostoPromedio FROM dbo.Kardex
WHERE IDBodega = @IDBodega AND IDProducto = @IDProducto ORDER BY fecha


GO
/****** Object:  StoredProcedure [dbo].[GetMaxIDProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMaxIDProducto]
AS
	SET NOCOUNT ON;
SELECT MAX(IDProducto) FROM Producto


GO
/****** Object:  StoredProcedure [dbo].[GetProductoByBarra]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductoByBarra]
(
	@Barra bigint
)
AS
	SET NOCOUNT ON;
SELECT Producto.IDProducto, Descripcion, IDDepartamento, IDIVA, Precio, Notas, Imagen, IDMedida, Medida 
FROM Barra INNER JOIN Producto ON Barra.IDProducto = Producto.IDProducto
WHERE Barra = @Barra


GO
/****** Object:  StoredProcedure [dbo].[GetProductoByIDProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductoByIDProducto]
(
	@IDProducto int
)
AS
	SET NOCOUNT ON;
SELECT IDProducto, Descripcion, IDDepartamento, IDIVA, Precio, Notas, Imagen, IDMedida, Medida 
FROM dbo.Producto
WHERE IDProducto = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[GetProductoLikeDescripcion]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductoLikeDescripcion]
(
	@Descripcion nvarchar(MAX)
)
AS
	SET NOCOUNT ON;
SELECT IDProducto, Descripcion, IDDepartamento, IDIVA, Precio, Notas, Imagen, IDMedida, Medida FROM dbo.Producto
WHERE Descripcion LIKE @Descripcion


GO
/****** Object:  StoredProcedure [dbo].[GetProveedorByIDTipoDocumentoAndDocumento]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProveedorByIDTipoDocumentoAndDocumento]
(
	@IDTipoDocumento int,
	@Documento nvarchar(20)
)
AS
	SET NOCOUNT ON;
SELECT IDProveedor, Nombre, IDTipoDocumento, Documento, NombresContacto, ApellidosContacto, Direccion, Telefono1, Telefono2, Correo, Notas 
FROM dbo.Proveedor
WHERE IDTipoDocumento = @IDTipoDocumento AND Documento = @Documento


GO
/****** Object:  StoredProcedure [dbo].[GetUsuario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsuario]
(
	@IDUsuario nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT IDUsuario, Nombres, Apellidos, Clave, FechaModificacionClave, IDRol, Correo 
FROM dbo.Usuario
WHERE IDUsuario = @IDUsuario


GO
/****** Object:  StoredProcedure [dbo].[GetVentaByIDVenta]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVentaByIDVenta]
(
	@IDVenta int
)
AS
	SET NOCOUNT ON;
SELECT IDVenta, Fecha, IDCliente, IDBodega 
FROM dbo.Venta
WHERE IDVenta = @IDVenta


GO
/****** Object:  StoredProcedure [dbo].[GetVentaDetalleByIDVenta]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVentaDetalleByIDVenta]
(
	@IDVenta int
)
AS
	SET NOCOUNT ON;
SELECT IDLinea, IDVenta, IDProducto, Descripcion, Precio, Cantidad, IDKardex, PorcentajeIVA, PorcentajeDescuento 
FROM dbo.VentaDetalle
WHERE IDVenta = @IDVenta


GO
/****** Object:  StoredProcedure [dbo].[InicializarInventario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InicializarInventario] AS

DELETE FROM DevolucionClienteDetalle
DELETE FROM DevolucionCliente
DELETE FROM DevolucionProveedorDetalle
DELETE FROM DevolucionProveedor
DELETE FROM CompraDetalle
DELETE FROM Compra
DELETE FROM InventarioDetalle
DELETE FROM Inventario
DELETE FROM SalidaDetalle
DELETE FROM Salida
DELETE FROM TrasladoDetalle
DELETE FROM Traslado
DELETE FROM VentaDetalle
DELETE FROM Venta
DELETE FROM Kardex

UPDATE BodegaProducto SET Stock = 0

DBCC CHECKIDENT (CompraDetalle, RESEED,0)
DBCC CHECKIDENT (Compra, RESEED,0)
DBCC CHECKIDENT (DevolucionClienteDetalle, RESEED,0)
DBCC CHECKIDENT (DevolucionCliente, RESEED,0)
DBCC CHECKIDENT (DevolucionProveedorDetalle, RESEED,0)
DBCC CHECKIDENT (DevolucionProveedor, RESEED,0)
DBCC CHECKIDENT (InventarioDetalle, RESEED,0)
DBCC CHECKIDENT (Inventario, RESEED,0)
DBCC CHECKIDENT (SalidaDetalle, RESEED,0)
DBCC CHECKIDENT (Salida, RESEED,0)
DBCC CHECKIDENT (TrasladoDetalle, RESEED,0)
DBCC CHECKIDENT (Traslado, RESEED,0)
DBCC CHECKIDENT (VentaDetalle, RESEED,0)
DBCC CHECKIDENT (Venta, RESEED,0)
DBCC CHECKIDENT (Kardex, RESEED,0)



GO
/****** Object:  StoredProcedure [dbo].[InsertBarra]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBarra]
(
	@IDProducto int,
	@Barra bigint
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Barra] ([IDProducto], [Barra]) VALUES (@IDProducto, @Barra)


GO
/****** Object:  StoredProcedure [dbo].[InsertBodega]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBodega]
(
	@Descripcion nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Bodega] ([Descripcion]) VALUES (@Descripcion)


GO
/****** Object:  StoredProcedure [dbo].[InsertBodegaProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBodegaProducto]
(
	@IDBodega int,
	@IDProducto int,
	@Minimo float,
	@Maximo float,
	@DiasReposicion int,
	@CantidadMinima float
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[BodegaProducto] ([IDBodega], [IDProducto], [Stock], [Minimo], [Maximo], [DiasReposicion], [CantidadMinima]) VALUES (@IDBodega, @IDProducto, 0, @Minimo, @Maximo, @DiasReposicion, @CantidadMinima)


GO
/****** Object:  StoredProcedure [dbo].[InsertCliente]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCliente]
(
	@IDTipoDocumento int,
	@Documento nvarchar(20),
	@NombreComercial nvarchar(MAX),
	@NombresContacto nvarchar(MAX),
	@ApellidosContacto nvarchar(MAX),
	@Direccion nvarchar(MAX),
	@Telefono1 nvarchar(MAX),
	@Telefono2 nvarchar(MAX),
	@Correo nvarchar(MAX),
	@Notas text,
	@Aniversario date
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Cliente] ([IDTipoDocumento], [Documento], [NombreComercial], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas], [Aniversario]) VALUES (@IDTipoDocumento, @Documento, @NombreComercial, @NombresContacto, @ApellidosContacto, @Direccion, @Telefono1, @Telefono2, @Correo, @Notas, @Aniversario);
	



GO
/****** Object:  StoredProcedure [dbo].[InsertCompra]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCompra]
(
	@Fecha datetime,
	@IDProveedor int,
	@IDBodega int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Compra] ([Fecha], [IDProveedor], [IDBodega]) VALUES (@Fecha, @IDProveedor, @IDBodega);
	
SELECT IDCompra  FROM Compra WHERE (IDCompra = SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[InsertCompraDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCompraDetalle]
(
	@IDCompra int,
	@IDProducto int,
	@Descripcion nvarchar(MAX),
	@Costo money,
	@Cantidad float,
	@IDKardex int,
	@PorcentajeIVA float,
	@PorcentajeDescuento float
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[CompraDetalle] ([IDCompra], [IDProducto], [Descripcion], [Costo], [Cantidad], [IDKardex], [PorcentajeIVA], [PorcentajeDescuento]) VALUES (@IDCompra, @IDProducto, @Descripcion, @Costo, @Cantidad, @IDKardex, @PorcentajeIVA, @PorcentajeDescuento)


GO
/****** Object:  StoredProcedure [dbo].[InsertConcepto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertConcepto]
(
	@Descripcion nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Concepto] ([Descripcion]) VALUES (@Descripcion)


GO
/****** Object:  StoredProcedure [dbo].[InsertDepartamento]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDepartamento]
(
	@Descripcion nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Departamento] ([Descripcion]) VALUES (@Descripcion)


GO
/****** Object:  StoredProcedure [dbo].[InsertDevolucionCliente]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDevolucionCliente]
(
	@Fecha datetime,
	@IDVenta int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[DevolucionCliente] ([Fecha], [IDVenta]) VALUES (@Fecha, @IDVenta);
	
SELECT IDDevolucionCliente FROM DevolucionCliente WHERE (IDDevolucionCliente = SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[InsertDevolucionClienteDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDevolucionClienteDetalle]
(
	@IDDevolucionCliente int,
	@IDProducto int,
	@Descripcion nvarchar(MAX),
	@Precio money,
	@Cantidad float,
	@IDKardex int,
	@PorcentajeIVA float,
	@PorcentajeDescuento float
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[DevolucionClienteDetalle] ([IDDevolucionCliente], [IDProducto], [Descripcion], [Precio], [Cantidad], [IDKardex], [PorcentajeIVA], [PorcentajeDescuento]) VALUES (@IDDevolucionCliente, @IDProducto, @Descripcion, @Precio, @Cantidad, @IDKardex, @PorcentajeIVA, @PorcentajeDescuento)


GO
/****** Object:  StoredProcedure [dbo].[InsertDevolucionProveedor]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDevolucionProveedor]
(
	@Fecha datetime,
	@IDCompra int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[DevolucionProveedor] ([Fecha], [IDCompra]) VALUES (@Fecha, @IDCompra);
	
SELECT IDDevolucionProveedor FROM DevolucionProveedor WHERE (IDDevolucionProveedor = SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[InsertDevolucionProveedorDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertDevolucionProveedorDetalle]
(
	@IDDevolucionProveedor int,
	@IDProducto int,
	@Descripcion nvarchar(MAX),
	@Precio money,
	@Cantidad float,
	@IDKardex int,
	@PorcentajeIVA float,
	@PorcentajeDescuento float
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[DevolucionProveedorDetalle] ([IDDevolucionProveedor], [IDProducto], [Descripcion], [Precio], [Cantidad], [IDKardex], [PorcentajeIVA], [PorcentajeDescuento]) VALUES (@IDDevolucionProveedor, @IDProducto, @Descripcion, @Precio, @Cantidad, @IDKardex, @PorcentajeIVA, @PorcentajeDescuento)


GO
/****** Object:  StoredProcedure [dbo].[InsertInventario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInventario]
(
	@Fecha datetime,
	@Paso int,
	@IDBodega int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Inventario] ([Fecha], [Paso], [IDBodega]) VALUES (@Fecha, @Paso, @IDBodega);
	
SELECT IDIventario FROM Inventario WHERE (IDIventario = SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[InsertInventarioDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertInventarioDetalle]
(
	@IDInventario int,
	@IDProducto int,
	@Descripcion nvarchar(MAX),
	@Stock float,
	@Conteo1 float,
	@Conteo2 float,
	@Conteo3 float,
	@Ajuste float
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[InventarioDetalle] ([IDInventario], [IDProducto], [Descripcion], [Stock], [Conteo1], [Conteo2], [Conteo3], [Ajuste]) VALUES (@IDInventario, @IDProducto, @Descripcion, @Stock, @Conteo1, @Conteo2, @Conteo3, @Ajuste)


GO
/****** Object:  StoredProcedure [dbo].[InsertIVA]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertIVA]
(
	@Descripcion nvarchar(MAX),
	@Tarifa float
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[IVA] ([Descripcion], [Tarifa]) VALUES (@Descripcion, @Tarifa)


GO
/****** Object:  StoredProcedure [dbo].[InsertKardex]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertKardex]
(
	@IDBodega int,
	@IDProducto int,
	@Fecha datetime,
	@Documento nvarchar(20),
	@Entrada float,
	@Salida float,
	@Saldo float,
	@UltimoCosto money,
	@CostoPromedio money
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Kardex] ([IDBodega], [IDProducto], [Fecha], [Documento], [Entrada], [Salida], [Saldo], [UltimoCosto], [CostoPromedio]) VALUES (@IDBodega, @IDProducto, @Fecha, @Documento, @Entrada, @Salida, @Saldo, @UltimoCosto, @CostoPromedio);
	
SELECT IDKardex FROM Kardex WHERE (IDKardex = SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[InsertMedida]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedida]
(
	@IDMedida nvarchar(2),
	@Descripcion nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Medida] ([IDMedida], [Descripcion]) VALUES (@IDMedida, @Descripcion)


GO
/****** Object:  StoredProcedure [dbo].[InsertProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertProducto]
(
	@Descripcion nvarchar(MAX),
	@IDDepartamento int,
	@IDIVA int,
	@Precio money,
	@Notas text,
	@Imagen nvarchar(MAX),
	@IDMedida nvarchar(2),
	@Medida float
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Producto] ([Descripcion], [IDDepartamento], [IDIVA], [Precio], [Notas], [Imagen], [IDMedida], [Medida]) VALUES (@Descripcion, @IDDepartamento, @IDIVA, @Precio, @Notas, @Imagen, @IDMedida, @Medida)


GO
/****** Object:  StoredProcedure [dbo].[InsertProveedor]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertProveedor]
(
	@Nombre nvarchar(MAX),
	@IDTipoDocumento int,
	@Documento nvarchar(20),
	@NombresContacto nvarchar(MAX),
	@ApellidosContacto nvarchar(MAX),
	@Direccion nvarchar(MAX),
	@Telefono1 nvarchar(MAX),
	@Telefono2 nvarchar(MAX),
	@Correo nvarchar(MAX),
	@Notas text
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Proveedor] ([Nombre], [IDTipoDocumento], [Documento], [NombresContacto], [ApellidosContacto], [Direccion], [Telefono1], [Telefono2], [Correo], [Notas]) VALUES (@Nombre, @IDTipoDocumento, @Documento, @NombresContacto, @ApellidosContacto, @Direccion, @Telefono1, @Telefono2, @Correo, @Notas)


GO
/****** Object:  StoredProcedure [dbo].[InsertSalida]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSalida]
(
	@Fecha datetime,
	@IDConcepto int,
	@IDBodega int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Salida] ([Fecha], [IDConcepto], [IDBodega]) VALUES (@Fecha, @IDConcepto, @IDBodega);
	
SELECT IDSalida FROM Salida WHERE (IDSalida = SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[InsertSalidaDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertSalidaDetalle]
(
	@IDSalida int,
	@IDProducto int,
	@Descripcion nvarchar(MAX),
	@Cantidad float,
	@IDKardex int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[SalidaDetalle] ([IDSalida], [IDProducto], [Descripcion], [Cantidad], [IDKardex]) VALUES (@IDSalida, @IDProducto, @Descripcion, @Cantidad, @IDKardex)


GO
/****** Object:  StoredProcedure [dbo].[InsertTipoDocumento]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTipoDocumento]
(
	@Descripcion nvarchar(MAX)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[TipoDocumento] ([Descripcion]) VALUES (@Descripcion)


GO
/****** Object:  StoredProcedure [dbo].[InsertTraslado]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTraslado]
(
	@Fecha datetime,
	@IDBodegaOrigen int,
	@IDBodegaDestino int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Traslado] ([Fecha], [IDBodegaOrigen], [IDBodegaDestino]) VALUES (@Fecha, @IDBodegaOrigen, @IDBodegaDestino);
	
SELECT IDTraslado FROM Traslado WHERE (IDTraslado = SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[InsertTrasladoDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTrasladoDetalle]
(
	@IDTraslado int,
	@IDProducto int,
	@Descripcion nvarchar(MAX),
	@IDKardexOrigen int,
	@IDKardexDestino int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[TrasladoDetalle] ([IDTraslado], [IDProducto], [Descripcion], [IDKardexOrigen], [IDKardexDestino]) VALUES (@IDTraslado, @IDProducto, @Descripcion, @IDKardexOrigen, @IDKardexDestino)


GO
/****** Object:  StoredProcedure [dbo].[InsertVenta]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertVenta]
(
	@Fecha datetime,
	@IDCliente int,
	@IDBodega int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Venta] ([Fecha], [IDCliente], [IDBodega]) VALUES (@Fecha, @IDCliente, @IDBodega);
SELECT IDVenta FROM Venta WHERE (IDVenta = SCOPE_IDENTITY())


GO
/****** Object:  StoredProcedure [dbo].[InsertVentaDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertVentaDetalle]
(
	@IDVenta int,
	@IDProducto int,
	@Descripcion nvarchar(MAX),
	@Precio money,
	@Cantidad float,
	@IDKardex int,
	@PorcentajeIVA float,
	@PorcentajeDescuento float
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[VentaDetalle] ([IDVenta], [IDProducto], [Descripcion], [Precio], [Cantidad], [IDKardex], [PorcentajeIVA], [PorcentajeDescuento]) VALUES (@IDVenta, @IDProducto, @Descripcion, @Precio, @Cantidad, @IDKardex, @PorcentajeIVA, @PorcentajeDescuento)


GO
/****** Object:  StoredProcedure [dbo].[KardexTieneMovimientoByIDBodega]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[KardexTieneMovimientoByIDBodega]
(
	@IDBodega int
)
AS
	SET NOCOUNT ON;
SELECT TOP 1 1 FROM Kardex WHERE IDBodega = @IDBodega


GO
/****** Object:  StoredProcedure [dbo].[KardexTieneMovimientoByIDProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[KardexTieneMovimientoByIDProducto]
(
	@IDProducto int
)
AS
	SET NOCOUNT ON;
SELECT TOP 1 1 FROM Kardex WHERE IDProducto = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[MantenimientoTablas]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MantenimientoTablas] AS
DELETE FROM Producto WHERE IDProducto NOT IN (SELECT IDProducto FROM ProductoUnico)
DELETE FROM Cliente WHERE IDCliente NOT IN (SELECT IDCliente FROM ClienteUnico)
DELETE FROM Proveedor WHERE IDProveedor NOT IN (SELECT IDProveedor FROM ProveedorUnico)
UPDATE Producto SET 
	Descripcion = RTRIM(LTRIM(UPPER(Descripcion)))
UPDATE Cliente SET 
	NombreComercial = RTRIM(LTRIM(UPPER(NombreComercial))), 
	NombresContacto = RTRIM(LTRIM(UPPER(NombresContacto))), 
	ApellidosContacto = RTRIM(LTRIM(UPPER(ApellidosContacto)))
UPDATE Proveedor SET 
	Nombre = RTRIM(LTRIM(UPPER(Nombre))), 
	NombresContacto = RTRIM(LTRIM(UPPER(NombresContacto))), 
	ApellidosContacto = RTRIM(LTRIM(UPPER(ApellidosContacto)))



GO
/****** Object:  StoredProcedure [dbo].[ProveedorTieneCompras]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProveedorTieneCompras]
(
	@IDProveedor int
)
AS
	SET NOCOUNT ON;
SELECT TOP 1 1 FROM Compra WHERE IDProveedor = @IDProveedor


GO
/****** Object:  StoredProcedure [dbo].[PuedeBorrar]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PuedeBorrar]
(
	@IDRol int,
	@Formulario nvarchar(MAX)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM PermisoRol
WHERE IDRol = @IDRol AND PuedeBorrar = 1 AND Formulario = @Formulario


GO
/****** Object:  StoredProcedure [dbo].[PuedeModificar]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PuedeModificar]
(
	@IDRol int,
	@Formulario nvarchar(MAX)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM PermisoRol
WHERE IDRol = @IDRol AND PuedeModificar = 1 AND Formulario = @Formulario


GO
/****** Object:  StoredProcedure [dbo].[PuedeVer]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PuedeVer]
(
	@IDRol int,
	@Formulario nvarchar(MAX)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM PermisoRol
WHERE IDRol = @IDRol AND PuedeVer = 1 AND Formulario = @Formulario


GO
/****** Object:  StoredProcedure [dbo].[UltimoKardex]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UltimoKardex]
(
	@IDBodega int,
	@IDProducto int
)
AS
	SET NOCOUNT ON;
SELECT IDKardex, IDBodega, IDProducto, Fecha, Documento, Entrada, Salida, Saldo, UltimoCosto, CostoPromedio 
FROM dbo.Kardex
WHERE IDBodega = @IDBodega AND IDProducto = @IDProducto AND Fecha = 
(SELECT MAX(Fecha) FROM Kardex WHERE IDBodega = @IDBodega AND IDProducto = @IDProducto)


GO
/****** Object:  StoredProcedure [dbo].[UpdateAjusteInventarioDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAjusteInventarioDetalle]
(
	@Ajuste float,
	@IDLinea int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[InventarioDetalle] SET 
[Ajuste] = @Ajuste
WHERE [IDLinea] = @IDLinea


GO
/****** Object:  StoredProcedure [dbo].[UpdateBodegaProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBodegaProducto]
(
	@Minimo float,
	@Maximo float,
	@DiasReposicion int,
	@CantidadMinima float,
	@IDBodega int,
	@IDProducto int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[BodegaProducto] SET 
[Minimo] = @Minimo, 
[Maximo] = @Maximo, 
[DiasReposicion] = @DiasReposicion, 
[CantidadMinima] = @CantidadMinima 
WHERE [IDBodega] = @IDBodega AND [IDProducto] = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[UpdateCliente]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCliente]
(
	@IDTipoDocumento int,
	@Documento nvarchar(20),
	@NombreComercial nvarchar(MAX),
	@NombresContacto nvarchar(MAX),
	@ApellidosContacto nvarchar(MAX),
	@Direccion nvarchar(MAX),
	@Telefono1 nvarchar(MAX),
	@Telefono2 nvarchar(MAX),
	@Correo nvarchar(MAX),
	@Notas text,
	@Aniversario date,
	@IDCliente int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Cliente] SET 
[IDTipoDocumento] = @IDTipoDocumento, 
[Documento] = @Documento, 
[NombreComercial] = @NombreComercial,
[NombresContacto] = @NombresContacto, 
[ApellidosContacto] = @ApellidosContacto, 
[Direccion] = @Direccion, 
[Telefono1] = @Telefono1, 
[Telefono2] = @Telefono2, 
[Correo] = @Correo, 
[Notas] = @Notas, 
[Aniversario] = @Aniversario 
WHERE [IDCliente] = @IDCliente


GO
/****** Object:  StoredProcedure [dbo].[UpdateImagen]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateImagen]
(
	@Imagen nvarchar(MAX),
	@IDProducto int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Producto] SET 
[Imagen] = @Imagen
WHERE [IDProducto] = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[UpdateKardex]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateKardex]
(
	@Saldo float,
	@CostoPromedio money,
	@UltimoCosto money,
	@IDKardex int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Kardex] SET 
[Saldo] = @Saldo, 
[CostoPromedio] = @CostoPromedio,
[UltimoCosto] = @UltimoCosto 
WHERE [IDKardex] = @IDKardex


GO
/****** Object:  StoredProcedure [dbo].[UpdateKardexInventarioDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateKardexInventarioDetalle]
(
	@IDKardex int,
	@IDLinea int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[InventarioDetalle] SET 
[IDKardex] = @IDKardex 
WHERE [IDLinea] = @IDLinea


GO
/****** Object:  StoredProcedure [dbo].[UpdatePasoInventario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePasoInventario]
(
	@IDIventario int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Inventario] SET 
[Paso] = [Paso] + 1 
WHERE [IDIventario] = @IDIventario


GO
/****** Object:  StoredProcedure [dbo].[UpdateProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProducto]
(
	@Descripcion nvarchar(MAX),
	@IDDepartamento int,
	@IDIVA int,
	@Precio money,
	@Notas text,
	@Imagen nvarchar(MAX),
	@IDMedida nvarchar(2),
	@Medida float,
	@IDProducto int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Producto] SET 
[Descripcion] = @Descripcion, 
[IDDepartamento] = @IDDepartamento,
[IDIVA] = @IDIVA, 
[Precio] = @Precio, 
[Notas] = @Notas, 
[Imagen] = @Imagen, 
[IDMedida] = @IDMedida, 
[Medida] = @Medida 
WHERE [IDProducto] = @IDProducto


GO
/****** Object:  StoredProcedure [dbo].[UpdateProveedor]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProveedor]
(
	@Nombre nvarchar(MAX),
	@IDTipoDocumento int,
	@Documento nvarchar(20),
	@NombresContacto nvarchar(MAX),
	@ApellidosContacto nvarchar(MAX),
	@Direccion nvarchar(MAX),
	@Telefono1 nvarchar(MAX),
	@Telefono2 nvarchar(MAX),
	@Correo nvarchar(MAX),
	@Notas text,
	@IDProveedor int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Proveedor] SET 
[Nombre] = @Nombre, 
[IDTipoDocumento] = @IDTipoDocumento, 
[Documento] = @Documento, 
[NombresContacto] = @NombresContacto, 
[ApellidosContacto] = @ApellidosContacto, 
[Direccion] = @Direccion, 
[Telefono1] = @Telefono1, 
[Telefono2] = @Telefono2, 
[Correo] = @Correo, 
[Notas] = @Notas 
WHERE [IDProveedor] = @IDProveedor


GO
/****** Object:  StoredProcedure [dbo].[ValidaUsuario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidaUsuario]
(
	@IDUsuario nvarchar(10),
	@Clave nvarchar(10)
)
AS
	SET NOCOUNT ON;
SELECT 1 FROM Usuario WHERE IDUsuario = @IDUsuario AND Clave = @Clave


GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodega](
	[IDBodega] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Bodega] PRIMARY KEY CLUSTERED 
(
	[IDBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BodegaProducto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodegaProducto](
	[IDBodega] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Stock] [float] NOT NULL,
	[Minimo] [float] NOT NULL,
	[Maximo] [float] NOT NULL,
	[DiasReposicion] [int] NOT NULL,
	[CantidadMinima] [float] NOT NULL,
 CONSTRAINT [PK_BodegaProducto] PRIMARY KEY CLUSTERED 
(
	[IDBodega] ASC,
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[IDTipoDocumento] [int] NOT NULL,
	[Documento] [nvarchar](20) NOT NULL,
	[NombreComercial] [nvarchar](200) NOT NULL,
	[NombresContacto] [nvarchar](100) NOT NULL,
	[ApellidosContacto] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NULL,
	[Telefono1] [nvarchar](20) NULL,
	[Telefono2] [nvarchar](20) NULL,
	[Movil] [nvarchar](20) NULL,
	[Correo] [nvarchar](max) NULL,
	[Notas] [text] NULL,
	[Aniversario] [date] NULL,
	[FechaRegistro] [datetime] NULL,
	[IDSexo] [int] NULL,
	[IDTipoPersona] [int] NULL,
	[IDCiudad] [int] NULL,
	[CupoCredito] [money] NULL,
	[Descuento] [float] NULL,
	[AutorizacionDatos] [bit] NULL,
	[RutaAutorizaciondatos] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Compra]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IDCompra] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDProveedor] [int] NOT NULL,
	[IDBodega] [int] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IDCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CompraDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompraDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDCompra] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Costo] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
	[PorcentajeIVA] [float] NOT NULL,
	[PorcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_CompraDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[IDConcepto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Concepto] PRIMARY KEY CLUSTERED 
(
	[IDConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[IDDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[IDDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevolucionCliente]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionCliente](
	[IDDevolucionCliente] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDVenta] [int] NOT NULL,
 CONSTRAINT [PK_DevolucionCliente] PRIMARY KEY CLUSTERED 
(
	[IDDevolucionCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevolucionClienteDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionClienteDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDDevolucionCliente] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
	[PorcentajeIVA] [float] NOT NULL,
	[PorcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_DevolucionClienteDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevolucionProveedor]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionProveedor](
	[IDDevolucionProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDCompra] [int] NOT NULL,
 CONSTRAINT [PK_DevolucionProveedor] PRIMARY KEY CLUSTERED 
(
	[IDDevolucionProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevolucionProveedorDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevolucionProveedorDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDDevolucionProveedor] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
	[PorcentajeIVA] [float] NOT NULL,
	[PorcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_DevolucionProveedorDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[IDIventario] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Paso] [int] NOT NULL,
	[IDBodega] [int] NOT NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[IDIventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InventarioDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDInventario] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Stock] [float] NOT NULL,
	[Conteo1] [float] NOT NULL,
	[Conteo2] [float] NOT NULL,
	[Conteo3] [float] NOT NULL,
	[Ajuste] [float] NOT NULL,
	[IDKardex] [int] NULL,
 CONSTRAINT [PK_InventarioDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IVA]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IVA](
	[IDIVA] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Tarifa] [float] NOT NULL,
 CONSTRAINT [PK_IVA] PRIMARY KEY CLUSTERED 
(
	[IDIVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kardex]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kardex](
	[IDKardex] [int] IDENTITY(1,1) NOT NULL,
	[IDBodega] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Documento] [nvarchar](20) NOT NULL,
	[Entrada] [float] NOT NULL,
	[Salida] [float] NOT NULL,
	[Saldo] [float] NOT NULL,
	[UltimoCosto] [money] NOT NULL,
	[CostoPromedio] [money] NOT NULL,
 CONSTRAINT [PK_Kardex] PRIMARY KEY CLUSTERED 
(
	[IDKardex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medida]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medida](
	[IDMedida] [nvarchar](2) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Medida] PRIMARY KEY CLUSTERED 
(
	[IDMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PermisoRol]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisoRol](
	[IDPermiso] [int] IDENTITY(1,1) NOT NULL,
	[IDRol] [int] NOT NULL,
	[Formulario] [nvarchar](max) NOT NULL,
	[PuedeVer] [bit] NOT NULL,
	[PuedeModificar] [bit] NOT NULL,
	[PuedeBorrar] [bit] NOT NULL,
 CONSTRAINT [PK_PermisoRol] PRIMARY KEY CLUSTERED 
(
	[IDPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IDProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[IDDepartamento] [int] NOT NULL,
	[IDIVA] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Notas] [text] NULL,
	[Imagen] [nvarchar](max) NULL,
	[IDMedida] [nvarchar](2) NOT NULL,
	[Medida] [float] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IDProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[IDTipoDocumento] [int] NOT NULL,
	[Documento] [nvarchar](20) NOT NULL,
	[NombresContacto] [nvarchar](max) NOT NULL,
	[ApellidosContacto] [nvarchar](max) NOT NULL,
	[Direccion] [nvarchar](max) NULL,
	[Telefono1] [nvarchar](max) NULL,
	[Movil] [nvarchar](max) NULL,
	[Correo] [nvarchar](max) NULL,
	[Notas] [text] NULL,
	[AutorizacionDatos] [bit] NULL,
	[RutaAutorizaciondatos] [nvarchar](max) NULL,
	[IDTipoPersona] [int] NULL,
	[IDCiudad] [int] NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IDRol] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IDRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salida]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salida](
	[IDSalida] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDConcepto] [int] NOT NULL,
	[IDBodega] [int] NOT NULL,
 CONSTRAINT [PK_Salida] PRIMARY KEY CLUSTERED 
(
	[IDSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalidaDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalidaDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDSalida] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
 CONSTRAINT [PK_SalidaDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[IDTipoDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[IDTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Traslado]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traslado](
	[IDTraslado] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDBodegaOrigen] [int] NOT NULL,
	[IDBodegaDestino] [int] NOT NULL,
 CONSTRAINT [PK_Traslado] PRIMARY KEY CLUSTERED 
(
	[IDTraslado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrasladoDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrasladoDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDTraslado] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[IDKardexOrigen] [int] NOT NULL,
	[IDKardexDestino] [int] NOT NULL,
 CONSTRAINT [PK_TrasladoDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IDUsuario] [nvarchar](20) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Clave] [nvarchar](50) NOT NULL,
	[FechaModificacionClave] [date] NOT NULL,
	[IDRol] [int] NOT NULL,
	[Correo] [nvarchar](max) NOT NULL,
	[FechaUltimoLogin] [datetime] NULL,
	[FechaActivacionInicial] [datetime] NULL,
	[FechaActivacionFinal] [datetime] NULL,
	[NumerosDiasCambioClave] [int] NULL,
	[CambiarClaveAlIngresar] [int] NULL,
	[LongitudMinima] [int] NULL,
	[DiasVencimientoClave] [int] NULL,
	[Activo] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Venta]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IDVenta] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDCliente] [int] NOT NULL,
	[IDBodega] [int] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IDVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 23/09/2018 19:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaDetalle](
	[IDLinea] [int] IDENTITY(1,1) NOT NULL,
	[IDVenta] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[IDKardex] [int] NOT NULL,
	[PorcentajeIVA] [float] NOT NULL,
	[PorcentajeDescuento] [float] NOT NULL,
 CONSTRAINT [PK_VentaDetalle] PRIMARY KEY CLUSTERED 
(
	[IDLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[BodegaProducto] ADD  CONSTRAINT [DF_BodegaProducto_Minimo]  DEFAULT ((0)) FOR [Minimo]
GO
ALTER TABLE [dbo].[BodegaProducto] ADD  CONSTRAINT [DF_BodegaProducto_Maximo]  DEFAULT ((0)) FOR [Maximo]
GO
ALTER TABLE [dbo].[BodegaProducto] ADD  CONSTRAINT [DF_BodegaProducto_DiasReposicion]  DEFAULT ((1)) FOR [DiasReposicion]
GO
ALTER TABLE [dbo].[BodegaProducto] ADD  CONSTRAINT [DF_BodegaProducto_CantidadMinima]  DEFAULT ((1)) FOR [CantidadMinima]
GO
ALTER TABLE [dbo].[InventarioDetalle] ADD  CONSTRAINT [DF_InventarioDetalle_Stock]  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[InventarioDetalle] ADD  CONSTRAINT [DF_InventarioDetalle_Conteo1]  DEFAULT ((0)) FOR [Conteo1]
GO
ALTER TABLE [dbo].[InventarioDetalle] ADD  CONSTRAINT [DF_InventarioDetalle_Conteo2]  DEFAULT ((0)) FOR [Conteo2]
GO
ALTER TABLE [dbo].[InventarioDetalle] ADD  CONSTRAINT [DF_InventarioDetalle_Conteo3]  DEFAULT ((0)) FOR [Conteo3]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_Entrada]  DEFAULT ((0)) FOR [Entrada]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_Salida]  DEFAULT ((0)) FOR [Salida]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_Saldo]  DEFAULT ((0)) FOR [Saldo]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_UltimoCosto]  DEFAULT ((0)) FOR [UltimoCosto]
GO
ALTER TABLE [dbo].[Kardex] ADD  CONSTRAINT [DF_Kardex_CostoPromedio]  DEFAULT ((0)) FOR [CostoPromedio]
GO
ALTER TABLE [dbo].[Producto] ADD  CONSTRAINT [DF_Producto_Medida]  DEFAULT ((1)) FOR [Medida]
GO
ALTER TABLE [dbo].[BodegaProducto]  WITH CHECK ADD  CONSTRAINT [FK_BodegaProducto_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[BodegaProducto] CHECK CONSTRAINT [FK_BodegaProducto_Bodega]
GO
ALTER TABLE [dbo].[BodegaProducto]  WITH CHECK ADD  CONSTRAINT [FK_BodegaProducto_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[BodegaProducto] CHECK CONSTRAINT [FK_BodegaProducto_Producto]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_TipoDocumento] FOREIGN KEY([IDTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([IDTipoDocumento])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_TipoDocumento]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Bodega]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Proveedor] FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedor] ([IDProveedor])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Proveedor]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Compra] FOREIGN KEY([IDCompra])
REFERENCES [dbo].[Compra] ([IDCompra])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Compra]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Kardex]
GO
ALTER TABLE [dbo].[CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_CompraDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[CompraDetalle] CHECK CONSTRAINT [FK_CompraDetalle_Producto]
GO
ALTER TABLE [dbo].[DevolucionCliente]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionCliente_Venta] FOREIGN KEY([IDVenta])
REFERENCES [dbo].[Venta] ([IDVenta])
GO
ALTER TABLE [dbo].[DevolucionCliente] CHECK CONSTRAINT [FK_DevolucionCliente_Venta]
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionClienteDetalle_DevolucionCliente] FOREIGN KEY([IDDevolucionCliente])
REFERENCES [dbo].[DevolucionCliente] ([IDDevolucionCliente])
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle] CHECK CONSTRAINT [FK_DevolucionClienteDetalle_DevolucionCliente]
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionClienteDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle] CHECK CONSTRAINT [FK_DevolucionClienteDetalle_Kardex]
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionClienteDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle] CHECK CONSTRAINT [FK_DevolucionClienteDetalle_Producto]
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionClienteDetalle_Producto1] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[DevolucionClienteDetalle] CHECK CONSTRAINT [FK_DevolucionClienteDetalle_Producto1]
GO
ALTER TABLE [dbo].[DevolucionProveedor]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionProveedor_Compra] FOREIGN KEY([IDCompra])
REFERENCES [dbo].[Compra] ([IDCompra])
GO
ALTER TABLE [dbo].[DevolucionProveedor] CHECK CONSTRAINT [FK_DevolucionProveedor_Compra]
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionProveedorDetalle_DevolucionProveedor] FOREIGN KEY([IDDevolucionProveedor])
REFERENCES [dbo].[DevolucionProveedor] ([IDDevolucionProveedor])
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle] CHECK CONSTRAINT [FK_DevolucionProveedorDetalle_DevolucionProveedor]
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionProveedorDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle] CHECK CONSTRAINT [FK_DevolucionProveedorDetalle_Kardex]
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle]  WITH CHECK ADD  CONSTRAINT [FK_DevolucionProveedorDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[DevolucionProveedorDetalle] CHECK CONSTRAINT [FK_DevolucionProveedorDetalle_Producto]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Bodega]
GO
ALTER TABLE [dbo].[InventarioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_InventarioDetalle_Inventario] FOREIGN KEY([IDInventario])
REFERENCES [dbo].[Inventario] ([IDIventario])
GO
ALTER TABLE [dbo].[InventarioDetalle] CHECK CONSTRAINT [FK_InventarioDetalle_Inventario]
GO
ALTER TABLE [dbo].[InventarioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_InventarioDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[InventarioDetalle] CHECK CONSTRAINT [FK_InventarioDetalle_Kardex]
GO
ALTER TABLE [dbo].[InventarioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_InventarioDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[InventarioDetalle] CHECK CONSTRAINT [FK_InventarioDetalle_Producto]
GO
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD  CONSTRAINT [FK_Kardex_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Kardex] CHECK CONSTRAINT [FK_Kardex_Bodega]
GO
ALTER TABLE [dbo].[Kardex]  WITH CHECK ADD  CONSTRAINT [FK_Kardex_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[Kardex] CHECK CONSTRAINT [FK_Kardex_Producto]
GO
ALTER TABLE [dbo].[PermisoRol]  WITH CHECK ADD  CONSTRAINT [FK_PermisoRol_Rol] FOREIGN KEY([IDRol])
REFERENCES [dbo].[Rol] ([IDRol])
GO
ALTER TABLE [dbo].[PermisoRol] CHECK CONSTRAINT [FK_PermisoRol_Rol]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Departamento] FOREIGN KEY([IDDepartamento])
REFERENCES [dbo].[Departamento] ([IDDepartamento])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Departamento]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_IVA] FOREIGN KEY([IDIVA])
REFERENCES [dbo].[IVA] ([IDIVA])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_IVA]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Medida] FOREIGN KEY([IDMedida])
REFERENCES [dbo].[Medida] ([IDMedida])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Medida]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [FK_Proveedor_TipoDocumento] FOREIGN KEY([IDTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([IDTipoDocumento])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [FK_Proveedor_TipoDocumento]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_Bodega]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_Concepto] FOREIGN KEY([IDConcepto])
REFERENCES [dbo].[Concepto] ([IDConcepto])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_Concepto]
GO
ALTER TABLE [dbo].[SalidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidaDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[SalidaDetalle] CHECK CONSTRAINT [FK_SalidaDetalle_Kardex]
GO
ALTER TABLE [dbo].[SalidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidaDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[SalidaDetalle] CHECK CONSTRAINT [FK_SalidaDetalle_Producto]
GO
ALTER TABLE [dbo].[SalidaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_SalidaDetalle_Salida] FOREIGN KEY([IDSalida])
REFERENCES [dbo].[Salida] ([IDSalida])
GO
ALTER TABLE [dbo].[SalidaDetalle] CHECK CONSTRAINT [FK_SalidaDetalle_Salida]
GO
ALTER TABLE [dbo].[Traslado]  WITH CHECK ADD  CONSTRAINT [FK_Traslado_Bodega] FOREIGN KEY([IDBodegaOrigen])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Traslado] CHECK CONSTRAINT [FK_Traslado_Bodega]
GO
ALTER TABLE [dbo].[Traslado]  WITH CHECK ADD  CONSTRAINT [FK_Traslado_Bodega1] FOREIGN KEY([IDBodegaDestino])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Traslado] CHECK CONSTRAINT [FK_Traslado_Bodega1]
GO
ALTER TABLE [dbo].[TrasladoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TrasladoDetalle_Kardex] FOREIGN KEY([IDKardexOrigen])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[TrasladoDetalle] CHECK CONSTRAINT [FK_TrasladoDetalle_Kardex]
GO
ALTER TABLE [dbo].[TrasladoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TrasladoDetalle_Kardex1] FOREIGN KEY([IDKardexDestino])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[TrasladoDetalle] CHECK CONSTRAINT [FK_TrasladoDetalle_Kardex1]
GO
ALTER TABLE [dbo].[TrasladoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TrasladoDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[TrasladoDetalle] CHECK CONSTRAINT [FK_TrasladoDetalle_Producto]
GO
ALTER TABLE [dbo].[TrasladoDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TrasladoDetalle_Traslado] FOREIGN KEY([IDTraslado])
REFERENCES [dbo].[Traslado] ([IDTraslado])
GO
ALTER TABLE [dbo].[TrasladoDetalle] CHECK CONSTRAINT [FK_TrasladoDetalle_Traslado]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Bodega] FOREIGN KEY([IDBodega])
REFERENCES [dbo].[Bodega] ([IDBodega])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Bodega]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([IDCliente])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Kardex] FOREIGN KEY([IDKardex])
REFERENCES [dbo].[Kardex] ([IDKardex])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Kardex]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Producto]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Venta] FOREIGN KEY([IDVenta])
REFERENCES [dbo].[Venta] ([IDVenta])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Venta]
GO
