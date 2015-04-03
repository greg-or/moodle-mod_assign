@mod @mod_glossary
Feature: A teacher can edit an entry from navigation in 'Entry list' format
  In order to edit an entry in Entry list format
  As a teacher
  I need to click 'Edit entry' from navigation block

  Scenario: Glossary entries are not always editable
    Given the following "users" exist:
      | username | firstname | lastname | email |
      | teacher1 | Teacher | 1 | teacher1@asd.com |
      | student1 | Student | 1 | student1@asd.com |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1 | 0 |
    And the following "course enrolments" exist:
      | user | course | role |
      | teacher1 | C1 | editingteacher |
      | student1 | C1 | student |
    And I log in as "teacher1"
    And I follow "Course 1"
    And I turn editing mode on
    And I add a "Glossary" to section "1" and I fill the form with:
      | Name | Test glossary name |
      | Description | Test glossary description |
      | Display format | Entry list |
    And I follow "Test glossary name"
    When I add a glossary entry with the following data:
      | Concept | Test concept name |
      | Definition | Test concept description |
    Then "Delete: Test concept name" "link" should exist
    And "Edit: Test concept name" "link" should exist
    And I follow "Test concept name"
    Then "Edit entry" "link" should exist
    And I follow "Edit entry"
    When I set the field "Concept" to "Test concept name - edit"
    And I press "Save changes"
    And I follow "Edit: Test concept name - edit"
    Then "Edit entry" "link" should exist
