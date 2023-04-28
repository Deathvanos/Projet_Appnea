<!--******************************************************
* APP - Projet Système Numérique - Composante Informatique
* ISEP - A1 - G7C
* Semestre 2
* Auteur : - MAILLEY_Charles 
           - MAIZA_Fares
           - MARTINEZ_Eliot
           - PAVIOT-ADET_Flore
           - SPASOJEVIC_Fanny
           - VINGADASSAMY_Prasanaa
* Date de rendu  : 05/06/2023
********************************************************-->



<!DOCTYPE html>
<html lang="fr">

<head>
    <title>APNEA - User Sensor</title>
    <?php include 'Projet/view/other/header_Font_Page.html';?>
    <link rel="stylesheet" href="Ressources/css/user/sensorUser.css" />
    <!-- Load d3.js --> <!-- Circle are black when hovered-->
    <script src="https://d3js.org/d3.v4.js"></script>
</head>

<body>

    <?php $txt = $GLOBALS['translat'];
    include 'Projet/view/' . $_SESSION['controle'] . '/header.tpl';?>


    <main>

        <br>
        <h1>Vos Capteurs</h1>
        <br>


        <div id="dd" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($d1); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="df" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($d2); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="tempD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($tempValues); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="cardD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($cardValues); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="humD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($humValues); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>

        <div id="sonD" style="display: none;">
            <?php
            ; // Again, do some operation, get the output.
            echo htmlspecialchars($sonValues); /* You have to escape because the result
              will not be valid HTML otherwise. */
            ?>
        </div>


        <div class="allGraphs">

            <div class="Line">
                <div id="first" class="firstGraph">
                    <script>



                        // set the dimensions and margins of the graph
                        var margin = { top: 10, right: 30, bottom: 30, left: 60 },
                            width = 560 - margin.left - margin.right,
                            height = 400 - margin.top - margin.bottom;

                        // append the svg object to the body of the page
                        var svg = d3.select("#first")
                            .append("svg")
                            .attr("width", width + margin.left + margin.right)
                            .attr("height", height + margin.top + margin.bottom)
                            .append("g")
                            .attr("transform",
                                "translate(" + margin.left + "," + margin.top + ")");


                        var divDD = document.getElementById("dd");
                        let dateDeb = new Date(divDD.textContent);

                        var divDF = document.getElementById("df");
                        let dateFin = new Date(divDF.textContent);

                        var x = d3.scaleTime()
                            .domain([dateDeb, dateFin])
                            .range([0, width]);


                        x.ticks(d3.timeSecond.every(1));

                        allDates = x.ticks(d3.timeSecond.every(1));

                        //Recupération des données Via cookies
                        let temp = JSON.parse(document.getElementById("tempD").textContent.replace('{"values":', '').replace('}', ''))
                        var dataTemp = []

                        for (let i = 0; i < temp.length; i++) {

                            dataTemp.push({ "x": allDates[i], "y": temp[i] })
                        }


                        svg.append("g")
                            .attr("transform", "translate(0," + height + ")")
                            .call(d3.axisBottom(x));


                        // Add Y axis
                        var yTemp = d3.scaleLinear()
                            .domain([36, 40])
                            .range([height, 0]);

                        svg.append("g")
                            .call(d3.axisLeft(yTemp));

                        // This allows to find the closest X index of the mouse:
                        var bisect = d3.bisector(function (d) { return d.x; }).left;

                        // Create the circle that travels along the curve of chart
                        var focusfirst = svg.append('g')
                            .append('circle')
                            .style("fill", "none")
                            .attr("stroke", "black")
                            .attr('r', 8.5)
                            .style("opacity", 0);

                        // Create the text that travels along the curve of chart
                        var focusTextfirst = svg.append('g')
                            .append('text')
                            .style("opacity", 0)
                            .attr("text-anchor", "left")
                            .attr("alignment-baseline", "middle");

                        // Add the line
                        svg.append("path")
                            .datum(dataTemp)
                            .attr("fill", "none")
                            .attr("stroke", "steelblue")
                            .attr("stroke-width", 1.5)
                            .attr("d", d3.line()
                                .x(function (d) { return x(d.x) })
                                .y(function (d) { return yTemp(d.y) }));

                        // Create a rect on top of the svg area: this rectangle recovers mouse position
                        svg.append('rect')
                            .style("fill", "none")
                            .style("pointer-events", "all")
                            .attr('width', width)
                            .attr('height', height)
                            .on('mouseover', mouseoverfirst)
                            .on('mousemove', mousemovefirst)
                            .on('mouseout', mouseoutfirst);

                        // What happens when the mouse move -> show the annotations at the right positions.
                        function mouseoverfirst() {
                            focusfirst.style("opacity", 1);
                            focusTextfirst.style("opacity", 1);
                        }

                        //function for clean datetime
                        function addZero(i) {
                            if (i < 10) { i = "0" + i }
                            return i;
                        }

                        function mousemovefirst() {
                            // recover coordinate we need
                            var x0 = x.invert(d3.mouse(this)[0]);
                            var i = bisect(dataTemp, x0, 1);
                            selectedData = dataTemp[i];
                            focusfirst
                                .attr("cx", x(selectedData.x))
                                .attr("cy", yTemp(selectedData.y));
                            focusTextfirst
                                .html("T:" + addZero((selectedData.x).getHours()) + ":" + addZero((selectedData.x).getMinutes()) + "\n" + "(C°):" + selectedData.y)
                                .attr("x", x(selectedData.x) - 50)
                                .attr("y", yTemp(selectedData.y) + 30);
                        }

                        function mouseoutfirst() {
                            focusfirst.style("opacity", 0);
                            focusTextfirst.style("opacity", 0);
                        }


                    </script>

                    <h2>Capteur Temperature</h2>
                </div>





                <div class="vertical-lign"></div>






                <div id="second" class="secondGraph">

                    <script>

                        // set the dimensions and margins of the graph
                        var margin = { top: 10, right: 30, bottom: 30, left: 60 },
                            width = 560 - margin.left - margin.right,
                            height = 400 - margin.top - margin.bottom;

                        // append the svg object to the body of the page
                        var svg2 = d3.select("#second")
                            .append("svg")
                            .attr("width", width + margin.left + margin.right)
                            .attr("height", height + margin.top + margin.bottom)
                            .append("g")
                            .attr("transform",
                                "translate(" + margin.left + "," + margin.top + ")");

                        //Read the data

                        let card = JSON.parse(document.getElementById("cardD").textContent.replace('{"values":', '').replace('}', ''))

                        var x = d3.scaleTime()
                            .domain([dateDeb, dateFin])
                            .range([0, width]);


                        x.ticks(d3.timeSecond.every(1));

                        allDates = x.ticks(d3.timeSecond.every(1));

                        var dataCard = []

                        for (let i = 0; i < card.length; i++) {

                            dataCard.push({ "x": allDates[i], "y": card[i] })
                        }


                        svg2.append("g")
                            .attr("transform", "translate(0," + height + ")")
                            .call(d3.axisBottom(x));


                        // Add Y axis
                        var yCard = d3.scaleLinear()
                            .domain([20, 130])
                            .range([height, 0]);

                        svg2.append("g")
                            .call(d3.axisLeft(yCard));

                        // This allows to find the closest X index of the mouse:
                        var bisect = d3.bisector(function (d) { return d.x; }).left;

                        // Create the circle that travels along the curve of chart
                        var focussecond = svg2.append('g')
                            .append('circle')
                            .style("fill", "none")
                            .attr("stroke", "black")
                            .attr('r', 8.5)
                            .style("opacity", 0);

                        // Create the text that travels along the curve of chart
                        var focusTextsecond = svg2.append('g')
                            .append('text')
                            .style("opacity", 0)
                            .attr("text-anchor", "left")
                            .attr("alignment-baseline", "middle");

                        // Add the line
                        svg2.append("path")
                            .datum(dataCard)
                            .attr("fill", "none")
                            .attr("stroke", "#e58939")
                            .attr("stroke-width", 1.5)
                            .attr("d", d3.line()
                                .x(function (d) { return x(d.x) })
                                .y(function (d) { return yCard(d.y) }));

                        // Create a rect on top of the svg area: this rectangle recovers mouse position
                        svg2.append('rect')
                            .style("fill", "none")
                            .style("pointer-events", "all")
                            .attr('width', width)
                            .attr('height', height)
                            .on('mouseover', mouseoversecond)
                            .on('mousemove', mousemovesecond)
                            .on('mouseout', mouseoutsecond);

                        // What happens when the mouse move -> show the annotations at the right positions.
                        function mouseoversecond() {
                            focussecond.style("opacity", 1);
                            focusTextsecond.style("opacity", 1);
                        }

                        //function for clean datetime
                        function addZero(i) {
                            if (i < 10) { i = "0" + i }
                            return i;
                        }

                        function mousemovesecond() {
                            // recover coordinate we need
                            var x0 = x.invert(d3.mouse(this)[0]);
                            var i = bisect(dataCard, x0, 1);
                            selectedData = dataCard[i];
                            focussecond
                                .attr("cx", x(selectedData.x))
                                .attr("cy", yCard(selectedData.y));
                            focusTextsecond
                                .html("T:" + addZero((selectedData.x).getHours()) + ":" + addZero((selectedData.x).getMinutes()) + "  -  " + "bpm:" + selectedData.y)
                                .attr("x", x(selectedData.x) - 50)
                                .attr("y", yCard(selectedData.y) + 30);
                        }

                        function mouseoutsecond() {
                            focussecond.style("opacity", 0);
                            focusTextsecond.style("opacity", 0);
                        }


                    </script>

                    <h2>Capteur Cardiaque</h2>


                </div>
            </div>

            <div class="horizontal-lign"></div>

            <div class="Line">
                <div id="third" class="thirdGraph">
                    <script>

                        // set the dimensions and margins of the graph
                        var margin = { top: 10, right: 30, bottom: 30, left: 60 },
                            width = 560 - margin.left - margin.right,
                            height = 400 - margin.top - margin.bottom;

                        // append the svg object to the body of the page
                        var svg3 = d3.select("#third")
                            .append("svg")
                            .attr("width", width + margin.left + margin.right)
                            .attr("height", height + margin.top + margin.bottom)
                            .append("g")
                            .attr("transform",
                                "translate(" + margin.left + "," + margin.top + ")");

                        var x = d3.scaleTime()
                            .domain([dateDeb, dateFin])
                            .range([0, width]);


                        x.ticks(d3.timeSecond.every(1));

                        allDates = x.ticks(d3.timeSecond.every(1));


                        let hum = JSON.parse(document.getElementById("humD").textContent.replace('{"values":', '').replace('}', ''))

                        var dataHum = []

                        for (let i = 0; i < hum.length; i++) {

                            dataHum.push({ "x": allDates[i], "y": hum[i] })
                        }


                        svg3.append("g")
                            .attr("transform", "translate(0," + height + ")")
                            .call(d3.axisBottom(x));


                        // Add Y axis
                        var yHum = d3.scaleLinear()
                            .domain([15, 60])
                            .range([height, 0]);

                        svg3.append("g")
                            .call(d3.axisLeft(yHum));

                        // This allows to find the closest X index of the mouse:
                        var bisect = d3.bisector(function (d) { return d.x; }).left;

                        // Create the circle that travels along the curve of chart
                        var focusthird = svg3.append('g')
                            .append('circle')
                            .style("fill", "none")
                            .attr("stroke", "black")
                            .attr('r', 8.5)
                            .style("opacity", 0);

                        // Create the text that travels along the curve of chart
                        var focusTextthird = svg3.append('g')
                            .append('text')
                            .style("opacity", 0)
                            .attr("text-anchor", "left")
                            .attr("alignment-baseline", "middle");

                        // Add the line
                        svg3.append("path")
                            .datum(dataHum)
                            .attr("fill", "none")
                            .attr("stroke", "#ab4ff1")
                            .attr("stroke-width", 1.5)
                            .attr("d", d3.line()
                                .x(function (d) { return x(d.x) })
                                .y(function (d) { return yHum(d.y) }));

                        // Create a rect on top of the svg area: this rectangle recovers mouse position
                        svg3.append('rect')
                            .style("fill", "none")
                            .style("pointer-events", "all")
                            .attr('width', width)
                            .attr('height', height)
                            .on('mouseover', mouseoverthird)
                            .on('mousemove', mousemovethird)
                            .on('mouseout', mouseoutthird);

                        // What happens when the mouse move -> show the annotations at the right positions.
                        function mouseoverthird() {
                            focusthird.style("opacity", 1);
                            focusTextthird.style("opacity", 1);
                        }

                        //function for clean datetime
                        function addZero(i) {
                            if (i < 10) { i = "0" + i }
                            return i;
                        }

                        function mousemovethird() {
                            // recover coordinate we need
                            var x0 = x.invert(d3.mouse(this)[0]);
                            var i = bisect(dataHum, x0, 1);
                            selectedData = dataHum[i];
                            focusthird
                                .attr("cx", x(selectedData.x))
                                .attr("cy", yHum(selectedData.y));
                            focusTextthird
                                .html("T:" + addZero((selectedData.x).getHours()) + ":" + addZero((selectedData.x).getMinutes()) + "\n" + selectedData.y + "%")
                                .attr("x", x(selectedData.x) - 50)
                                .attr("y", yHum(selectedData.y) + 30);
                        }

                        function mouseoutthird() {
                            focusthird.style("opacity", 0);
                            focusTextthird.style("opacity", 0);
                        }

                    </script>

                    <h2>Capteur Humidité</h2>
                </div>

                <div class="vertical-lign"></div>

                <div id="forth" class="forthGraph">
                    <script>

                        // set the dimensions and margins of the graph
                        var margin = { top: 10, right: 30, bottom: 30, left: 60 },
                            width = 560 - margin.left - margin.right,
                            height = 400 - margin.top - margin.bottom;

                        // append the svg object to the body of the page
                        var svg4 = d3.select("#forth")
                            .append("svg")
                            .attr("width", width + margin.left + margin.right)
                            .attr("height", height + margin.top + margin.bottom)
                            .append("g")
                            .attr("transform",
                                "translate(" + margin.left + "," + margin.top + ")");

                        var x = d3.scaleTime()
                            .domain([dateDeb, dateFin])
                            .range([0, width]);


                        x.ticks(d3.timeSecond.every(1));

                        allDates = x.ticks(d3.timeSecond.every(1));


                        let son = JSON.parse(document.getElementById("sonD").textContent.replace('{"values":', '').replace('}', ''))

                        var dataSon = []

                        for (let i = 0; i < son.length; i++) {

                            dataSon.push({ "x": allDates[i], "y": son[i] })
                        }


                        svg4.append("g")
                            .attr("transform", "translate(0," + height + ")")
                            .call(d3.axisBottom(x));


                        // Add Y axis
                        var ySon = d3.scaleLinear()
                            .domain([5, 90])
                            .range([height, 0]);

                        svg4.append("g")
                            .call(d3.axisLeft(ySon));

                        // This allows to find the closest X index of the mouse:
                        var bisect = d3.bisector(function (d) { return d.x; }).left;

                        // Create the circle that travels along the curve of chart
                        var focusforth = svg4.append('g')
                            .append('circle')
                            .style("fill", "none")
                            .attr("stroke", "black")
                            .attr('r', 8.5)
                            .style("opacity", 0);

                        // Create the text that travels along the curve of chart
                        var focusTextforth = svg4.append('g')
                            .append('text')
                            .style("opacity", 0)
                            .attr("text-anchor", "left")
                            .attr("alignment-baseline", "middle");

                        // Add the line
                        svg4.append("path")
                            .datum(dataSon)
                            .attr("fill", "none")
                            .attr("stroke", "#f14f4f")
                            .attr("stroke-width", 2)
                            .attr("d", d3.line()
                                .x(function (d) { return x(d.x) })
                                .y(function (d) { return ySon(d.y) }));

                        // Create a rect on top of the svg area: this rectangle recovers mouse position
                        svg4.append('rect')
                            .style("fill", "none")
                            .style("pointer-events", "all")
                            .attr('width', width)
                            .attr('height', height)
                            .on('mouseover', mouseoverforth)
                            .on('mousemove', mousemoveforth)
                            .on('mouseout', mouseoutforth);

                        // What happens when the mouse move -> show the annotations at the right positions.
                        function mouseoverforth() {
                            focusforth.style("opacity", 1);
                            focusTextforth.style("opacity", 1);
                        }

                        //function for clean datetime
                        function addZero(i) {
                            if (i < 10) { i = "0" + i }
                            return i;
                        }

                        function mousemoveforth() {
                            // recover coordinate we need
                            var x0 = x.invert(d3.mouse(this)[0]);
                            var i = bisect(dataSon, x0, 1);
                            selectedData = dataSon[i];
                            focusforth
                                .attr("cx", x(selectedData.x))
                                .attr("cy", ySon(selectedData.y));
                            focusTextforth
                                .html("T:" + addZero((selectedData.x).getHours()) + ":" + addZero((selectedData.x).getMinutes()) + "\n" + selectedData.y + "dB")
                                .attr("x", x(selectedData.x) - 50)
                                .attr("y", ySon(selectedData.y) + 30);
                        }

                        function mouseoutforth() {
                            focusforth.style("opacity", 0);
                            focusTextforth.style("opacity", 0);
                        }

                    </script>

                    <h2>Capteur Sonore</h2>
                </div>
            </div>

        </div>
        <br>
        <br>
        <h1>Au vu de vos données, il est fort probable que vous ayez fait de l'apnée du sommeil cette nuit.</h1>


    </main>


    <?php include 'Projet/view/' . $_SESSION['controle'] . '/footer.tpl'; ?>


</body>

</html>