package com.crowdar.tella.steps;
import com.crowdar.core.PageSteps;
import com.crowdar.tella.services.ServersService;
import com.crowdar.tella.services.SettingsService;
import io.cucumber.java.en.*;

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
}
