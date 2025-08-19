@TellaDesktop @RegisterAndLogIn

Feature: Register, Login and Lock Tella Desktop

  @Register
  Scenario: Register a new account Successfully
    Given el usuario abre por primera vez la aplicacion
    When el usuario setea una password "Password2025"
    And el usuario presiona el boton "Next"
    And el usuario confirma la contraseña "Password2025"
    And el usuario presiona el boton "Save"
    Then el usuario vera el cartel de "Success!"
    And el usuario presiona el boton "Go to tella"

  @Register @Fail
  Scenario Outline: Register new account Failed by wrong lenght password
    Given el usuario abre por primera vez la aplicacion
    When el usuario setea una password <Password1>
    Then el usuario vera el cartel <fail>
    And el boton "Next" estara deshabilitado

    Examples:
      | Password1 | fail                       |
      | 123       | your password is too short |

  @Register @Fail
  Scenario Outline: Register new account Failed by wrong password
    Given el usuario abre por primera vez la aplicacion
    When el usuario setea una password <Password1>
    And el usuario presiona el boton "Next"
    And el usuario confirma la contraseña <Password2>
    Then el usuario vera el cartel <fail>
    And el boton "Save" estara deshabilitado

    Examples:
      | Password1 | Password2 | fail                                                                   |
      | 123456ABC | ABC123456 | the password does not match the one you entered in the previous screen |


  @Login
  Scenario: Login Success
  Given el usuario ya tiene una cuenta creada en la aplicacion de tella desktop
  When el usuario ingresa una password valida
    And el usuario presiona el boton "Log in"
  Then el usuario se loguea con exito a la aplicacion

  @Login @Fail
  Scenario: Login Failed
    Given el usuario ya tiene una cuenta creada en la aplicacion de tella desktop
    When el usuario ingresa una password erronea
    And el usuario presiona el boton "Log in"
    Then el usuario vera el cartel "Invalid password"
    And el usuario no podra entrear a la aplicacion



  Scenario: Lock Tella desktop
  #aun no podemos ver como es esta funcion
  Given
  When
  Then
