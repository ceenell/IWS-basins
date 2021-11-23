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
import CONUSmap from '@/assets/map.svg';
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

    }
  },
  mounted(){      
      this.d3 = Object.assign(d3Base);

      // resize
      this.width = 2736 //- this.margin.left - this.margin.right;
      this.height = 1872//*.5 - this.margin.top - this.margin.bottom;
      this.radius = 32;

    // attempting to read in svg from url
      /* var new_svg = fetch('https://labs.waterdata.usgs.gov/visualizations/maps/map.svg')
        .then((response) => response.text())
        .then((text) => eval(text))
    console.log(new_svg)
     */

    this.svg_chart = this.d3.select("#chart-container")
        .append("svg")
        .classed("svg-chart", true)

    },
    methods:{
    }
}
</script>
<style scoped lang="scss">
#conus-map {
  grid-area: conus;
}
#chart-container {
  grid-area: chart;
}
#grid-container {
  display: grid;
  gap: 20px;
  grid-template-areas:
    "conus chart"
}
</style>