# Libreria el mundo de Sofía


## Base de datos diseñada para la tienda "Libreria el mundo de Sofía, gestionar su inventario, ventas y cliente realizando cada uno de estos registros de una mejor manera.

## A continuación encontrarás estructura, definición de entidades y atributos, relaciones, documentación del diseño, validaciones y restricciones lógicas, normalización de la base de datos y por último organización y entrega.

## Estructura del Diagrama

- Se diseñaron las siguientes tablas junto con sus atributos.

1. Cliente:
id_libro, editorial_libro, categoria_libro, fecha_publi_libro, isbn_libro, precio_libro, cantidad_libro

2. Autor:
id_autor, nombre_autor, fecha_nac_autor, nacionalidad_autor

3. Cliente
id_cliente, nombre_cliente, correo_electronico_cliente, telefono_cliente, direccion_cliente

4. Pedido
id_pedido, estado_pedido

5. Transaccion
id_transaccion, metodo_pago_transaccion, monto_total_transaccion, fecha_transaccion


## Definicion de entidades y atributos


1. Cliente:
id_libro, editorial_libro, categoria_libro, fecha_publi_libro, isbn_libro, precio_libro, cantidad_libro

Clave primaria: id_libro

2. Autor:
id_autor, nombre_autor, fecha_nac_autor, nacionalidad_autor

Clave primaria: id_autor

3. Cliente
id_cliente, nombre_cliente, correo_electronico_cliente, telefono_cliente, direccion_cliente

Clave primaria: id_cliente

4. Pedido
id_pedido, estado_pedido

Clave primaria: id_pedido

5. Transaccion
id_transaccion, metodo_pago_transaccion, monto_total_transaccion, fecha_transaccion

Clave primaria: id_transaccion

## Relaciones

La relaciones encontradas mediante la verificación y solicitud del establecimiento "Librería el mundo de sofía" son:

• Un Libro puede tener uno o varios autores, y un Autor puede
haber escrito varios libros  relacin N:M entre Libro–Autor.

• Un Cliente puede realizar muchos pedidos  relacion 1:N entre
Cliente–Pedido.

• Un Pedido contiene varios libros, y un Libro puede aparecer en
varios pedidos  relación N:M gestionada por DetallePedido.

• Cada Pedido está asociado a una unica transacción, pero cada
transacción pertenece a un solo pedido  relación 1:1 entre Pedido– transacción.


## Documentación del diseño

En la documentación del diseño podemos encontrar  caracteristicas importantes para


## Validaciones y restricciones lógicas

En este campo tuvimos en cuenta las validaciones y restricciones exigidas por la tienda.

- Se genero un campo UNICO en la tabla libro en su atributo ISBN, evitando asi la creacion de duplicados en el registro.

- Se implemento un atributo FK dentro de la tabla Libro para actualizar de manera sencilla y rápida en la base de datos la actualizacion de stock donde se evalua cual es su disponilidad  al realizar la compra y tener garantia de un orden de inventario.

- Y las relaciones mencionas en el item anterior.

## Normalización de la base de datos

La normalización numero 1NF

- La 1NF es aplicada creando las tablas y sus atributos de la siguiente manera:

1. Cliente:
id_libro, editorial_libro, categoria_libro, fecha_publi_libro, isbn_libro, precio_libro, cantidad_libro

2. Autor:
id_autor, nombre_autor, fecha_nac_autor, nacionalidad_autor

3. Cliente
id_cliente, nombre_cliente, correo_electronico_cliente, telefono_cliente, direccion_cliente

4. Pedido
id_pedido, estado_pedido

5. Transaccion
id_transaccion, metodo_pago_transaccion, monto_total_transaccion, fecha_transaccion


para un resultado de atributos atomicos.


- La 2NF aplicada en la libreria el mundo sofía, es definiendo cada primaria 


1. Cliente:
id_libro, editorial_libro, categoria_libro, fecha_publi_libro, isbn_libro, precio_libro, cantidad_libro

Clave primaria: id_libro

2. Autor:
id_autor, nombre_autor, fecha_nac_autor, nacionalidad_autor

Clave primaria: id_autor

3. Cliente
id_cliente, nombre_cliente, correo_electronico_cliente, telefono_cliente, direccion_cliente

Clave primaria: id_cliente

4. Pedido
id_pedido, estado_pedido

Clave primaria: id_pedido

5. Transaccion
id_transaccion, metodo_pago_transaccion, monto_total_transaccion, fecha_transaccion

Clave primaria: id_transaccion

y evidencia cual corresponde a DFT de la siguiente manera podemos evaluar nuestros criterio tenidos en cuenta e eliminacion de depedencias:

Se creó una nueva tabla Autor, y una tabla intermedia libro autor para representar la relación muchos a muchos (N:M) entre libros y autores.



- La 3NF aplicada fue cuando realizamos en esta normalización 

La verificaion de algunos atributos como el nombre_proveedor o correo del cliente podian repetirse en otras tablas, lo que generaba redundancia.


Por ultimo un resumen de las tablas:

Cliente: almacena la información de los clientes registrados
• autor: contiene los datos de los autores de los libros
• Libro: gestiona los libros disponibles, precios y stock
• pedido: registra las compras de los clientes
• Transacción: almacena la información de pago
• DetallePedido: vincula libros con pedidos
• LibroAutor: representa la relación N:M entre libros y autores

Gracias al proceso de normalización, la base de datos de Librería El Mundo de Sofía quedó optimizada, sin redundancias y lista para crecer.

# Hecho por: Maria Alejandra Garcia