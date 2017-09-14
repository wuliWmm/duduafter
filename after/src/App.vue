<template>
  <div id="app">
    
    <router-view></router-view>
   <!--  <button class="btn">ssss</button> -->
    <div class="denglu" v-show="denglu == true">
    <div class="deng">
        <input class="form-control inpuT1" v-model="name" placeholder="账号">
        <input class="form-control inpuT2" type="password"  v-model="pass" placeholder="密码">
         <button type="submit" class="btn btn-default Btn" @click="deng" >登陆</button>
    </div>
  </div>
  </div>
 
</template>

<script>
export default {
  name: 'hello',
  data () {
    return {
      denglu:true,
      name:"",
      pass:""
     
    }
  },
  methods:{
      deng(){
        //alert(this.name)
         console.log(this.name);
        this.$ajax.get("http://localhost/login.php?aaa="+this.name+"&bbb="+this.pass).then((res)=>{
              console.log(res)
              if(res.data[0].name != this.name){
                  alert("用户名或密码错误");
                  this.name = "";
                  this.pass="";
              }else{
                  this.denglu=false;
                   this.name = "";
                  this.pass="";
              }
        })
      }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  
}
.denglu{
  position: fixed;
  top: 0;
  background: url(./assets/deng.jpg) no-repeat;
  background-position:;
  background-size:100% 100%;  
  width: 100vw;
  height: 100vh;
  z-index: 100;
}
.deng{
  width: 400px;
  height: 260px;
  background: white;
  opacity:0.7;
  margin:0 auto;
   border-radius: 10px;
  overflow: auto;  
  margin: auto;  
  position: absolute;  
  top: 0; left: 0; bottom: 0; right: 0;
  border: 4px #ccc solid;
}
.inpuT1{
  width: 60%;
  margin-left: 20%;
  margin-top: 15%;
  background: white;
}
.inpuT2{
  width: 60%;
  margin-left: 20%;
  margin-top: 5%;
  background: white;
}
.Btn{
  width: 40%;
  margin-left: 30%;
  margin-top: 5%;
  font-weight: bold;
}
</style>
