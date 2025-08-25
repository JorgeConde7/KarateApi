Feature: Listar usuarios

  Background:
    * url 'https://serverest.dev'

  @listarUsuarios
  Scenario: Obtener lista de usuarios
    Given path 'usuarios'
    When method GET
    Then status 200
    And match each response.usuarios == read ('classpath:schemas/ValidarSchema-listarUsuarios.json')

  @endpointInvalido
  Scenario: Intentar acceder a endpoint inválido
    Given path 'usuariosx'
    When method GET
    Then status 405
    And match response.message == 'Não é possível realizar GET em /usuariosx. Acesse https://serverest.dev para ver as rotas disponíveis e como utilizá-las.'
    And match response == read ('classpath:schemas/validarSchemaMessage.json')