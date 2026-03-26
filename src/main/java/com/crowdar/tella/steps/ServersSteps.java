package com.crowdar.tella.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.core.PropertyManager;
import com.crowdar.tella.services.*;
import io.cucumber.java.en.*;

import java.util.List;

public class ServersSteps extends PageSteps {
    @When("the user presses the + button")
    public void theUserPressesTheButton() {
        ServersService.clickPlusButton();
    }

    @Then("the user sees all possible (.*) options available for connection")
    public void theUserSeesAllPossibleServerOptionsAvailableForConnection(List<String> listServer) {
        ServersService.viewConectionsServerOptions(listServer);
    }

    @And("^the user clicks on the option (.*)$")
    public void clicksOnTheOptionsServers(String option) {
        SettingsService.clickCategory(option);
    }

    @And("^selects the server \"(.*)\"$")
    public void selectsTheServer(String server) {
        ServersService.selectButton(server);
    }

    @And("^the user presses \"(.*)\" button$")
    public void theUserPresses(String button) {
        ServersService.pressButton(button);
    }

    @Then("^the user views the server (.*) settings$")
    public void theUserEntersTheServerSettings(String server) {
        ServersService.viewSettingServer(server);
    }

    @And("^enter the sever name (.*)$")
    public void enterTheSeverName(String serverName) {
        ServersService.inputServerName(serverName);
    }

    @And("^enter the server url \"(.*)\"$")
    public void enterTheServerUrl(String serverUrl) {
        ServersService.inputServerUrl(serverUrl);
    }

    @Then("^the user views the message (.*)$")
    public void theUserViewsTheMessage(String message){
        ServersService.viewMessage(message);
    }

    @And("^the user views the (.*) in the connect list$")
    public void theUserViewsTheInTheConnectList(String serverName) {
        ServersService.viewServerOnTheList(serverName);
    }

    @Then("^the user views the \"(.*)\"$")
    public void theUserViewsTheLoginToAccessTheProject(String titleLogin) {
        ServersService.viewLoginToProject(titleLogin);
    }

    @And("^the user fills the fields \"(.*)\" and \"(.*)\"$")
    public void theUserViewsTheFieldsAnd(String username, String password) {
        ServersService.viewFieldsLogin(username, password);
    }

    @Then("the user views the buttons:")
    public void theUserViewsTheButtons(List<String> listAccessButton) {
        ServersService.viewListAccessButton(listAccessButton);

    }

    @And("^selects the \"(.*)\" button$")
    public void selectsTheButton(String buttonAccess) {
        ServersService.selectButton(buttonAccess);
    }

    @And("^the user selects the language (.*)$")
    public void theUserSelectsTheLanguage(String language) {
        ServersService.selectLanguage(language);
    }

    @Then("^the user view the message \"(.*)\"$")
    public void theUserViewTheMessage(String message) {
        ServersService.viewConnectMessage(message);
    }

    @And("^the user is now connected to Uwazi server in (.*)$")
    public void theUserIsNowConnectedToUwaziServerIn(String language) {
    }

    @And("the user is connected to the Tella Web server")
    public void theUserIsConnectedToTheTellaWebServer() {
        SettingsService.clickSettingsIcon();
        SettingsService.clickCategory("Servers");
        ServersService.clickPlusButton();
        ServersService.selectButton("Tella Web");
        ServersService.pressButton("OK");
        ServersService.inputServerUrl("https://tella.world/p/server-project-crowdar");
        ServersService.pressButton("Next");
        ServersService.connectToTellaServer();
    }

    @When("^the user taps the \"(.*)\" connection$")
    public void theUserTapsTheConnection(String connection) {
        ServersService.tapsConnection(connection);
    }

    @And("^completes the Title \"(.*)\" and the Description \"(.*)\"$")
    public void completesTheTitleAndTheDescription(String title, String description) {
        ServersService.completeReport(title, description);
    }

    @And("the user taps + button for the attach files")
    public void theUserTapsButtonForTheAttachFiles() {
        ServersService.clickAttachFiles();
    }

    @And("^selects files option \"(.*)\"$")
    public void selectsFilesOption(String filesOptions) {
        ServersService.selectFiles(filesOptions);
        FilesService.acceptPermissions();
        FilesService.acceptPermissions();
    }

    @And("the user presses the button for take a photo")
    public void theUserPressesTheButtonForTakeAPhoto() {

        ServersService.takePhoto();
    }

    @And("^the file whith title \"(.*)\" and description \"(.*)\" being uploaded$")
    public void theFileWhithTitleAndDescriptionBeingUploaded(String title, String description) {
        ServersService.viewFileUpload(title, description);
    }

    @And("^the sucessfull message \"(.*)\" appears$")
    public void theSucessfullMessageAppears(String message){
        ServersService.viewMessage(message);
    }


    @And("the user is connected to the Google drive server")
    public void theUserIsConnectedToTheServer() {
        SettingsService.clickSettingsIcon();
        SettingsService.clickCategory("Connections");
        ServersService.clickPlusButton();
        ServersService.selectButton("Google drive");
        LockService.clickContinue();
        //Verificar cuenta de google antes de continuar
        //ServersService.clickNextBtn();
        //GenericService.confirmLeaveTellaButton();
        //GenericService.pickGoogle();
        //ServersService.googleDrive();
    }

    @And("the user presses OK button")
    public void theUserPressesOKButton() {
        ServersService.okServerButton();
    }

    @And("^the user enters the credentials of (.*)$")
    public void theUserEntersTheCredentials(String serverName) {
        ServersService.inputServerCredencialCredentials(serverName);
    }


    @And("the user presses Log in button")
    public void theUserPressesLogInButton() {
        GenericService.clickByCoordinates(550, 1300);
    }

    @And("the user uses a Gmail account")
    public void theUserUsesAGoogleAccount() {
        ServersService.googleDriveUserInput();
    }

    @And("the user enters a valid Gmail password")
    public void theUserEntersAValidGmailPassword() throws InterruptedException {
        ServersService.googleDrivePasswordInput();
    }

    @And("the user can see the Welcome message and agrees with the terms and conditions")
    public void theUserCanSeeTheWelcomeMessageAndAgreesTheTermsAndConditions() throws InterruptedException {
        ServersService.googleDriveAgreeTerms();
    }

    @And("the user accepts the permissions")
    public void theUserAcceptsThePermissions() throws InterruptedException {
        ServersService.googleDriveAcceptPermissions();
    }

    @And("the user creates a new Google Drive folder called (.*)")
    public void theUserCreatesANewGoogleDriveFolder(String folder) {
        ServersService.googleDriveNewFolder(folder);
    }

    @And("the user accepts the additional permissions if needed")
    public void theUserAcceptsTheAdditionalPermissions() {
        ServersService.googleDriveAdditionalPermissions();
    }

    @And("the user can see the Connected to server message and clicks GO TO GOOGLE DRIVE")
    public void theUserCanSeeTheConnectedToServerMessage() {
        ServersService.connectedToServerMsg();
    }

    @Then("the user can see the (.*) connection in the home page")
    public void theUserCanSeeTheGoogleDriveConnectionInTheHomePage(String serverName) throws InterruptedException {
        SettingsService.clickBackButton();
        HomeService.isAConnectionVisible(serverName);
    }

    @And("the user chooses an existing Google account")
    public void theUserChoosesAnExistingGoogleAccount()  {
        ServersService.clickExistingGoogleAccount();
    }

    @And("the user presses the Agree and share button if needed")
    public void theUserPressesTheAgreeAndShareButton() {
        ServersService.clickAgreeAndShare();
    }

    @And("the user presses the Add another account button if needed")
    public void theUserPressesTheAddAnotherAccountButtonIfNeeded() {
        ServersService.clickAddAnotherGoogleAccount();
    }

    @And("the user creates an Open Data Kit connection")
    public void theUserCreatesAnODKConnection() {
        ServersService.clickPlusButton();
        ServersService.selectButton("Open Data Kit (ODK)");
        ServersService.pressButton("OK");
        ServersService.inputServerName("Tella");
        ServersService.inputServerUrl(PropertyManager.getProperty("odkserver"));
        ServersService.clickAdvancedODK();
        ServersService.inputServerCredencialCredentials("Open Data Kit (ODK)");
        ServersService.pressButton("SAVE");
        SettingsService.goToHomeFromASettingPage();
    }

    @And("the user taps the refresh button in the Blank tab")
    public void theUserTapsTheRefreshButtonInTheBlankTab() {
        ServersService.clickRefreshODK();
    }

    @And("the user taps the download button on the first form")
    public void theUserWaitsATapsTheDownloadButtonOnTheFirstForm() throws InterruptedException {
        ServersService.clickDownloadFirstODK();
    }

    @Then("the message \"(.*)\" appears on the screen")
    public void theApprovalMessageAppears(String message) {
        ServersService.viewMessage(message);
    }

    @And("the user taps the first form to fill out")
    public void theUserTapsTheFirstFormToFillOut() throws InterruptedException {
        ServersService.clickFirstFormODK();
    }

    @And("the user completes all required fields in Ari's test")
    public void theUserCompletesAllTheRequiredFields() throws InterruptedException {
        ServersService.completeFormAriTestODK();
    }

    @And("the user taps the next form button")
    public void theUserTapsTheNextFormButton() {
        ServersService.clickNextButtonODKForm();
    }

    @And("the user taps the clock icon")
    public void theUserTapsTheClockIcon() {
        ServersService.clickSaveForLaterODK();
    }

    @Then("the form \"(.*)\" should be in the \"(.*)\" tab")
    public void theFormShouldBeInTheTab(String formName, String tab) {
        ServersService.isFormPresentInTab(formName, tab);
    }

    @And("the user taps the Save icon")
    public void theUserTapsTheSaveIcon() {
        ServersService.clickSaveFormODK();
    }

    @And("the user closes the form")
    public void theUserClosesTheForm() {
        ServersService.clickCloseForm();
    }

    @And("the user taps the \"(.*)\" tab")
    public void theUserTapsTheTab(String tab) {
        ServersService.clickTabODK(tab);
    }

    @Given("the user has a saved form in the \"(.*)\" tab")
    public void theUserHasASavedFormInTheTab(String tab) throws InterruptedException {
        HomeService.clickConnection("Forms");
        ServersService.clickRefreshODK();
        ServersService.clickDownloadFirstODK();
        ServersService.clickFirstFormODK();
        ServersService.completeFormAriTestODK();
        ServersService.sendFormToDraftOutbox(tab);
    }

    @When("the user taps the ⁝ button")
    public void theUserTapsTheButton() {
        ServersService.clickOptionForm();
    }

    @And("the user selects Delete")
    public void theUserSelectsDelete() {
        ServersService.clickDeleteForm();
    }
}

