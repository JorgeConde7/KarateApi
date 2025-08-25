
Feature: Buscar usuario por ID

  Background:
    * url 'https://serverest.dev'
    * def usuario = call read('classpath:features/usuarios/crearUsuario.feature@RegistrarUsuarioValido')

  Scenario: Buscar usuario existente
    * def user = read('classpath:data/expectedUser.json')
    Given path 'usuarios', usuario.response._id
    When method GET
    Then status 200
    And match response contains { _id: '#string', nome: '#string', email: '#string' }

  Scenario: Buscar usuario inexistente
    Given path 'usuarios', 'sdfsdfasdasdasds'
    When method GET
    Then status 400
    And match response contains { message: 'Usuário não encontrado' }

  Scenario: Validar error cuando el id tiene menos de 16 caracteres
    Given path 'usuarios', 'abc'
    When method GET
    Then status 400
    And match response contains { id: 'id deve ter exatamente 16 caracteres alfanuméricos' }

