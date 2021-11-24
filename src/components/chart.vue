<template>
  <section>
   <div id="chart-container" />
  </section>
</template>
<script>
import * as d3Base from 'd3';
export default {
  name: "chart",
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
    
    this.svg_chart = this.d3.select("#chart-container")
    this.loadData();

    // resize chart when window changes 
    window.addEventListener("resize", this.resize)

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

          // water use by basin - basin_id, tot_wu_mgd, tot_wu_percentile
          this.basin_wu = data[0];
          this.basin_mapping = data[1];

        },
        resize(){
            // make chart responsive
            var w = this.svg_container.clientWidth;
            var h = this.svg_container.clientHeight;
        }
    }
}
</script>
<style scoped lang="scss">
$hilite: rgb(208, 138, 223);
$electric_blue: rgb(93, 225, 248);

#chart-container {
  height: 15vh;
}

</style>