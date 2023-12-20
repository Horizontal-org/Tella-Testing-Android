package com.crowdar.tella.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.tella.services.HomeService;
import com.crowdar.tella.services.UnlockService;
import cucumber.api.java.en.Then;
import io.cucumber.java.en.Given;


public class HomeSteps extends PageSteps {

    @Then("Home page is displayed")
    public void isHomePageVisible() {
        HomeService.isHomeLoaded();
    }

    @Given("The user opens the app for the first time")
    public void theUserOpensTheAppForTheFirstTime() {
        UnlockService.isViewLoaded();
    }
}
