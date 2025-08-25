Feature: Crear usuario

  Background:
    * url 'https://serverest.dev'
    * path 'usuarios'
    * def randomEmail = 'user' + java.util.UUID.randomUUID() + '@mail.com'

  @RegistrarUsuarioValido
  Scenario: Registrar usuario válido
    Given request { nome: 'Juan Pérez', email: '#(randomEmail)', password: '1234', administrador: 'true' }
    When method POST
    Then status 201
    And match response contains { message: 'Cadastro realizado com sucesso' }

  @RegistrarUsuarioEmailExistente
  Scenario: Intentar registrar usuario con email existente
    Given request { nome: 'Juan Pérez', email: 'teste@qa.com', password: '1234', administrador: 'false' }
    When method POST
    Then status 400
    And match response.message == 'Este email já está sendo usado'