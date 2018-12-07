/**
 * Created by andreheijstek on 17-02-16.
 */
// vind de button en reageer op de klik - toon de alert (als eerste test)
(function($) {
    $(document).ready(function(){
        $("#vind_blokouderling_button").click(function() {
            $.ajax({
                type: "GET",
                url: 'https://sintjansgemeente.nl/wp-content/themes/church/assets/js/postcode.txt',
                dataType: "text",
                success: function(data) {processData(data);}
            });
            // I am using an absolute path, because this code can be called from multiple pages on the site,
            // so relative paths may not work there
        }
    // vul de juiste info in op de pagina
    );})
})(jQuery);

function processData(allText) {
    var allTextLines = allText.split(/\r\n|\n|\r/);
    alert(allTextLines.length);
    var headers = allTextLines[0].split(';');
    var lines = [];

    for (var i=1; i<allTextLines.length; i++) {
        var data = allTextLines[i].split(';');
        if (data.length == headers.length) {

            var tarr = [];
            for (var j=0; j<headers.length; j++) {
                // tarr.push(headers[j]+":"+data[j]);
                tarr.push(data[j]);
            }
            lines.push(tarr);
        }
    }
    alert(lines[0]);

    var postcode_value = document.getElementById("postcode_id").innerHTML;
    alert(postcode_value);
    /*
    Element.find('#button_id').on :click do
        postcode_value = Element.find('#postcode_id').value.upcase.delete(' ')
        blokouderling  = postcode_table.select { |block| block[postcode_value] }
    if blokouderling == []
        content = "<p>Voor deze postcode kon geen ouderling gevonden worden.
    Neem alstublieft contact op met de coordinator-pastoraat@sintjansgemeente.nl.</p>"
else
    wijk  = blokouderling[0][postcode_value][0]
    naam  = blokouderling[0][postcode_value][1]
    email = blokouderling[0][postcode_value][2]

    if wijk.include?("Sint Jan")
        content = "<p>Uw blokouderling is #{naam}, e-mail: #{email}.</p>"
    else
    content =
        "<p>Deze postcode valt onder de wijk #{wijk}.</p>
        <p>Als u mee wilt leven met de Sint Jansgemeente, dan kunt zich laten overschrijven naar de Sint Jansgemeente.
        Dat kan op
    <a href='https://www.protestantsekerkgouda.nl/kerkelijk-bureau/informatie-en-ledenadministratie/overschrijven-naar-andere-wijkgemeente/'>
        de website van de PKN Gouda.</a></p>
    <p>Vanuit de Sint Jan wordt dan #{naam}, e-mail: #{email} uw blokouderling.</p>"
    end
    end
    Element.find('#blokouderling_id').html = content
    end*/
}
