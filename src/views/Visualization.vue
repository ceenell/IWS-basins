<template>
  <div id="visualization">
    <CONUS />
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

</style>
