<template>
  <div id="visualization">
    <div class="wrapper">
      <div id="title-container">
      <h1>Addressing water resource challenges</h1>
      <p>The U.S. Geological Survey is addressing the Nation’s greatest water resource challenges through the intensive study of 10 Integrated Water Science (IWS) basins — medium-sized watersheds (10,000-20,000 square miles) and underlying aquifers. The IWS basins will represent a wide range of environmental, hydrologic, and landscape settings and human stressors of water resources to improve understanding of water availability.</p>
      </div>
    <article class="content">
      <CONUS />
    </article>
  </div>
  </div>
</template>

<script>

export default {
    name: 'Visualization',
    components: {
      CONUS: () => import( /* webpackPreload: true */ /*webpackChunkName: "section"*/ "./../components/CONUS")
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

// map style
.usa {
  fill: transparent;
  stroke:white;
}
.state {
  stroke: white;
  fill: transparent;
}

// layout
#visualization {
  margin: 4rem;
}
.content {
  grid-area: content;
  background-color: $bkgd_color;
}

.title-container {
  grid-area: title;
}
.wrapper {
  display: grid;
  gap: 20px;
  grid-template-areas:
    "title title"
    "content content";
}
// desktop
@media (min-width: 900px) {
  #visualization {
  margin: 5rem;
}
}
</style>
