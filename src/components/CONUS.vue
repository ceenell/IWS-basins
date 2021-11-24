<template>
  <section>
      <div id="grid-container">   
      <!--   <svg 
            data-src="https://labs.waterdata.usgs.gov/visualizations/maps/map.svg"
            class = "map-conus"
            ></svg> -->
            <CONUSmap id="conus-map" />
            <div id="chart-container">
            </div>
      </div>
  </section>
</template>
<script>
import * as d3Base from 'd3';
import CONUSmap from '@/assets/components/map.svg';
export default {
  name: "CONUS",
    components: {
        CONUSmap
    },
    data() {
    return {
      publicPath: process.env.BASE_URL, // this is need for the data files in the public folder, this allows the application to find the files when on different deployment roots
      d3: null,

      // dimensions
      width: null,
      height: null,
      margin: { top: 50, right: 50, bottom: 50, left: 50 },
      svg_chart: null,
      svg_container: null,
      svg_map: null,

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

    // global items
    this.svg_container = document.querySelector('#chart-container')
    this.width = this.svg_container.offsetWidth;
    this.height = this.svg_container.offsetHeight;

    // create svg for paired chart
    this.svg_chart = this.d3.select("#chart-container")
        .append("svg")
        .classed("svg-chart", true)
        .attr("viewBox", "0 0 " + this.width + " " + this.height)
        .attr("preserveAspectRatio", "xMidYMid meet")
    
    this.svg_map = this.d3.select("#conus-map")

    var map_iws = this.d3.selectAll(".huc8")
    
    // set chart elements
    this.drawChart();

    // resize chart when window changes 
    window.addEventListener("resize", this.resize)

    },
    methods:{
        loadData(){
            // add data here
           /*  const self = this;
            let promises = [
                self.d3.csv([file], this.d3.autotype)
            ];ß
            Promise.all(promises).then(self.callback); */
        },
        callback(data){

        },
        resize(){
            // make chart responsive
            var w = this.svg_container.clientWidth;
            var h = this.svg_container.clientHeight;
        },
        drawChart(){
            this.svg_chart
            .append("g")
            .classed("test", true)
        },
        mapZoom(){

        }

    }
}
</script>
<style scoped lang="scss">
$hilite: rgb(208, 138, 223);

// style map
.state {
    z-index: -100;
}
.huc8 {
    z-index:100;
    fill: $hilite;
}
// grid layout
#conus-map {
  grid-area: conus;
}
#chart-container {
  grid-area: chart;
  width: 100%;
  vertical-align: top;
  overflow: hidden;
}
.svg-chart {
    display:inline-block;
    position: absolute;
    top:0;
    left:0;
}
// mobile layout
#grid-container {
  display: grid;
  gap: 20px;
  grid-template-columns: 1fr;
  grid-template-areas:
    "conus"
    "chart"
}
@media (min-width: 900px) {
  #grid-container {
    grid-template-columns: 2fr 2fr;
    grid-template-areas:
      "conus chart";
  }
}
</style>