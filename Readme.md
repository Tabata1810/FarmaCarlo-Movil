### FarmaCarlo - Aplicacion Movil y Backend

Repositorio de nuestro proyecto integrador FarmaCarlo. Contiene la configuracion del entorno de desarrollo para la aplicacion movil y la API del servidor backend para la gestion de inventario, clientes y ventas.

### Entorno de Desarrollo

- Lenguaje: Python 3.10+
- Framework Web / API: Flask
- Base de Datos: MySQL / MariaDB
- Editor de Codigo: Visual Studio Code
- Dispositivo de Prueba: Telefono android fisico

### Estructura del Proyecto

- Conexion/: Archivos de conexion a la base de datos.
- forms/: Validaciones de formularios.
- models/: Modelos de datos (Usuarios, Productos, Clientes).
- services/: Logica del sistema y rutas de la API.
- templates/ y static/: Plantillas y archivos estaticos.
- app.py: Archivo principal de ejecucion del servidor.
- database.py: Configuracion de la base de datos.

### Pasos para Ejecutar el Proyecto

1. Clonar el repositorio.
2. Crear y activar el entorno virtual: `python -m venv venv` y `venv\Scripts\activate`
3. Instalar dependencias: `pip install -r requirements.txt`
4. Cargar la base de datos `farmacarlo_db_final.sql` en MySQL.
5. Iniciar el servidor backend: `python app.py`

### Conexion con la App Movil

Para permitir la comunicacion en entorno local, el servidor de Flask escucha conexiones entrantes a traves de la direccion IP asignada en la red Wi-Fi local.
