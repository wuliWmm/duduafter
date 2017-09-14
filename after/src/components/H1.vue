<template>
  <div class="hello">
      <div class="ctyi">
          <div class="ctimg"><img src="../assets/cehng.png" /></div>
          <div class="cttitle"><span>成员管理系统</span></div>
      </div>
      <div class="topnav" v-show="top == true">
          <div>编号</div>
          <div>用户名</div>
          <div>密码</div>
          <div>操作</div>
          <a class="aa" href="#b" target="_self">Add</a>
      </div>

      <div class="ctbody"> 
         <div class="list" v-for="(ldd,index) in ccitilist">
           <div>
              <span>{{index+1}}</span>
           </div>
             <div>
              <span>{{ldd.name}}</span>
           </div>
             <div>
              <span>{{ldd.pass}}</span>
           </div>
             <div>
              <button class="btn" @click="dell(ldd.id)">删除</button>
           </div>
         </div>
      </div>
      <div class="add" id="dingbu">
        添加成员
      </div>
      <div class="ctfooter">
          <div><input class="form-control inpuT1" v-model="username" placeholder="市单位"></div>
          <div><input class="form-control inpuT1" v-model="password" placeholder="省单位"></div>
         
          <div><button class="butt btn" @click="ssubmi()">添加</button></div>
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
      ccitilist:[],
      username:"",
      password:"",
     
      scrolled:""
     
    }
  },
  mounted(){
    window.addEventListener('scroll', this.menu),
    this.ccha()


  },
  methods:{
    dell(aa){
      let id = aa;
       
         this.$ajax.get("http://localhost/dudelcheng.php?id="+id).then((res)=>{
          if(res.data == 1){
          
          this.$ajax.get("http://localhost/getcheng.php").then((res)=>{
                //console.log(res);
                this.ccitilist = res.data;
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
   },ccha(){
    this.citilist= this.$store.state.singlist;
    this.$ajax.get("http://localhost/getcheng.php").then((res)=>{
        //console.log(res);
        this.ccitilist = res.data;
        this.$store.commit("chuange",res.data);
        
    })
    console.log(this.ccitilist);  
   },
   ssubmi(){
    console.log(this.jshiid)
    this.$ajax.get("http://localhost/h6insertcheng.php?shi="+ this.username+"&shiid="+ this.password).then((res)=>{
        console.log(res);
        if(res.data == 1){
          this.username = ""
          this.password = ""
          
          this.$ajax.get("http://localhost/getcheng.php").then((res)=>{
                //console.log(res);
                this.ccitilist = res.data;
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
