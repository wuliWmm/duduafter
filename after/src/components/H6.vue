<template>
  <div class="hello">
      <div class="ctyi">
          <div class="ctimg"><img src="../assets/cehng.png" /></div>
          <div class="cttitle"><span>城市管理系统</span></div>
      </div>
      <div class="topnav" v-show="top == true">
          <div>市单位</div>
          <div>省单位</div>
          <div>城市ID</div>
          <div>城市操作</div>
          <a class="aa" href="#b" target="_self">Add</a>
      </div>

      <div class="ctbody"> 
         <div class="list" v-for="(lis,index) in citilist">
           <div>
              <span>{{lis.shi}}</span>
           </div>
             <div>
              <span>{{lis.sheng}}</span>
           </div>
             <div>
              <span>{{lis.shiid}}</span>
           </div>
             <div>
              <button class="btn" @click="del(index)">删除</button>
           </div>
         </div>
      </div>
      <div class="add" id="dingbu">
        添加城市
      </div>
      <div class="ctfooter">
          <div><input class="form-control inpuT1" v-model="jshi" placeholder="市单位"></div>
          <div><input class="form-control inpuT1" v-model="jsheng" placeholder="省单位"></div>
          <div><input class="form-control inpuT1" v-model="jshiid" placeholder="城市ID"></div>
          <div><button class="butt btn" @click="submi()">添加</button></div>
      </div>
      <a href name="b"></a>
  </div>
</template>

<script>
export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      scroll:"",
      top:false,
      citilist:[],
      jshi:"",
      jsheng:"",
      jshiid:"",
      scrolled:""
     
    }
  },
  mounted(){
    window.addEventListener('scroll', this.menu),
    this.cha()


  },
  methods:{
    del(aa){
      let id =  this.citilist[aa].id
       
         this.$ajax.get("http://localhost/dudel.php?id="+id).then((res)=>{
          if(res.data == 1){
          
          this.$ajax.get("http://localhost/get.php").then((res)=>{
                //console.log(res);
                this.citilist = res.data;
                this.$store.commit("chuange",res.data);
                
            })
         
        } 
         })
    }
    ,
 menu() {
    
    this.scrolled = window.scrollY;
    console.log(this.scrolled);
    if(this.scrolled > 126){
     this.top = true; 
    }else{
      this.top = false; 
    }
  
   }
  ,
      wmenu() {
    this.scroll = document.body.scrollTop;
    console.log(this.scroll)
    if(this.scroll > 126){
     this.top = true; 
    }else{
      this.top = false; 
    }
   },cha(){
    this.citilist= this.$store.state.singlist;
    this.$ajax.get("http://localhost/get.php").then((res)=>{
        //console.log(res);
        this.citilist = res.data;
        this.$store.commit("chuange",res.data);
        
    })
    console.log(this.citilist);  
   },
   submi(){
    console.log(this.jshiid)
    this.$ajax.get("http://localhost/h6insert.php? shi="+this.jshi+"&sheng="+this.jsheng+"&shiid="+this.jshiid).then((res)=>{
        console.log(res);
        if(res.data == 1){
          this.jshi = ""
          this.jsheng = ""
          this.jshiid =""
          this.$ajax.get("http://localhost/get.php").then((res)=>{
                //console.log(res);
                this.citilist = res.data;
                this.$store.commit("chuange",res.data);
                
            })
         
        } 
    })
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
.ctyi{
  width: 80vw;
  height: 20vh;
  background: #574e4e;

}
.ctimg{
  width: 20vh;
  height: 20vh;
  float: left;
  margin-left: 5vw;

}
.ctimg img{
  width: 100%;
  height: 100%;
}
.cttitle{
 width: 50vw;
  height: 20vh;
 float: left;
 margin-left: 5vw;
 line-height: 20vh;
 font-size: 10vh;
 color: white;
}
.ctbody{
  padding-top: 10vh;
  width: 80vw;
 
  padding-bottom: 10vh;

}
.topnav{
  padding-left:10%;
  width: 79vw;
  height: 10vh;
 background: #574e4e;
  position: fixed;
  top: 0;
  left: 20vw;
}
.topnav div{
  float: left;
  width: 20%;
  height: 10vh;
  line-height: 10vh;
  text-align: center;
  font-size: 20px;
  color: white;
}
.list{
  padding-left: 15%; 
  width: 80vw;
  height: 10vh;
}
.list div{
   
   float: left;
  width: 20%;
  height: 10vh;
  line-height: 10vh;
  text-align: center;
  font-size: 14px;
  color: white;
  border: 1px solid #574e4e;
  color: #574e4e;

}
.ctfooter{
   width: 80vw;
     padding-left: 15%;
}
.ctfooter div{
  float: left;
  width: 20%;
  height: 10vh;
  line-height: 10vh;
  font-size: 14px;


}
.butt{
  margin-left: 4vw;
  margin-top: 1vh;
}
.add{
  width: 100%;
  height: 4vh;
  text-align:center;
  border-bottom: 2px solid #574e4e;
  font-size: 16px;
  font-weight: bold;
  padding-bottom: 2vh;
}
.aa{
  display: block;
  text-decoration: none;
  width: 50px;
  height: 50px;
  position: absolute;
  right: 2vw;
  top: 1.2vh;
  background: white;
  color:#574e4e; 
  text-align:center;
  border-radius: 50%;
  line-height: 50px;
}
</style>
