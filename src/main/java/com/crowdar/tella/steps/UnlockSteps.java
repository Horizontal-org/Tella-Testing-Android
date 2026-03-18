package com.crowdar.tella.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.tella.services.UnlockService;
import io.cucumber.java.en.*;

public class UnlockSteps extends PageSteps {

    @Given("The app is loaded correctly with a password set")
    public void isHomePageVisibleWithPassword() throws InterruptedException {
        Thread.sleep(500);
        UnlockService.isViewLoadedReopenAppWithPassword();
    }

    @Given("The app is loaded correctly with a pin set")
    public void theAppIsLoadedCorrectlyWithAPinSet() {
        UnlockService.isViewLoadedReopenAppWithPin();
    }


    @When("the user enters the password \"(.*)\"")
    public void theUserEnterAPassword(String password) throws InterruptedException {
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

    @When("the user draws a pattern connecting at least {int} dots")
    public void theUserSetAPattern(int dots) {
        UnlockService.setPattern(dots);
    }

    @And("the user taps the Next Pattern button")
    public void theUserTapsTheNextPatternButton() {
        UnlockService.clickNextPatternButton();
    }

    @Then("the Next button remains disabled")
    public void theNextButtonRemainsDisabled() {
        UnlockService.validateNextButtonIsDisabled();
    }
}

