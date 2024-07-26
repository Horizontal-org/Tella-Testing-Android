package com.crowdar.tella.steps;
import com.crowdar.core.PageSteps;
import com.crowdar.tella.services.ServersService;
import com.crowdar.tella.services.SettingsService;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

import java.util.List;

public class ServersSteps extends PageSteps {
    @When("the user presses the + button")
    public void theUserPressesTheButton() {
       ServersService.clickPlusButton();
    }
    @Then("the user sees all possible server options available for connection")
    public void theUserSeesAllPossibleServerOptionsAvailableForConnection(List<String> listServer) {
        ServersService.viewConectionsServerOptions(listServer);
    }

    @And("^clicks on the option (.*)$")
    public void clicksOnTheOptionsServers(String option) {
        SettingsService.clickCategory(option);
    }

    @And("^selects the server \"(.*)\"$")
    public void selectsTheServer(String server) {
        ServersService.selectServer(server);
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
    public void theUserViewsTheMessage(String message) {
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
}
