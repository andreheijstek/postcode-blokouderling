# language: nl

Functionaliteit: Vind een blokouderling op postcode
  Om mijn blokouderling te vinden
  Als gemeentelid
  Wil ik simpelweg mijn postcode kunnen invoeren en naam/email zien

  Abstract Scenario: Vind blokouderling gebaseerd op een valide, in-scope postcode
    Stel ik woon in dit postcodegebied <postcode>
    Als ik zoek naar mijn blokouderling op "<pagina>"
    Dan moet <ouderling> en <email> getoond worden
    Voorbeelden: :
    | pagina        | postcode | ouderling     | email                  |
    | inschrijven   | 2801AA   | "Jan de Wit"  | "jpdewit@kpnplanet.nl" |
    | inschrijven   | 2805CZ   | "Anne Bosman" | "a.bosman@solcon.nl"   |
    | blokouderling | 2801AA   | "Jan de Wit"  | "jpdewit@kpnplanet.nl" |
    | blokouderling | 2805CZ   | "Anne Bosman" | "a.bosman@solcon.nl"   |

  Abstract Scenario: Als de postcode buiten scope is, moet een zinvolle melding gegeven worden
    Stel ik woon in dit postcodegebied <postcode>
    Als ik zoek naar mijn blokouderling op "<pagina>"
    Dan moet deze melding getoond worden "<melding>"
    Voorbeelden:
      | pagina        | postcode | melding                                                                                                                             |
      | inschrijven   | 3434GH   | Voor deze postcode kon geen ouderling gevonden worden. Neem alstublieft contact op met de coordinator_pastoraat@sintjansgemeente.nl |
      | blokouderling | 3434GH   | Voor deze postcode kon geen ouderling gevonden worden. Neem alstublieft contact op met de coordinator_pastoraat@sintjansgemeente.nl |

  Abstract Scenario: Als de postcode in een andere wijk dan de St. Jan ligt, moet een zinvolle melding gegeven worden
    Stel ik woon in dit postcodegebied <postcode>
    Als ik zoek naar mijn blokouderling op "<pagina>"
    Dan moet deze melding getoond worden "<melding>"
    Voorbeelden:
      | pagina        | postcode | melding                                                                                                                             |
      | inschrijven   | 2802KW   | Deze postcode valt onder de wijk Westerkerk. Als u mee wilt leven, dan kunt zich laten overschrijven naar de Sintjansgemeente (link). Uw blokouderling wordt dan Kees Middelkoop, cornelismmiddelkoop@gmail.com |

    # Link: http://www.protestantsekerkgouda.nl/kerkelijk-bureau/informatie-en-ledenadministratie/overschrijven-naar-andere-wijkgemeente/
