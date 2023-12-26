package com.crowdar.tella.report;

import com.crowdar.driver.DriverManager;

import io.appium.java_client.MobileElement;
import io.lippia.reporter.ltm.TestManagerAPIAdapter;
import io.appium.java_client.AppiumDriver;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;

import java.sql.SQLException;

import static java.sql.DriverManager.getDriver;

public class TestManagerReporter extends TestManagerAPIAdapter {

    public TestManagerReporter(String arg) {
        super();
    }

    @Override
    public String getBase64Image() {
        try {
            AppiumDriver<MobileElement> androidDriver = (AppiumDriver<MobileElement>) getDriver("android");
            return ((TakesScreenshot) androidDriver).getScreenshotAs(OutputType.BASE64);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        //return  ((TakesScreenshot) DriverManager.getDriverInstance()).getScreenshotAs(OutputType.BASE64);

    }

}