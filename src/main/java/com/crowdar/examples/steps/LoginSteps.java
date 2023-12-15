package com.crowdar.examples.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.core.PropertyManager;
import com.crowdar.examples.services.LoginService;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;


public class LoginSteps extends PageSteps {

    @Given("The app is loaded correctly")
    public void isLoginPageVisible() {
        LoginService.isViewLoaded();
    }
    @When("The user set a password (.*)")
    public void theUserLockedAPassword(String password) {
        LoginService.setPassword(password);
    }

    @When("The user click the go to tella button")
    public void goTellaProcess() {
        LoginService.goTella();
    }

    @When("The user set a pin (.*)")
    public void theUserSetAPin(String pin) {
        LoginService.setNumbers(pin);
    }

    @When("The user set a pattern")
    public void theUserSetAPattern() {
        LoginService.setPattern();
    }
}
