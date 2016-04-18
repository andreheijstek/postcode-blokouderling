Feature: Find blokouderling based on postcode
  In order to find my blokouderling
  As a community member
  I want to simply enter my postal code

  Scenario Outline: Find blokouderling based on valid, in scope postal code
    Given I live in this postal code area <postal code>
    When I search for my blokouderling
    Then the <ouderling> and <email> should be shown
    Examples:
    | postal code | ouderling     | email                  |
    | 2801AA      | "Jan de Wit"  | "jpdewit@kpnplanet.nl" |
    | 2805CZ      | "Anne Bosman" | "a.bosman@solcon.nl"   |



