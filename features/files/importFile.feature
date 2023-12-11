Feature: Import Files in Tella

Background:
Given I have an account on Tella
And I log in to Tella
And I am inside one of the main folders in the "files" section
And there are valid files on my device

Scenario Outline: Import an image file to Tella
When I select the option to import a file
And I choose to keep the original
And I select a file of type <type> from the device
Then the file is saved in the "Images" folder
And the <type> file appears in the list of files in the "Images" folder

Examples:
| type |
| .jpg |
| .png |

Scenario Outline: Import a video file to Tella
When I select the option to import a file
And I choose to keep the original
And I select a file of type <type> from the device
Then the file is saved in the "Videos" folder
And the <type> file appears in the list of files in the "Videos" folder

Examples:
| type |
| .MP4 |
| .MOV |

Scenario Outline: Import an audio file to Tella
When I select the option to import a file
And I choose to keep the original
And I select a file of type <type> from the device
Then the file is saved in the "Audios" folder
And the <type> file appears in the list of files in the "Audios" folder

Examples:
| type |
| .MP3 |
| .AAC |

Scenario Outline: Import a document file to Tella
When I select the option to import a file
And I choose to keep the original
And I select a file of type <type> from the device
Then the file is saved in the "Documents" folder
And the <type> file appears in the list of files in the "Documents" folder

Examples:
| type |
| .PDF |
| .DOCX |
| .EXEL |

Scenario Outline: Import a file to Tella by deleting the original
When I select the option to import a file
And I choose to delete the original
And I import the file
Then the <type> file appears in the list of files in the <folder> folder
And the original file is deleted from the device

Examples:
| type | folder |
| image | Images |
| video | Videos |
| audio | Audios |
| document | Documents |

Scenario Outline: Import a duplicate file in Tella
When I select the option to import a file
And I import a <type> file that already exists in Tella
Then the duplicate file is imported correctly with a different name
And the file is visible in the <folder> folder

Examples:
| type | folder |
| image | Images |
| video | Videos |
| audio | Audios |
| document | Documents |