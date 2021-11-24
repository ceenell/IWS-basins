<template>
  <section> 
    <div id="chart-container" />
  </section>
</template>
<script>
import * as d3Base from 'd3';
export default {
  name: "HUC",
    components: {
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
           // var w = this.svg_container.clientWidth;
            //var h = this.svg_container.clientHeight;
        },
        drawChart(){
            this.svg_chart
            .append("g")
            .classed("test", true)
        } 

    }
}
</script>
<style scoped lang="scss">
$hilite: rgb(208, 138, 223);

// style card

#chart-container {
  width: 100%;
  vertical-align: top;
  overflow: hidden;
  //background-color: pink;
}
.svg-chart {
    display:inline-block;
    position: absolute;
    top:0;
    left:0;
}
</style>