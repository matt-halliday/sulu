Feature: Media upload
    In order to organize my medias
    As a user
    I need to be able to upload medias

    Background:
        Given I am logged in as an administrator

    Scenario: Upload new media
        Given the media collection "Foobar" exists
        When I am editing the media collection "Foobar"
        And I attach the file "images/image1.png" to the current drop-zone
        And I attach the file "images/image2.png" to the current drop-zone
        And I attach the file "images/image3.jpg" to the current drop-zone
        And I attach the file "images/image4.jpg" to the current drop-zone
        Then I expect a success notification to appear
        And I expect to see "4" ".datagrid-container .item" elements

    Scenario: Upload new version
         Given the media collection "Foobar" exists
         And the file "image1.png" has been uploaded to the "Foobar" collection
         When I am editing the media collection "Foobar"
         Then I expect to see "1" ".item" elements
         And I double click the data grid item "image1.png"
         And I expect an overlay to appear
         And I expect to see "Click or drag and drop new version"
         And I attach the file "images/image2.png" to the current drop-zone
         And I expect a success notification to appear
         And I click the overlay tab "History"
         And I expect to see "1" ".media-edit-versions-link" elements
         #FIXME: Why is there only one version
         #And I expect to see "2" ".media-edit-versions-link" elements
