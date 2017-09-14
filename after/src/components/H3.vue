<template>
  <div class="hello">
  <div class="ttop">
        <div>
          
        </div>
  </div>
    <div class="sou">
        <div class="sou1">
            <input type="" v-model="chaxun" class="form-control" placeholder="查线路">
        </div>

        <div class="sou1">
          <button class="btn btn-primary" @click="chacha()">查询</button>
        </div>
        <div class="sou2">
         <span>当前线路:{{line}}</span>
        </div>
    </div>
    <div class="chaxun">
    <table class="table table-striped" v-show="table == false">
        <tr>
          <td>线路</td>
          <td>线id</td>
          <td>司机</td>
        </tr>
       <tr v-for="(li,index) in linelist" @click="okline(li.linename,li.lineid)">
         <td>{{li.linename}}</td>
         <td>{{li.lineid}}</td>
         <td>{{li.buser}}</td>
      
    </tr>
    </table>
      </div>
    <div>
        <div class="Ttble">
            <table class="table" v-show="table == true">
                <tr>
                  <td>站数</td>
                  <td>线id</td>
                  <td>地理位置</td>
                  <td>站名</td>
                </tr>
                <tr v-for="(li,index) in zhanlist">
                      <td>{{li.nth }}</td>
                     <td>{{li.lineid}}</td>
                     <td>{{li.postion}}</td>
                     <td>{{li.zhandian}}</td>
                  
                </tr>
            </table>
        </div>
    </div>
<div class="lineinput">
    <div> <input type="" v-model="nth" class="form-control" placeholder="站数"></div>
    <div> <input type="" v-model="lid" class="form-control" placeholder="线id"></div>
    <div> <input type="" v-model="post" class="form-control" placeholder="地理位置"></div>
    <div> <input type="" v-model="stname" class="form-control" placeholder="站名"></div>
</div>
<div class="inputsubmit"> 
    <button class="btn btn-success" @click="sbm()">提交</button>
</div>
  </div>
</template>

<script>
export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      line:"",
      linelist:[],
      chaxun:"",
      table:true,
      zhanlist:[],
      nth:"",
      lid:"",
      post:"",
      stname:""
    
    }
  },
  methods:{
    sbm(){
        this.$ajax.get("http://localhost/h8insert.php?a="+this.stname+"&b="+this.nth+"&c="+this.lid+"&d="+this.post).then((res)=>{
              console.log(res);
              if(res.data == 1){
                this.$ajax.get("http://localhost/getdian.php?bus="+this.lid).then((res)=>{
                
                // this.citilist = res.data;
                // this.$store.commit("chuange",res.data);
                  this.zhanlist = res.data;
                  console.log(this.zhanlist);
                   this.nth="",
                  this.lid="",
                  this.post="",
                  this.stname=""
                
            })   
          } 
      })
      
    },
    okline(aa,bb){
        this.line = aa;
        console.log(bb);
        this.table = true
        let cids = bb
        this.$ajax.get("http://localhost/getdian.php?bus="+cids).then((res)=>{
                
                // this.citilist = res.data;
                // this.$store.commit("chuange",res.data);
                this.zhanlist = res.data;
                console.log(this.zhanlist);
                
            })
    
    },
      chacha(){
          this.$ajax.get("http://localhost/dgetline.php?nline="+this.chaxun).then((res)=>{
              console.log(res.data);
              this.linelist =res.data; 
          })
          this.chaxun = "";
          this.table = false;
      }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.inputsubmit button{
  width: 30%;
  margin-left: 35%;

}
.inputsubmit{

  width: 100%;
}
.lineinput div{
  padding-left: 5%;
  padding-right: 5%;
  width: 25%;
  float: left;
}
.lineinput{
   padding-top: 3vh;
  width: 100%;
  height: 10vh;
  padding-bottom: 3vh;
}
.cha1{

}
.chaxun{
  padding-left: 5vw;
  margin-top: 9vh; 
  width: 80VW;

}
.abs{
  position: absolute;
   width: 20vw;
}
.abs div{

} 
.t1{
  margin-left: 5vw;
  width: 10vw;
}
.t2{
  width: 30vw;
}
.t3{
  width: 20vw;
}
.Ttble{
  width: 80vw;
  margin-top: 9vh;
  text-align: center;

}
.Ttble div{
  float: left; 
}
.ttop{
  width: 100%;
  height: 5vh;
  background: #ccc;
}
.sou{
  width: 100%;
  margin-top: 2vh;
  line-height: 5vh;
  font-size: 20px;
  position: relative;
}
.sou1{
  float: left;
  width: 20%;
  margin-left: 5%;
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
