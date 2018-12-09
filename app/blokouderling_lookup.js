(function ($) {
    $(document).ready(function () {
        $("#vind_blokouderling_button").click(function () {
            $.ajax({
                type: "GET",
                url: 'https://sintjansgemeente.nl/wp-content/themes/church/assets/data/postcode.csv',
                dataType: "text",
                success: function (data) {
                    processData(data);
                }
            });
            // I am using an absolute path, because this code can be called from multiple pages on the site,
            // so relative paths may not work there
        });
    })
}(jQuery));

function processData(allText) {
    var lines = [];
    lines = readCSV();

    var postcode_value = document.getElementById("postcode_id").value.toUpperCase();
    var blokouderling = lines.find(zoekBlokouderling, postcode_value);

    document.getElementById('blokouderling_id').innerHTML = setContent();

    function readCSV() {
        var allTextLines = allText.split(/\r\n|\n|\r/);
        var headers = allTextLines[0].split(';');

        for (var i = 1; i < allTextLines.length; i++) {
            var data = allTextLines[i].split(';');
            if (data.length === headers.length) {
                var tarr = [];
                for (var j = 0; j < headers.length; j++) {
                    tarr.push(data[j]);
                }
                lines.push(tarr);
            }
        }
        return lines;
    }

    function setContent() {
        var content = "";
        if (blokouderling === undefined)
            content = "<p>Voor deze postcode kon geen ouderling gevonden worden.</br> " +
                "Neem alstublieft contact op met de coordinator-pastoraat@sintjansgemeente.nl.</p>";
        else {
            var blokouderling_wijk = blokouderling[1];
            var blokouderling_name = blokouderling[4];
            var blokouderling_email = blokouderling[5];

            if (blokouderling_wijk.includes("Sint Jan")) {
                content = "<p>Uw blokouderling is " + blokouderling_name + ", e-mail: " + blokouderling_email + ".</p>";
            }
            else {
                content = "<p>Deze postcode valt onder de wijk " + blokouderling_wijk + ".</p>";
                content += "<p>Als u mee wilt leven met de Sint Jansgemeente, dan kunt zich laten overschrijven naar de Sint Jansgemeente. Dat kan op ";
                content += "<a href='https://www.protestantsekerkgouda.nl/kerkelijk-bureau/informatie-en-ledenadministratie/overschrijven-naar-andere-wijkgemeente/'>de website van de PKN Gouda.</a></p>";
                content += "<p>Vanuit de Sint Jan wordt dan " + blokouderling_name + ", e-mail: " + blokouderling_email + " uw blokouderling.</p>";
            }
        }
        return content;
    }
}

function zoekBlokouderling(regel) {
    return regel[0] === this.toString();
}
