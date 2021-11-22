<template>
  <section>
      <div id="grid-container">   

      </div>
  </section>
</template>
<script>
import * as d3Base from 'd3';

export default {
  name: "CONUS",
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
      svg: null,
      word_bank: null,
      radius: null, 

    }
  },
  mounted(){      
      this.d3 = Object.assign(d3Base);

      // resize
      this.width = 2736 //- this.margin.left - this.margin.right;
      this.height = 1872//*.5 - this.margin.top - this.margin.bottom;
      this.radius = 32;
    
    },
    methods:{
    }
}
</script>
<style scoped lang="scss">

</style>