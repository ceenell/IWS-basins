<template>
  <div class="visualization">
    <div id="title-container">
      <h1>Addressing water resource challenges</h1>
      <p>The U.S. Geological Survey is addressing the Nation’s greatest water resource challenges through the intensive study of 10 Integrated Water Science (IWS) basins. The IWS basins will represent a wide range of environmental, hydrologic, and landscape settings and human stressors of water resources to improve understanding of water availability.</p>
    </div>
    <CONUS id="conus-container" />
    <HUC id="huc-container" />
    <BarcodeChart id="chart" />
  </div>
</template>

<script>

export default {
    name: 'Visualization',
    components: {
      CONUS: () => import( /* webpackPreload: true */ /*webpackChunkName: "section"*/ "./../components/CONUS"),
      HUC: () => import( /* webpackPreload: true */ /*webpackChunkName: "section"*/ "./../components/HUC"),
      BarcodeChart: () => import( /* webpackPreload: true */ /*webpackChunkName: "section"*/ "./../components/BarcodeChart")
    },
    computed: {
    },
    mounted(){
      
    },
    methods:{
    }
} 
</script>

<style lang="scss">
// color scale
$dark_blue: rgb(26, 62, 89);
$dark_purp:rgb(71, 9, 56);
$lite_blue:rgb(92, 148, 189);
$lite_purp: rgb(242, 214, 235); 

// color vars
$bkgd_color: rgb(49, 49, 49);
$text_color: white;
$hilite: $lite_blue;


// layout
#title-container {
  grid-area: title;
}
#conus-container {
  grid-area: CONUS;
}
#huc-container {
  grid-area: HUC;
}
#chart {
  grid-area: chart;
  //background-color: rgb(0, 238, 255);
}
// mobile layout
.visualization {
  max-width: 1600px; // doing this so the first view everything fits on a laptop without numerous layouts
  margin: auto;
  display: grid;
  gap: 10px;
  grid-template-areas:
    "title"
    "CONUS"
    "HUC"
    "chart";
}
// desktop
@media (min-width: 900px) {
  .visualization {
  margin: 5rem;
  display: grid;
  gap: 20px;
  grid-template-columns: 2fr 2fr;
  grid-template-areas:
    "title title"
    "CONUS HUC"
    "chart chart";
}
}
</style>
