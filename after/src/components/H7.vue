<template>
  <div class="hello">
    777777
  </div>
</template>

<script>
export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
     
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
.leftnav{
 float: left; 
 width: 20vw;
 height: 100vh;
 background: #747474;
}
.rigthmian{
  float: right; 
   width: 80vw;
 height: 100vh;
 
}
.navfen{
  color: #66f87b;
  width: 100%;
  height: 10vh;
  font-size: 16px;
  line-height: 10vh;
}
.navfen span{
  margin-left: 2vw;
}
.navfen:active{
  color: #00ff30;
}
</style>
