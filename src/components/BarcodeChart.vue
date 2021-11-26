<template>
  <section>
    <div id="barcode-container" />
  </section>
</template>
<script>
import * as d3Base from 'd3';
export default {
  name: "BarcodeChart",
    components: {
    },
    data() {
    return {
      publicPath: process.env.BASE_URL, // this is need for the data files in the public folder, this allows the application to find the files when on different deployment roots
      d3: null,

      // dimensions
      w: null,
      h: null,
      margin: { top: 50, right: 50, bottom: 50, left: 50 },
      svg_chart: null,
      barcode_container: null,

    }
  },
  mounted(){      
      this.d3 = Object.assign(d3Base);

    // attempting to read in svg from url
      /* var new_svg = fetch('https://labs.waterdata.usgs.gov/visualizations/maps/map.svg')
        .then((response) => response.text())
        .then((text) => eval(text))
    console.log(new_svg)
     */
    // make chart responsive
    this.barcode_container = this.d3.select("#barcode-container")
    this.w = document.getElementById("barcode-container").offsetWidth;
    this.h = document.getElementById("barcode-container").offsetHeight;
    
    // create svg that will hold chart
    this.svg_barcode = this.d3.select("#barcode-container")
      .append("svg")
      .classed("svg-chart", true)
      .attr("viewBox", "0 0 " + this.w + " " + this.h)
      .attr("preserveAspectRatio", "xMidYMid meet")

    this.loadData();

    // resize chart when window changes 
    window.addEventListener("resize", this.drawChart)

    },
    methods:{
        loadData(){
            const self = this;

            // read in data
            let promises = [
                self.d3.csv("https://labs.waterdata.usgs.gov/visualizations/data/basin_water_use.csv", this.d3.autoType),
                self.d3.csv("https://labs.waterdata.usgs.gov/visualizations/data/basin_mapping.csv", this.d3.autoType)
            ];
            Promise.all(promises).then(self.callback);
        },
        callback(data){
          const self = this;

          // water use by basin - basin_id, tot_wu_mgd, tot_wu_percentile
          this.basin_wu = data[0];
          console.log(this.basin_wu)

          // mapping huc to basin
          this.basin_mapping = data[1];

          // draw water use barcode
          this.drawChart(this.basin_wu, {
            x: d => d.tot_wu_mgd,
            x_max: 12000,
            type: this.d3.scaleLinear,
            x_name: d => 'Water use'
          })
        },
        resize(){
            // make chart responsive
        },
        drawChart(data, {
          //draws bacode chart given x variable inputs
          value = d => d, // convenience alias for x
          x = value, // given d in data, returns value
          type = this.d3.scaleLinear,
          x_name
        } = {}) {
          
          // x axis scale
          var xScale = this.d3.scaleLinear()
            .domain([0, this.d3.max(data, x)]).nice()
            .range([20, this.w-20])

          var xAxis = this.d3.axisTop(xScale)
            //.ticks(10)

          this.svg_barcode.append("g")
            .attr("class", "x-axis")
            .call(xAxis)
            .attr("transform", "translate(0, " + 20 + ")")
          // for some reason the barcode is not staying within the x-axis bounds

          this.d3.select(".x-axis path")
          .attr("stroke", "white")

          this.d3.selectAll(".tick line")
          .attr("stroke", "white")

          this.svg_barcode
            .selectAll(".bar")
            .data(this.basin_wu, function(d) { return d.basin_id})
            .enter()
            .append("rect")
            .classed("bar", true)
            .attr("x",(d) => xScale(x))
            .attr("y", (this.h/4))
            .attr("width", 1)
            .attr("height", 10)
            .attr("opacity", 0.5)
            .attr("fill", "white")    
            // could add rows for region, or different variables

        }

    }
}
</script>
<style scoped lang="scss">
$hilite: rgb(208, 138, 223);
$electric_blue: rgb(93, 225, 248);

#barcode-container {
  height: 15vh;
  width: 100%;
}

</style>