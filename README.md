Dit javascript programma leest een postcode en zoekt de blokouderling op die op dat
adres pastorale zorg verleent.

Het script wordt gebruikt op de website van de Sint Jansgemeente: sintjansgemeente.nl

Dat is een Wordpress site. Om daarin eigen javascript te draaien moet je die eerst registreren
in een function.php.
Ik heb dat gedaan in /home/sintjansgemeente/public_html/wp-content/themes/church/
Daarbinnen vind je dit blokje
    /* ================================================================================== */
    /*      Andre's scripts - start
    /* ================================================================================== */
   
    wp_enqueue_script( 'blokouderling', THEME_DIR . '/assets/js/blokouderling_lookup.js');
    
    /* ================================================================================== */
    /*      Andre's scripts - end
    /* ================================================================================== */

De javasciprt zelf staat hier:
/home/sintjansgemeente/public_html/wp-content/themes/church/assets/js/blokouderling_lookup.js

Deze leest de informatie uit een CSV-file hier:
/home/sintjansgemeente/public_html/wp-content/themes/church/assets/data/postcode.csv

Om mutaties bij blokouderlingen te verwerken hoef je alleen maar de csv aan te passen. Vervang
naam en email van de blokouderling door de gegevens van de nieuwe. En alles zou weer moeten werken.
