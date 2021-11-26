<template>
  <section>
    <div id="bee-container" />
  </section>
</template>
<script>
import * as d3Base from 'd3';
export default {
  name: "Chart",
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
      bee_container: null,

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
    this.bee_container = this.d3.select("#bee-container")
    this.w = document.getElementById("bee-container").offsetWidth;
    this.h = document.getElementById("bee-container").offsetHeight;
    
    // create svg that will hold chart
    this.svg_bees = this.d3.select("#bee-container")
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
                self.d3.csv("https://labs.waterdata.usgs.gov/visualizations/data/basin_water_use.csv", this.d3.autotype),
                self.d3.csv("https://labs.waterdata.usgs.gov/visualizations/data/basin_mapping.csv", this.d3.autotype)
            ];
            Promise.all(promises).then(self.callback);
        },
        callback(data){
          const self = this;

          // water use by basin - basin_id, tot_wu_mgd, tot_wu_percentile
          this.basin_wu = data[0]
          this.basin_mapping = data[1];

          this.drawChart()
        },
        resize(){
            // make chart responsive
        },
        drawChart(){
          // creates a barcode plot
          var xScale = this.d3.scaleLinear()
            .domain(this.d3.extent(this.basin_wu, d => d.tot_wu_mgd)).nice()
            .range([20, this.w-20])

          var xAxis = this.d3.axisTop(xScale)
            .ticks(10)

          this.svg_bees.append("g")
          .attr("class", "x-axis")
          .call(xAxis)
          .attr("transform", "translate(0, " + 20 + ")")
          // for some reason the barcode is not staying within the x-axis bounds

          this.d3.select(".x-axis path")
          .attr("stroke", "white")

          this.d3.selectAll(".tick line")
          .attr("stroke", "white")

          this.svg_bees
            .selectAll(".bee")
            .data(this.basin_wu, function(d) { return d.basin_id})
            .enter()
            .append("rect")
            .classed("bee", true)
            .attr("x",(d) => xScale(d.tot_wu_mgd))
            .attr("y", (this.h/4))
            //.attr("r", 3)
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

#bee-container {
  height: 15vh;
  width: 100%;
}

</style>