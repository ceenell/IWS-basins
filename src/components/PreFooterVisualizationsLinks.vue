<template>
  <div class="pre-footer-links">
    <div class="inner-pre-footer-links-container">
      <p>See more data visualizations:</p>
      <div class="footer-viz-links">
        <a
          :href="LinkOne"
          target="_blank"
        >
          <figure>
            <img
              src="@/assets/components/PreFooterVisualizationsLinks/images/temp-monitor.jpg"
              alt=""
            >
            <figcaption>How we monitor and model stream temperature</figcaption>
          </figure>
        </a>
        <a
          :href="LinkTwo"
          target="_blank"
        >
          <figure>
            <img
              src="@/assets/components/PreFooterVisualizationsLinks/images/snow-to-flow.jpg"
              alt=""
            >
            <figcaption>From Snow to Flow</figcaption>
          </figure>
        </a>
      </div>
    </div>
  </div>
</template>

<script>
    export default {
        name: 'PreFooterVisualizationsLinks',
        data() {
            return {
                LinkOne: process.env.VUE_APP_FOOTER_1,
                LinkTwo: process.env.VUE_APP_FOOTER_2
            };
        }
    }
</script>

<style scoped lang="scss">
$notWhite: white;
$nearBlack: #1a1b1c; 
/* for mobile */
#app {
  .pre-footer-links {
    display: flex;
    justify-content: center;
    text-align: left;
    font-family: 'Source Sans Pro',sans-serif;
    font-size: 16px;
    font-weight: 400;
    padding-top: .25em;
    padding-left: 8px;
    border-top: 2px solid white;
    p {
      color: white;
      font-size: 1.5em;
    }
    background-color: rgb(41, 41, 41);

    .footer-viz-links {
      margin: 0 auto;
      display: flex;
      flex-direction: column;
      justify-content: center;

      img {
        width: 60%;
        height: 60%;
        top: 0;
        left: 0;
      }
      a {
        figcaption {
          position: relative;
          color: white;
          text-align: left;
          padding-bottom: 0.5em;
          max-width: 60%;
        }
        padding: 0.5em;
        max-width: 25rem;
      }
    }
  }
}

/* for everything but mobile */
@media only screen and (min-width: 700px) {
  #app {
    .pre-footer-links {
      .footer-viz-links {
        flex-direction: row;
        justify-content: center;

        img {
          width: 200px;
          height: 200px;
          top: 0;
          left: 0;
        }
        a {
          figcaption {
            position: relative;
            color: white;
            text-align: left;
            padding-bottom: 0.5em;
            max-width: 200px;
          }
        }
      }
    }
  }
}

#code-repository-link-container {
  a {
    color:$notWhite;
  }
}
</style>
