<template>
  <div class="hello">
      <div class="ctyi">
          <div class="ctimg"><img src="../assets/cehng.png" /></div>
          <div class="cttitle"><span>路线管理系统</span></div>
      </div>
      

      <div class="ctbody"> 
      <!-- 下啦列表 -->
        <div class="xialist">
            <div class="sssss">
              <span>
                当前地址：
              </span>
            </div>
            <div class="xialist1" @click="kai()">{{clic}}</div>

            <div class="xialist2" v-show=" aaa == true">
              <div v-for="(le,index)  in citilist" @click="off(index)">
                  {{le.shi}}
              </div>
            </div>
        </div>
        
        <div class="bline">
          <table class="table table-condensed">
            <tr>
              <td>
                编号
              </td>
              <td>
                线名
              </td>
              <td>
                司机
              </td>
              <td>
                操作
              </td>
            </tr>
            <tr  v-for="(li,index)  in linlist">
              <td>
              {{index+1}}
              </td>
              <td>
               {{li.linename}}
              </td>
              <td>
                {{li.buser}}
              </td>
              <td>
                <button class="btn" @click="selit(index,li.linename)" >查看全部站点</button>
              </td>
            </tr>
          </table>
        </div>
        <div class="Right" v-show="rrr == true">
            <div class="R1" @click="guan()">
              <span class="ssddd glyphicon glyphicon-menu-left"></span>
              <div class="cediv">{{rt}}</div>
              <div>
                <div class="ce" v-for="(sd,index) in fenlist">
                  <span>第{{sd.nth}}站</span>
                  <span>{{sd.zhandian}}</span>
                </div>
              </div>
            </div>
        </div>
        <div class="add" id="dingbu">
        添加城市
        </div>
        <div class="ctfooter">
            <div><input class="form-control inpuT1" v-model="xian" placeholder="线"></div>
             <div><input class="form-control inpuT1" v-model="cheng" placeholder="线id"></div>
            <div><input class="form-control inpuT1" v-model="xianid" placeholder="城市id"></div>
            <div><input class="form-control inpuT1" v-model="siji" placeholder="司机"></div>
            <div><button class="butt btn" @click="addxian()">添加</button></div>
        </div>

      </div>
  </div>
</template>

<script>
export default {
  name: 'hello',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App',
      scroll:"",
      top:true,
      citilist:[],
      clic:"选择城市",
      shiid:"",
      aaa:false,
      linlist:[],
      xian:"",
      siji:"",
      cheng:"",
      xianid:"",
      rrr:false,
      fenlist:[],
      rt:""
     
    }
  },
  mounted(){
    window.addEventListener('scroll', this.menu),
    this.chad()


  },
  methods:{
    selit(a,ss){
        this.rrr = true; 
        let cids = this.linlist[a].lineid;
        this.rt = ss;
        this.$ajax.get("http://localhost/getdian.php?bus="+cids).then((res)=>{
                
                // this.citilist = res.data;
                // this.$store.commit("chuange",res.data);
                this.fenlist = res.data;
                
            })
    },
    guan(){
         this.rrr = false; 
    },
    off(ss){
        this.clic = this.citilist[ss].shi;
        this.aaa = false; 
        let cid = this.citilist[ss].shiid;
        //alert(cid)
        this.$ajax.get("http://localhost/getline.php?shiid="+cid).then((res)=>{
          console.log(res)
          this.linlist =  res.data;
        })
    },
    kai(){
      this.aaa = true; 
      //console.log(this.citilist)
      this.$ajax.get("http://localhost/get.php").then((res)=>{
                //console.log(res);
                this.citilist = res.data;
                this.$store.commit("chuange",res.data);
                
            })

    },
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
   },chad(){
    this.citilist= this.$store.state.singlist;
    
    console.log(this.citilist);  
   },
  addxian(){
    

      this.$ajax.get("http://localhost/h7insert.php? ln="+this.xian+"&li="+this.xianid+"&ls="+this.cheng+"&si="+this.siji).then((res)=>{
            console.log(res);
            if(res.data == 1){
             
             this.$ajax.get("http://localhost/getline.php?shiid="+this.xianid).then((res)=>{
              console.log(res)
              this.linlist =  res.data;
              //alert("到了")
                this.xian="",
                this.siji="",
                this.cheng="",
                this.xianid=""
            })
             
        } 
    })
    
  
   }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.ssddd{
  font-size: 20px;
}
.cediv{
  width: 300px;
  height: 10vh;
  font-size: 24px;
  line-height: 10vh;
  text-align: center;
}
.ce span{
  margin-left: 3vw;
}
.ce{
  width: 300px;
  height: 6vh;
  font-size: 20px;
  line-height: 6vh;
}
.ce:hover{
  background: #ccc;
  width:300px;
  color: white;
}
.R1{
  position: absolute;
  left:0;
  top: 0;
}
.Right{
  width: 300px;
  height: 100vh;
  position: fixed;
  right: 0;
  background: #747474;
  top: 0;
}
.sssss{
  position: absolute;
  line-height: 10vh;
  font-weight: bold;
  padding-left: 2vw;
}
.bline{
  width: 80vw;
  text-align: center;
 
}
.bline table tr td{
  height: 10vh;
  line-height: 10vh;
  font-size: 20px;
}
.bline1 span{
  margin-left: 10vw;
}
.xialist{
  width: 100%;
  height: 10vh;
  background: #ccc;
  margin-top: -10vh;
}
.xialist1{
  width: 30%;
  text-align: center;
  line-height: 10vh;
  font-size: 20px;
  padding-right: 3vw;

}
.xialist2{
  position:absolute;
  margin-left: 2vw;
  top: 30vh;
   width: 30vh;
  text-align: center;
    font-size: 20px;
}
.xialist2 div{
  width: 100%;
  height: 6vh;
  line-height: 6vh;
  background: #ccc;
  border-bottom:2px white solid;
}
.xialist2 div:hover{
  background: #666;
  color: white;
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
</style>
