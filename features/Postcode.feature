Feature: Find blokouderling based on postcode
  In order to find my blokouderling
  As a community member
  I want to simply enter my postal code

  Scenario Outline: Find blokouderling based on valid, in scope postal code
    Given I live in this postal code area <postal code>
    When I search for my blokouderling at "<page>"
    Then the <ouderling> and <email> should be shown
    Examples:
    | page          | postal code | ouderling     | email                  |
    | inschrijven   | 2801AA      | "Jan de Wit"  | "jpdewit@kpnplanet.nl" |
    | inschrijven   | 2805CZ      | "Anne Bosman" | "a.bosman@solcon.nl"   |
    | wijkouderling | 2801AA      | "Jan de Wit"  | "jpdewit@kpnplanet.nl" |
    | wijkouderling | 2805CZ      | "Anne Bosman" | "a.bosman@solcon.nl"   |

  Scenario Outline: If postal code is out of scope, a helpful message should be given
    Given I live in this postal code area <postalcode>
    When I search for my blokouderling at "<page>"
    Then this message should be shown: "<message>"
    Examples:
      | page          | postalcode | message                                                                                                                                 |
      | inschrijven   | 3434GH     | Voor deze postcode kon geen ouderling gevonden worden. Neem alstublieft contact op met de coordinator_pastoraat@sintjansgemeente.nl |
      | wijkouderling | 3434GH     | Voor deze postcode kon geen ouderling gevonden worden. Neem alstublieft contact op met de coordinator_pastoraat@sintjansgemeente.nl |

