<template>
  <div id="visualization">
    <div class="wrapper">
      <div id="title-container">
        <h1>Addressing water resource challenges</h1>
        <p>The U.S. Geological Survey is addressing the Nation’s greatest water resource challenges through the intensive study of 10 Integrated Water Science (IWS) basins. The IWS basins will represent a wide range of environmental, hydrologic, and landscape settings and human stressors of water resources to improve understanding of water availability.</p>
      </div>
      <div id="conus-container">
        <CONUS />
      </div>
      <div id="huc-container">
        <HUC />
      </div>
      <div id="chart-container" >
        <chart />
        </div>
    </div>
  </div>
</template>

<script>

export default {
    name: 'Visualization',
    components: {
      CONUS: () => import( /* webpackPreload: true */ /*webpackChunkName: "section"*/ "./../components/CONUS"),
      HUC: () => import( /* webpackPreload: true */ /*webpackChunkName: "section"*/ "./../components/HUC"),
      chart: () => import( /* webpackPreload: true */ /*webpackChunkName: "section"*/ "./../components/chart")
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
$text_color: white;
$bkgd_color: rgb(41, 41, 41);
$hilite: rgb(208, 138, 223);

// layout
#visualization {
  margin: 4rem;
}
.title-container {
  grid-area: title;
}
#conus-container {
  grid-area: CONUS;
}
#huc-container {
  grid-area: HUC;
}
#chart-container {
  grid-area: chart;
}
// mobile layout
.wrapper {
  display: grid;
  gap: 20px;
  grid-template-areas:
    "title"
    "CONUS"
    "HUC"
    "chart";
}
// desktop
@media (min-width: 900px) {
  #visualization {
  margin: 5rem;
  }
  .wrapper {
    display: grid;
    gap: 20px;
    grid-template-columns: 3fr 2fr;
    grid-template-areas:
      "title title"
      "CONUS HUC"
      "chart chart";
  }
}
</style>
