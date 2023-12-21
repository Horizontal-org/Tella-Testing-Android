package com.crowdar.tella.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.tella.services.UnlockService;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class UnlockSteps extends PageSteps {

    @Given("The app is loaded correctly with a password (.*) set")
    public void isHomePageVisibleWithPassword(String password) {
        UnlockService.isViewLoaded();
        UnlockService.setPassword(password);
        UnlockService.goTella();
        UnlockService.clickExit();
        UnlockService.tapTellaApp();
    }

    @Given("The app is loaded correctly with a pin (.*) set")
    public void theAppIsLoadedCorrectlyWithAPinSet(String pin) {
        UnlockService.isViewLoaded();
        UnlockService.setNumbers(pin);
        UnlockService.goTella();
        UnlockService.clickExit();
        UnlockService.tapTellaApp();
    }
    @When("The user enter the password (.*)")
    public void theUserEnterAPassword(String password) {
        UnlockService.enterPassword(password);
    }
    @When("The user click the go to tella button")
    public void goTellaProcess() {
        UnlockService.goTella();
    }

    @When("The user enter the pin (.*)")
    public void theUserSetAPin(String pin) {
        UnlockService.enterPin(pin);
    }

    @When("The user set a pattern")
    public void theUserSetAPattern() {
        UnlockService.setPattern();
    }


}

