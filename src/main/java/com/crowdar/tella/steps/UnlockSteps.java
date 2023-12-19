package com.crowdar.tella.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.tella.services.UnlockService;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class UnlockSteps extends PageSteps {

    @Given("The app is loaded correctly")
    public void isLoginPageVisible() {
        UnlockService.isViewLoaded();
    }

    @When("The user set a password (.*)")
    public void theUserLockedAPassword(String password) {
        UnlockService.setPassword(password);
    }

    @When("The user click the go to tella button")
    public void goTellaProcess() {
        UnlockService.goTella();
    }

    @When("The user set a pin (.*)")
    public void theUserSetAPin(String pin) {
        UnlockService.setNumbers(pin);
    }

    @When("The user set a pattern")
    public void theUserSetAPattern() {
        UnlockService.setPattern();
    }
}
