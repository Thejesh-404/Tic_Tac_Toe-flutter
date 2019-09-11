import 'package:flutter/material.dart';
//import 'dart:io';

class Homepage extends StatefulWidget {
  @override
   _HomepageState createState() => _HomepageState();
}
  
class _HomepageState extends State<Homepage> {

  bool iscross = true;
  String message;
  List state;

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  @override
  void initState() {
    super.initState();
    setState(() {
  this.state = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
  this.message = "";
    });
  }

  resetstate(){
    //sleep(const Duration(seconds: 2));
    setState(() {
  this.state = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
 this.message = "";
  });
  }

  playgame(int index){
    if(this.state[index]== "empty"){
    setState(() {
      if(this.iscross)
      {
        this.state[index] = "cross";
        this.iscross = false;
      }
      else{
        this.state[index] = "circle";
        this.iscross = true;  
      }
      //this.iscross = !this.iscross;
     this.checkwin(); 
    });
  }
  }


checkwin(){
  if(state[0] !="empty" && state[0]==state[1] && state[1]==state[2])
  {
    setState(() {
       this.message = "${state[0]}wins"; 
    }); 
  }
  else if(state[3] !="empty" && state[3]==state[4] && state[4]==state[5])
  {
    setState(() {
       this.message = "${state[3]}wins";    
    });  
    
  }
   else if(state[6] !="empty" && state[6]==state[7] && state[7]==state[8])
  {
    setState(() {
      this.message = "${state[6]}wins";    
    }); 
    
  }
   else if(state[0] !="empty" && state[0]==state[3] && state[3]==state[6])
  {
    setState(() {
      this.message = "${state[3]}wins";    
    });   
   
  }
   else if(state[1] !="empty" && state[1]==state[4] && state[4]==state[7])
  {
    setState(() {
       this.message = "${state[1]}wins";  
    });  
    
  }
  else if(state[2] !="empty" && state[2]==state[5] && state[5]==state[8])
  {
    setState(() {
      this.message = "${state[2]}wins";    
    });
    
  }
   else if(state[0] !="empty" && state[0]==state[4] && state[4]==state[8])
  {
    setState(() {
      this.message = "${state[0]}wins";   
    }); 
    
  }
   else if(state[2] !="empty" && state[2]==state[4] && state[4]==state[6])
  {
    setState(() {
      this.message = "${state[2]}wins"; 
    });
   
  }
  else if(!state.contains("empty"))
  {
    setState(() {
     this.message = "Draw"; 
    }); 
    
  }

}





  AssetImage getimage(String value){

    switch(value) {
      case("empty") :
      return this.edit;
      break;
      case("cross") :
      return this.cross;
      break;
      case("circle") :
      return this.circle;
      break;
    }
  }

   @override
   Widget build(BuildContext context) {
    return 
  Scaffold(
    appBar: AppBar(title :Text("Tic-Tac-Toe")),
    body :
Column(
mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[
  Expanded(
    child: GridView.builder(
    padding: EdgeInsets.all(20.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio : 1.0,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),

    itemCount: 9,
    itemBuilder: (context, i) => SizedBox(
        //width: 100.0,
        //height: 100.0,
        child: MaterialButton(
          child :
           Image(
          image : this.getimage(this.state[i]),
          ),  
          splashColor: Colors.cyan,
          onPressed: (){
            this.playgame(i);
          }, 
        ),
      ),
    ),
  ),

  Container(
 padding: EdgeInsets.all(20.0),
 child: Text(this.message,
style: TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Colors.tealAccent,
),
  ),
  ),

  MaterialButton(
    color : Colors.lightBlue,
    minWidth: 300.0,
    height: 50.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: 
    Text("Reset Game",style: TextStyle( color: Colors.yellowAccent,fontSize: 20.0,),),
    onPressed: (){ 
    this.resetstate();
    },
  ),

Container(
  padding: EdgeInsets.all(20.0),
  child: 
  Text("x-code",style: TextStyle(fontSize: 30.0)),

)
],), 
  );
  }
} 