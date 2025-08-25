Feature: Actualizar usuario

  Background:
    * url 'https://serverest.dev'

  Scenario: Actualizar usuario con datos válidos
    Given path 'usuarios', 'LCZANvjBwhFeoKny'
    And request { nome: 'Jorge Conde', email: 'userb8287382-f949-4580-b151-46adf10a377b@mail.com', password: 'abcd', administrador: 'true' }
    When method PUT
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

  Scenario: Validar que no permita actualizar con un correo en uso
    * def body = read('classpath:schemas/actualizarUsuarioIncorrecto.json')
    Given path 'usuarios', 'cxCut6aCwFW6kjdX'
    And request body
    When method PUT
    Then status 400
    And match response.message == 'Este email já está sendo usado'