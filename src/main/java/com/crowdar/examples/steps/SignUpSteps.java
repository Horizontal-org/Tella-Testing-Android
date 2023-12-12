package com.crowdar.examples.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.examples.services.SignUpService;
import cucumber.api.java.en.When;

/**
 * This class handles the steps in the features files and connects with the service in case of having business logic.
 * Otherwise, if it is a simple action, like clicking a button and it has nothing related to business logic, is correct to put here.
 */
public class SignUpSteps extends PageSteps {

    @When("The user registers a new user with: (.*), (.*), (.*)")
    public void doSignUpProcess(String username, String email, String password) {
        SignUpService.doSignUp(username, email, password);
    }

}
