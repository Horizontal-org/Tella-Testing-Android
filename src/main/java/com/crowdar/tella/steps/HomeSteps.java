package com.crowdar.tella.steps;

import com.crowdar.core.PageSteps;
import com.crowdar.tella.services.HomeService;
import com.crowdar.tella.services.UnlockService;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;


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
