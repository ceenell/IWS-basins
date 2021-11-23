<template>
  <div id="visualization">
    <div class="wrapper">
      <div id="title-container">
      <h1>HUC yourself</h1>
      <p>texty text text text</p>
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
$bkgd_color: royalblue;

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
  margin: 2rem;
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
    "title"
    "content";
}
@media (min-width: 500px) {
  .wrapper {
    grid-template-columns: 2fr 2fr;
    grid-template-areas:
      "title title"
      "content content";
  }
}


</style>
