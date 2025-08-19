@TellaDesktop @NearbySharing  @Received

Feature: NearbySharing and Received
  #De momento la app de escritorio solo puede recibir archivos NO enviarlos


  @Received
  Scenario: Received files
  #aca se pueden ver los archivos recibidos, aun no podemos ver como es esta funcion
  Given
  When
  Then

  @NearbySharing
  Scenario: Nearby Sharing - Step 1
    Given el usuario esta conectado a la misma linea wifi con sus dos dispositivos (PC y movil)
    When el usuario selecciona el checkbox "Yes, we are on the same Wi-Fi network"
    And el usuario presiona el botton "Continue"
    Then el usuario esta en el step 2 de nearby sharing

  @NearbySharing  @Fail
  Scenario: Nearby Sharing - Step 1
    Given el usuario esta conectado a la misma linea wifi con sus dos dispositivos
    When el usuario NO selecciona el checkbox "Yes, we are on the same Wi-Fi network"
    And el usuario presiona el botton "Continue"
    Then el boton continue permanece deshabilitado

    #Probar un caso de si se puede conectar aunque esten en dos redes diferentes los dispositivos

  @NearbySharing
  Scenario: Nearby Sharing - Step 2 - Manual Connection
    Given la informacion de "IP ADDRESS", "PIN" y "Port" es visible
    When el usuario configura el "Ip ADDRESS", "PIN" y "Port" en su celular
    And los datos coinciden con los de tella desktop
    Then los dipositivos se conectan automaticamente
    #revisar este caso luego cuando se pueda ver

  @NearbySharing @Fail
  Scenario Outline: Nearby Sharing - Step 2 - Manual Connection fail by wrong data <dato>
    Given el usuario tiene configurado el dato <dato> en su pc
    When el usuario configura el <dato> con valor <valor> en su celular
    Then los dipositivos no se conectan automaticamente
    #revisar este caso luego cuando se pueda ver

    Examples:
      | dato       | valor                         |
      | Ip ADDRESS | 000.000.000.00, 000.000.000.0 |
      | PIN        | 000000                        |
      | Port       | 00000                         |


  @NearbySharing
  Scenario: Nearby Sharing - Step 2 - Automatic connection with QR code
    Given la informacion de "IP ADDRESS", "PIN" y "Port" es visible
    When el usuario presiona el botton "See QR code"
    Then los dipositivos se conectan automaticamente
    #revisar este caso luego cuando se pueda ver

  @Received
  Scenario: Exit nearby sharing
    Given el usuario esta en el step 2 de nearby sharing
    When el usuario presiona el boton "Received"
    And el usuario vera un cartel de advertencia "If you exit Nearby Sharing, you will have to restart the process from the beginning."
    And el usuario presiona el boton "Exit"
    Then el usuario se encuentra en la seccion "Received"

  @Received
  Scenario: Cancel Exit nearby sharing
    Given el usuario esta en el step 2 de nearby sharing
    When el usuario presiona el boton "Received"
    And el usuario vera un cartel de advertencia "If you exit Nearby Sharing, you will have to restart the process from the beginning."
    And el usuario presiona el boton "Continue nearby Sharing"
    Then el usuario esta en el step 2 de nearby sharing
