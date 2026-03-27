package com.crowdar.tella.constants;

public class ServersConstants {
    public static final String PLUS_BUTTON = "id:org.hzontal.tella:id/add_server";
    public static final String WHAT_SERVER_TITLE = "id:standard_sheet_content";
    public static final String TEXT_SERVER_BUTTON = "xpath://android.widget.TextView[@resource-id=\"org.hzontal" + ".tella:id/sheet_textView\" and @text=\"%s\"]";
    public static final String GRAL_NEXT_BUTTON = "id:org.hzontal.tella:id/next_btn";
    public static final String URL_INPUT = "id:url";
    public static final String SAVE_BUTTON = "id:next";
    public static final String SERVER_NAME_INPUT = "id:name";
    public static final String TEXT_SERVER_MSG = "xpath://android.widget.TextView[@resource-id=\"org.hzontal.tella:id/txv_msg\"]";
    public static final String SERVER_TITLE_LIST = "id:server_title";
    public static final String LOGIN_TITLE = "id:org.hzontal.tella:id/title_textView";
    public static final String LOGIN_USERNAME_INPUT = "id:username";
    public static final String LOGIN_PASSWORD_INPUT = "id:password";
    public static final String LANGUAGE_TITLE = "id:titleTv";
    public static final String TEXT_LANGUAGE_TITLE = "xpath://androidx.recyclerview.widget" + ".RecyclerView[@resource-id=\"org.hzontal.tella:id/language_recyclerView\"]/android.view.ViewGroup";
    public static final String CONNECTED_SERVER_TITLE = "id:setupMainLockTv";
    public static final String CONNECTED_SERVER_MSG = "id:setupMsgLockTv";
    public static final String TELLA_LOGIN_BUTTON = "id:sheet_textView";
    public static final String TELLA_USER_INPUT = "id:username";
    public static final String TELLA_PASS_INPUT = "id:password";
    public static final String BACK_BUTTON = "id:btn_back";
    public static final String CONNECTIONS_VIEW_GROUP = "xpath://androidx.recyclerview.widget.RecyclerView[@resource-id=\"org.hzontal.tella:id/serversRecyclerView\"]/android.view.ViewGroup";
    public static final String NEW_REPORT_BUTTON = "id:new_report_btn";
    public static final String REPORT_TITLE_INPUT = "id:report_title_et";
    public static final String REPORT_DESCRIPTION_INPUT = "id:report_description_et";
    public static final String REPORT_TITLE_TEXTVIEW = "id:startTitleTv";
    public static final String ATTACH_BUTTON = "ACCESSIBILITY_ID:Select files";
    public static final String PHOTO_FILES_SELECT = "id:cameraActionTV";
    public static final String AUDIO_FILES_SELECT = "id:recordActionTV";
    public static final String SELECT_FILES_TITLE = "id:sheetTitleTv";
    public static final String TAKE_PHOTO_BUTTON = "ACCESSIBILITY_ID:Take photo with camera";
    public static final String SUBMIT_BUTTON = "id:send_report_btn";
    public static final String TITLE_UPLOAD_TEXT = "id:title";
    public static final String DESCRIPTION_UPLOAD_TEXT = "id:form_description";
    public static final String UPLOAD_TEXT = "id:formSize";

    public static final String SERVER_LOGIN_BUTTON = "id:org.hzontal.tella:id/sheet_textView";
    public static final String LOGIN_SERVER_USERNAME = "id:org.hzontal.tella:id/username";
    public static final String LOGIN_SERVER_PASSWORD = "id:org.hzontal.tella:id/password";
    public static final String CONNECTED_TO_SERVER_MSG = "id:org.hzontal.tella:id/sheet_title";


    //google drive
    public static final String CREATE_NEW_GOOGLE_DRIVE_FOLDER = "xpath://android.widget.TextView[@resource-id=\"org.hzontal.tella:id/sheet_textView\" and @text=\"CREATE NEW FOLDER\"]";
    public static final String INPUT_FOLDER_NAME = "id:org.hzontal.tella:id/create_folder_edit";
    public static final String ASSERT_SERVER_CONNECTION = "id:sheet_title";
    public static final String GO_TO_GOOGLE_DRIVE_BUTTON = "id:sheet_textView";
    public static final String GOOGLE_LOGIN_TEXTBOX = "xpath://android.widget.EditText[@resource-id=\"identifierId\"]";
    public static final String GOOGLE_BUTTONS = "xpath://*[translate(@text,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')='%s']";
    public static final String GOOGLE_TERMS_AGREE_BUTTON = "xpath://android.widget.Button[@text=\"I agree\"]";
    public static final String GOOGLE_SHARE_AGREE_BUTTON = "xpath://android.widget.Button[@resource-id=\"com.google.android.gms:id/agree_and_share_button\"]";
    public static final String GOOGLE_ADDITIONAL_PERMISSIONS_BUTTON = "xpath://android.widget.Button[@text=\"Continue\"]";
    public static final String GOOGLE_PASSWORD_TEXTBOX = "xpath://android.widget.EditText";
    public static final String GOOGLE_LOGIN_WELCOME_MSG = "xpath://android.widget.TextView[@resource-id=\"headingText\"]";
    public static final String GOOGLE_PERMISSIONS_MSG = "xpath://android.widget.TextView[@resource-id=\"com.google.android.gms:id/sud_items_title\" and @text=\"Use basic device backup\"]";
    public static final String GOOGLE_CHOOSE_ACCOUNT_MSG = "xpath://android.widget.TextView[@resource-id=\"com.google.android.gms:id/title\"]";
    public static final String GOOGLE_FIRST_LISTED_ACCOUNT = "xpath:(//android.widget.LinearLayout[@resource-id=\"com.google.android.gms:id/container\"])[1]";
    public static final String GOOGLE_ADDITIONAL_PERMISSIONS_MSG = "xpath://android.view.View[@resource-id=\"headingText\"]";
    public static final String GOOGLE_ADD_ACCOUNT = "xpath://android.widget.TextView[@resource-id='com.google.android.gms:id/add_account_chip_title']/ancestor::android.widget.LinearLayout";

    public static final  String GOOGLE_DRIVE_FORM = "xpath://androidx.recyclerview.widget.RecyclerView[@resource-id=\"org.hzontal.tella:id/serversRecyclerView\"]/android.view.ViewGroup";

    public static final String ODK_CONNECT_ADVANCED_BUTTON = "id:org.hzontal.tella:id/toggle_button";
    public static final String ODK_REFRESH_BUTTON = "id:org.hzontal.tella:id/fab";
    public static final String ODK_DOWNLOAD_BUTTON = "id:org.hzontal.tella:id/dl_open_button";
    public static final String ODK_FIRST_FORM = "xpath://android.widget.LinearLayout[@resource-id=\"org.hzontal.tella:id/row_layout\"]/android.widget.LinearLayout";
    public static final String ODK_FORM_EDIT_TEXT = "xpath://android.widget.EditText";
    public static final String ODK_FORM_NEXT_BUTTON = "id:org.hzontal.tella:id/nextSection";
    public static final String ODK_FORM_ATTACH_FILE = "xpath://android.widget.Button[@text=\"%s\"]";
    public static final String ODK_FORM_CHECKBOX = "xpath://android.widget.CheckBox[@text=\"%s\"]";
    public static final String ODK_FORM_TEXTVIEW = "xpath:(//android.widget.TextView[@resource-id=\"android:id/text1\"])[%s]";
    public static final String ODK_FORM_CHECKED_TEXTVIEW = "xpath:(//android.widget.CheckedTextView[@resource-id=\"android:id/text1\"])[%s]";
    public static final String ODK_FORM_SAVE_OUTBOX_BUTTON = "id:org.hzontal.tella:id/saveForLaterMenuItem";
    public static final String ODK_FORM_SAVE_DRAFT_BUTTON = "id:org.hzontal.tella:id/saveFormMenuItem";
    public static final String ODK_FORM_SUBMIT_BUTTON = "id:org.hzontal.tella:id/submit_button";
    public static final String ODK_FORM_OPTION_BUTTON = "id:org.hzontal.tella:id/popupMenu";
    public static final String ODK_FORM_OPTION_DELETE_BUTTON = "id:org.hzontal.tella:id/action_delete";
    public static final String ODK_CLOSE_FORM_BUTTON = "xpath://android.widget.ImageButton[@content-desc=\"Navigate up\"]";
    public static final String ODK_TABS = "xpath://android.widget.LinearLayout[@content-desc=\"%s\"]"; //BLANK, Draft, Outbox, Submitted//
    public static final String ODK_FORM_NAME = "xpath://android.widget.TextView[@resource-id=\"org.hzontal.tella:id/name\" and @text=\"%s\"]";
    public static final String SERVER_YES_BUTTON = "id:org.hzontal.tella:id/ok";
}
