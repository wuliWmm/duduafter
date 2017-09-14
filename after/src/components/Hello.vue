<template>
  <div class="hello">
    <div class="leftnav"> 
      <div>
          <div class="mastermin" v-show="master == true" @click="masteropen()">
           <span>管理员</span><span class="glyphicon glyphicon-plus"></span>
          </div>
      <div class="master" v-show="master == false">
          <div>
            <img src="">
          </div>
          <div class="mastermin" @click="masteropen()">
           <span>管理员</span><span class="glyphicon glyphicon-minus"></span>
          </div>
          <span></span>
      </div>
        <div class="navfen"  ref="dian"  v-for="(list,index) in navlist" @click="open(index)">
          <span :class="list.tu"></span> <span>{{list.chaoname}}</span>
        </div>
        
      </div>
    </div>
    <div class="rigthmian"> 
       <div v-show="viw == 0">
         <one></one>
       </div>
        <div v-show="viw == 1">
         <tow></tow>
       </div>
        <div v-show="viw == 2">
         <thr></thr>
       </div>
        <div v-show="viw == 3">
         <tor></tor>
       </div>
        <div v-show="viw == 4">
         <fin></fin>
       </div>
        <div v-show="viw == 5">
         <six></six>
       </div>
       
    </div>
  </div>
</template>

<script>
import one from './H1'
import tow from './H2'
import thr from './H3'
import tor from './H4'
import fin from './H5'
import six from './H6'
import nie from './H7'
export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      navlist:[
      {tu:"glyphicon-user glyphicon",chaoname:"员工管理"},
      {tu:"glyphicon-list-alt glyphicon",chaoname:"车辆管理"},
      {tu:"glyphicon-th-large glyphicon",chaoname:"站点管理"},
      {tu:"glyphicon-inbox glyphicon",chaoname:"司机管理"},
      {tu:"glyphicon-road glyphicon",chaoname:"路线管理"},
      {tu:"glyphicon-log-out glyphicon",chaoname:"城市管理"}
     
    
      ],
      viw : 0,
      master:true
    }
  },
  mounted(){
    this.window()
  }
  ,methods:{
    open(a){
        this.viw = a;
          for(let i =0 ;i<=this.$refs.dian.length;i++){
            if(a == i){
                this.$refs.dian[i].style.color="#66f87b";
            }else{
                this.$refs.dian[i].style.color="#b2b2b2";
            }
          
          }
        console.log(this.$refs.dian.length);

    },masteropen(){
        if(this.master == true){
          this.master = false;
        }else{
           this.master = true;
        }
    },window(){
       this.$refs.dian[0].style.color="#66f87b";
       
    }
  },
  components:{
    one,
    tow,
    thr,
    tor,
    fin,
    six,
    nie
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
/*.hello{
  width: 100vw;
  height: 100vh;
  background: #747474;
}
*/

.master{
  width: 19vw;
  height: 19vw;
  border-bottom: 2px solid #b2b2b2;
}
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
  position: fixed;
  left: 0;
  top: 0;
}
.rigthmian{
  float: right; 
 width: 80vw; 
 background: white;
 overflow: hidden;
 
}
.sss{
 
 height: 100vh;
}
.navfen{
  color: #b2b2b2;
  width: 100%;
  height: 10vh;
  font-size: 16px;
  line-height: 10vh;

}
.navfen span{
  margin-left: 2vw;
}
.mastermin span{
  margin-left: 2vw;
}
.mastermin{
   color:white;
  width: 100%;
  height: 10vh;
  font-size: 16px;
  line-height: 10vh;
}
</style>
