Feature: Listar usuarios

  Background:
    * url 'https://serverest.dev'
    * path 'usuarios'

  Scenario: Obtener lista de usuarios
    When method GET
    Then status 200
    And match each response.usuarios('classpath:schemas/schema-usuarios.json')

  Scenario: Intentar acceder a endpoint inválido
    Given path 'usuariosx'
    When method GET
    Then status 405