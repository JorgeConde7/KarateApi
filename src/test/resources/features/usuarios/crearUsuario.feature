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
    And match response == read ('classpath:schemas/validarSchemaCreacionUsuario.json')

  @RegistrarUsuarioEmailExistente
  Scenario: Intentar registrar usuario con email existente
    Given request { nome: 'Juan Pérez', email: 'teste@qa.com', password: '1234', administrador: 'false' }
    When method POST
    Then status 400
    And match response.message == 'Este email já está sendo usado'
    And match response == read ('classpath:schemas/validarSchemaMessage.json')

  @RegistrarUsuarioValidoconDataGeneradoDesdeArchivoJS
  Scenario: Registrar usuario válido
    * def randomEmail2 = call read('classpath:Utilitarios/generarEmail.js')
    * print 'Email generado:', randomEmail2
    Given request { nome: 'Juan Pérez', email: '#(randomEmail2)', password: '1234', administrador: 'true' }
    When method POST
    Then status 201
    And match response contains { message: 'Cadastro realizado com sucesso' }
    And match response == read ('classpath:schemas/validarSchemaCreacionUsuario.json')