package com.crowdar.tella.services;

import com.crowdar.core.actions.MobileActionManager;
import com.crowdar.driver.DriverManager;
import junit.framework.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;


import java.util.List;

import static com.crowdar.tella.constants.PhotographyAndVideoServiceConstants.*;

public class PhotographyAndVideoService {


    public static void tapGridButtonAssert(){
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        boolean isElementEnabled = driver.findElements(By.xpath(CAMERA_GRID_SHOW)).isEmpty();
        Assert.assertEquals("El elemento no está activado", true, isElementEnabled);
    }


    public static void videoResolutionAssert(){
        WebDriver driver = DriverManager.getDriverInstance().getWrappedDriver();
        List<WebElement> elements = driver.findElements(By.xpath(VIDEO_HIGHEST_POSIBLE_OPTION));
        boolean isElementSelected = !elements.isEmpty() && elements.get(0).isSelected();
        Assert.assertTrue("El elemento no está seleccionado", isElementSelected);
    }


}
