<template>
  <section>
    <!--   <svg 
            data-src="https://labs.waterdata.usgs.gov/visualizations/maps/map.svg"
            class = "map-conus"
            ></svg> -->
    <CONUSmap id="conus-map" />
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
    
    this.svg_map = this.d3.select("#conus-map")

    var map_iws = this.d3.selectAll(".huc8")

    // resize chart when window changes 
    //window.addEventListener("resize", this.resize)

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
        }
    }
}
</script>
<style scoped lang="scss">
$hilite: rgb(208, 138, 223);
$electric_blue: rgb(93, 225, 248);

// style map
.state {
    z-index: -100;
}
.river {
    stroke: $electric_blue;
}
.order_6 {
    stroke-width: 2px;
}
.huc8 {
    z-index:100;
    stroke: $hilite;
    stroke-width: 2px;
}

</style>