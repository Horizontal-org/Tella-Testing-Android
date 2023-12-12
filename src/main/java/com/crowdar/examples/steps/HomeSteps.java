package com.crowdar.examples.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.examples.constants.HomeConstants;
import com.crowdar.examples.services.HomeService;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

/**
 * This class handles the steps in the features files and connects with the service in case of having business logic.
 * Otherwise, if it is a simple action, like clicking a button and it has nothing related to business logic, is correct to put here.
 */
public class HomeSteps extends PageSteps {

    @Then("Home page is displayed")
    public void isHomePageVisible() {
        HomeService.isViewLoaded();
    }

    @When("The user changes the language")
    public void doChangeLanguage() {
        MobileActionManager.click(HomeConstants.CHANGE_LANGUAGE_BUTTON_LOCATOR);
    }

    @When("The user log out of the app")
    public void doSignOut() {
        MobileActionManager.click(HomeConstants.SIGN_OUT_BUTTON_LOCATOR);
    }

}
