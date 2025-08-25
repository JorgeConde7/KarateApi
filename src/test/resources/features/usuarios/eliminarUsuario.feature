Feature: Eliminar usuario

  Background:
    * url 'https://serverest.dev'
    * def usuario = call read('classpath:features/usuarios/crearUsuario.feature@RegistrarUsuarioValido')

  @EliminarUsuarioexistente
  Scenario: Eliminar usuario existente
    Given path 'usuarios', usuario.response._id
    When method DELETE
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

  @EliminarUsuarioInexistente
  Scenario: Eliminar usuario inexistente
    Given path 'usuarios', 'abcdefghijlmnop'
    When method DELETE
    Then status 200
    And match response.message == 'Nenhum registro excluído'