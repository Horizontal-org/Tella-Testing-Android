package com.crowdar.tella.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.core.actions.WebActionManager;
import com.crowdar.tella.constants.AudioConstants;
import com.crowdar.tella.constants.FilesConstants;
import com.crowdar.tella.constants.ServersConstants;
import com.crowdar.tella.services.FilesService;
import com.crowdar.tella.services.GenericService;
import com.crowdar.tella.services.ServersService;
import com.crowdar.tella.services.SettingsService;
import io.cucumber.java.en.*;
import org.testng.Assert;

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

    @And("^clicks on the option (.*)$")
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
    public void theUserViewsTheMessage(String message) throws InterruptedException {
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

    @And("^the user views the fields \"(.*)\" and \"(.*)\"$")
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

    @And("the sucessfull message \"(.*)\" appears")
    public void theSucessfullMessageAppears(String message) throws InterruptedException {
        ServersService.viewMessage(message);
    }


    @And("the user is connected to the Google drive server")
    public void theUserIsConnectedToTheServer() {
        SettingsService.clickSettingsIcon();
        SettingsService.clickCategory("Servers");
        ServersService.clickPlusButton();
        ServersService.selectButton("Google drive");
        ServersService.pressButton("OK");
        GenericService.confirmLeaveTellaButton();
        GenericService.pickGoogle();
        ServersService.googleDrive();
    }
}

