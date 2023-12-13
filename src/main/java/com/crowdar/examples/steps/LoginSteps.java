package com.crowdar.examples.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.core.PropertyManager;
import com.crowdar.examples.services.LoginService;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;


public class LoginSteps extends PageSteps {


    private final String password = PropertyManager.getProperty("password");
    @Given("The app is loaded correctly and locked a password")
    public void isLoginPageVisible() {
        LoginService.isViewLoaded(password);
    }


    @When("The user click the go to tella button")
    public void goTellaProcess() {
        LoginService.goTella();
    }


}
