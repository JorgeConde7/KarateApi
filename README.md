
# 🚀 Suite de Pruebas Automatizadas - ServeRest API

Este proyecto implementa pruebas automatizadas para la **API de Usuarios de ServeRest** utilizando **Karate DSL**.

## 📦 Tecnologías
- Karate DSL
- Maven
- JUnit5

## ⚙️ Configuración y Ejecución
1. Clonar el repositorio:
 git clone https://github.com/JorgeConde7/KarateApi.git
2. Configurar runner con Junit y jdk a elección para ejecutar los casos de prueba
3. Ingresar el feature a ejecutar desde el Runner.java

## ✅ Estrategias

- Cobertura CRUD completa: listar, crear, buscar, actualizar y eliminar usuarios.
- Casos positivos y negativos para cada operación.
- Validación de esquemas JSON para asegurar integridad de datos.
- Generación dinámica de datos para evitar colisiones (emails aleatorios).
- Organización por endpoints en diferentes feature files.
- Helpers y esquemas externos para mejor mantenibilida

📂 Estructura del proyecto

- Feature Files: Contienen los escenarios de prueba de los endpoint
- Data Schemas: Para validar los response de los endpoint
- Tags: Para ejecutar grupos de pruebas 
- Runner: Para definir que casos probar