//Check lle nombre de jour dont les données existent

var numberOfDataChecker = document.getElementById("dd_t");
var numberOfDataCheckerArr = JSON.parse(numberOfDataChecker.textContent);
for (let i = 0; i < 20; i++) {
    // Essai de lecture de la valeur i
    if (!(typeof numberOfDataCheckerArr[i] === 'undefined')){
        // Si le test est passé, ajout de la possibilité de sélectionner ce jour
    var x = document.getElementById("dateSelected");
    var option = document.createElement("option");
    option.value = i.toString();
    option.text = "Début :" + numberOfDataCheckerArr[i];
    x.add(option, x.options[i]); // Ajoute l'option avant la deuxième option existante

    } else{
        console.log("Aucune donnée n'est disponible");
    }   
}

  //FONCTIONS UTILITAIRES
  function addSeconds(date, seconds) {
    const newDate = new Date(date.getTime()); // Crée une nouvelle instance de Date à partir de la valeur de date

    newDate.setSeconds(newDate.getSeconds() + seconds); // Ajoute les secondes à la nouvelle instance de date
  
    return newDate; // Retourne la nouvelle instance de date avec les secondes ajoutées
  }
  

  //Fonction retournant tous les points entre 2 dates en fonction du nombre de points
  function datePoints(dateDeb, numberOfSeconds, numberOfPoints){
    pointsArr = []
    pointDistance = numberOfSeconds/(numberOfPoints-1) //on enlève du calcul le point du début 
    for (let i = 0; i < numberOfPoints; i++) {
        pointsArr.push(addSeconds(dateDeb, i*pointDistance))
        
    }
    return pointsArr

  }
  
  // Fonction pour sauvegarder la valeur sélectionnée dans le stockage local
  function saveSelectedValue() {
      var selectedValue = document.getElementById("dateSelected").value;
      localStorage.setItem("selectedValue", selectedValue);
      location.reload();
  }
  
  // Vérifie si une valeur est déjà enregistrée dans le stockage local
  var storedValue = localStorage.getItem("selectedValue");
  if (storedValue) {
      document.getElementById("dateSelected").value = storedValue;
  }

  //FONCTIONS GRAPHIQUES
  // set the dimensions and margins of the graph
  var margin = { top: 10, right: 30, bottom: 30, left: 60 },
      width = 340 - margin.left - margin.right,
      height = 220 - margin.top - margin.bottom;
  
  
  
  var selectElement = document.getElementById("dateSelected");
  var selectedOption = selectElement.options[selectElement.selectedIndex].value
  console.log("Option sélectionnée : " + selectElement.selectedIndex);
  
  // append the svg object to the body of the page
  var svg = d3.select("#first")
      .append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform",
          "translate(" + margin.left + "," + margin.top + ")");
  
  var selectElement = document.getElementById("dateSelected");
  var dateSelected = selectElement.selectedIndex;
  //var dateSelected = 1;
  
  var divDDT = document.getElementById("dd_t");
  let dateDebArrT = JSON.parse(divDDT.textContent)
  var dateDebT = new Date(dateDebArrT[dateSelected]);
  
  var divDFT = document.getElementById("df_t");
  let dateFinArrT = JSON.parse(divDFT.textContent)
  let dateFinT = new Date(dateFinArrT[dateSelected]);
  
  //Recupération des données Via cookies
  var tempArr = JSON.parse(document.getElementById("tempD").textContent)[dateSelected];
  var temp = JSON.parse(tempArr.replace('{"values":', '').replace('}', ''))
  var dataTemp = []
  
  var x_t = d3.scaleTime()
      .domain([dateDebT, dateFinT])
      .range([0, width]);
  
  
  let numberOfPointsT = temp.length
  let numberOfSecT = Math.abs(dateDebT.getTime() - dateFinT.getTime())/1000
  
  var allDatesT = datePoints(dateDebT,numberOfSecT, numberOfPointsT)
  
  
  //insertion des données dans une liste appropriée
  for (let i = 0; i < temp.length; i++) {
  
      dataTemp.push({ "x": allDatesT[i], "y": temp[i] })
  }
  
  
  svg.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x_t));
  
  
  // Add Y axis
  var yTemp = d3.scaleLinear()
      .domain([0, 40])
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
          .x(function (d) { return x_t(d.x) })
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
      var x0 = x_t.invert(d3.mouse(this)[0]);
      var i = bisect(dataTemp, x0, 1);
      selectedData = dataTemp[i];
      focusfirst
          .attr("cx", x_t(selectedData.x))
          .attr("cy", yTemp(selectedData.y));
      focusTextfirst
          .html("T:" + addZero((selectedData.x).getHours()) + ":" + addZero((selectedData.x).getMinutes()) + "\n" + "(C°):" + selectedData.y)
          .attr("x", x_t(selectedData.x) - 50)
          .attr("y", yTemp(selectedData.y) + 30);
  }
  
  function mouseoutfirst() {
      focusfirst.style("opacity", 0);
      focusTextfirst.style("opacity", 0);
  }
  

//Read the data
 
 var cardArr = JSON.parse(document.getElementById("cardD").textContent)[dateSelected];
 var card = JSON.parse(cardArr.replace('{"values":', '').replace('}', ''))

  var divDDC = document.getElementById("dd_c");
  let dateDebArrC = JSON.parse(divDDC.textContent)
  var dateDebC = new Date(dateDebArrC[dateSelected]);
  
  var divDFC = document.getElementById("df_c");
  let dateFinArrC = JSON.parse(divDFC.textContent)
  let dateFinC = new Date(dateFinArrC[dateSelected]);
  

  var x_c = d3.scaleTime()
      .domain([dateDebC, dateFinC])
      .range([0, width]);
  
  
  let numberOfPointsC = card.length
  let numberOfSecC = Math.abs(dateDebC.getTime() - dateFinC.getTime())/1000
  
  var allDatesC = datePoints(dateDebC,numberOfSecC, numberOfPointsC)

  // append the svg object to the body of the page
  var svg2 = d3.select("#second")
      .append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform",
          "translate(" + margin.left + "," + margin.top + ")");
  
  
  var dataCard = []
  
  for (let i = 0; i < card.length; i++) {
  
      dataCard.push({ "x": allDatesC[i], "y": card[i] })
  }
  
  
  svg2.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x_c));
  
  
  // Add Y axis
  var yCard = d3.scaleLinear()
      .domain([0, 110])
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
          .x(function (d) { return x_c(d.x) })
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
      var x0 = x_c.invert(d3.mouse(this)[0]);
      var i = bisect(dataCard, x0, 1);
      selectedData = dataCard[i];
      focussecond
          .attr("cx", x_c(selectedData.x))
          .attr("cy", yCard(selectedData.y));
      focusTextsecond
          .html("T:" + addZero((selectedData.x).getHours()) + ":" + addZero((selectedData.x).getMinutes()) + "  -  " + "bpm:" + selectedData.y)
          .attr("x", x_c(selectedData.x) - 50)
          .attr("y", yCard(selectedData.y) + 30);
  }
  
  function mouseoutsecond() {
      focussecond.style("opacity", 0);
      focusTextsecond.style("opacity", 0);
  }
  

  //HUMIDITE
  var humArr = JSON.parse(document.getElementById("humD").textContent)[dateSelected];
  var hum = JSON.parse(humArr.replace('{"values":', '').replace('}', ''))

  var divDDH = document.getElementById("dd_h");
  let dateDebArrH = JSON.parse(divDDH.textContent)
  var dateDebH = new Date(dateDebArrH[dateSelected]);
  
  var divDFH = document.getElementById("df_h");
  let dateFinArrH = JSON.parse(divDFH.textContent)
  let dateFinH = new Date(dateFinArrH[dateSelected]);
  

  var x_h = d3.scaleTime()
      .domain([dateDebH, dateFinH])
      .range([0, width]);
  
  
  let numberOfPointsH = hum.length
  let numberOfSecH = Math.abs(dateDebH.getTime() - dateFinH.getTime())/1000
  
  var allDatesH = datePoints(dateDebH,numberOfSecH, numberOfPointsH)

  // append the svg object to the body of the page
  var svg3 = d3.select("#third")
      .append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform",
          "translate(" + margin.left + "," + margin.top + ")");
  

  
  var dataHum = []
  
  for (let i = 0; i < hum.length; i++) {
  
      dataHum.push({ "x": allDatesH[i], "y": hum[i] })
  }
  
  
  svg3.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x_h));
  
  
  // Add Y axis
  var yHum = d3.scaleLinear()
      .domain([0, 100])
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
          .x(function (d) { return x_h(d.x) })
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
      var x0 = x_h.invert(d3.mouse(this)[0]);
      var i = bisect(dataHum, x0, 1);
      selectedData = dataHum[i];
      focusthird
          .attr("cx", x_h(selectedData.x))
          .attr("cy", yHum(selectedData.y));
      focusTextthird
          .html("T:" + addZero((selectedData.x).getHours()) + ":" + addZero((selectedData.x).getMinutes()) + "\n" + selectedData.y + "%")
          .attr("x", x_h(selectedData.x) - 50)
          .attr("y", yHum(selectedData.y) + 30);
  }
  
  function mouseoutthird() {
      focusthird.style("opacity", 0);
      focusTextthird.style("opacity", 0);
  }
  
  

  // SON

  var sonArr = JSON.parse(document.getElementById("sonD").textContent)[dateSelected];
  var son = JSON.parse(sonArr.replace('{"values":', '').replace('}', ''))
  
  var divDDS = document.getElementById("dd_s");
  let dateDebArrS = JSON.parse(divDDS.textContent)
  var dateDebS = new Date(dateDebArrS[dateSelected]);
  
  var divDFS = document.getElementById("df_s");
  let dateFinArrS = JSON.parse(divDFS.textContent)
  let dateFinS = new Date(dateFinArrS[dateSelected]);
  

  var x_s = d3.scaleTime()
      .domain([dateDebS, dateFinS])
      .range([0, width]);
  
  
  let numberOfPointsS = son.length
  let numberOfSecS = Math.abs(dateDebS.getTime() - dateFinS.getTime())/1000
  
  var allDatesS = datePoints(dateDebS,numberOfSecS, numberOfPointsS)
  
  // append the svg object to the body of the page
  var svg4 = d3.select("#forth")
      .append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform",
          "translate(" + margin.left + "," + margin.top + ")");
  
  
  var dataSon = []
  
  for (let i = 0; i < son.length; i++) {
  
      dataSon.push({ "x": allDatesS[i], "y": son[i] })
  }
  
  
  svg4.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x_s));
  
  
  // Add Y axis
  var ySon = d3.scaleLinear()
     // .domain([-2, 25])
      .domain([
          (dataSon.reduce(function(previous, current) {return (current.y < previous.y) ? current : previous;}).y-0.5),
        Math.min(10, dataSon.reduce(function(previous, current) {return (current.y > previous.y) ? current : previous;}).y)+0.5
    ])
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
          .x(function (d) { return x_s(d.x) })
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
      var x0 = x_s.invert(d3.mouse(this)[0]);
      var i = bisect(dataSon, x0, 1);
      selectedData = dataSon[i];
      focusforth
          .attr("cx", x_s(selectedData.x))
          .attr("cy", ySon(selectedData.y));
      focusTextforth
          .html("T:" + addZero((selectedData.x).getHours()) + ":" + addZero((selectedData.x).getMinutes()) + "\n" + selectedData.y + "dB")
          .attr("x", x_s(selectedData.x) - 50)
          .attr("y", ySon(selectedData.y) + 30);
  }
  
  function mouseoutforth() {
      focusforth.style("opacity", 0);
      focusTextforth.style("opacity", 0);
  }
  
  // Data analysis section
  
  //Cette fonction aura 3 retour possible :
  // - Vous ne faites probablement pas d'appnee du sommeil
  // - Suspicions d'appnée du sommeil
  // - Vous faites très probablement de l'apnée du sommeil
  
  //Cette fonction sera chargée de compter le nombre de fois ou la courbe est au dessus de la valeur step
  function peaksDetection(data, step){
      let count = 0;
      for (let i = 1; i < data.length; i++) {
          if (data[i-1].y < step && data[i].y >= step) {
              count+=1;
          }        
      }
      return count;
  }
  
  function calculateAverage(data) {
      var total = 0;
      var count = 0;
  
      data.forEach(function(item, index) {
          total += item;
          count++;
      });
  
      return total / count;
  }
  
  function sleepApnea(){
      //Detection du nombre de reveils en sursaut
      let tempWakeUpCount = peaksDetection(dataTemp,37.8)
      let cardWakeUpCount = peaksDetection(dataCard, 60)
      let humWakeUpCount = peaksDetection(dataHum, 40)
      let sonWakeUpCount = peaksDetection(dataSon, 40)
  
      let WakeUpCount = Math.round(calculateAverage([tempWakeUpCount, cardWakeUpCount, humWakeUpCount, sonWakeUpCount]));
  
      if (WakeUpCount <= 2){
          return "Low_Chance"
      }else if (WakeUpCount <= 5){
          return "Medium_Chance"
      }else{
          return "High_Chance"
      }
  
  }
  
  //Lancement de la fonction de détection d'apnée du sommeil
  document.cookie = "result = " +sleepApnea();
  
  //displayGraphs()