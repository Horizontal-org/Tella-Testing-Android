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


}
