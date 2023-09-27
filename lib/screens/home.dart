import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController1 =TextEditingController();
    TextEditingController _textController2 =TextEditingController();
    List<String> dataList =[];
    void addtoList(){
      String text1 =_textController1.text;
            String text2 =_textController2.text;
            if(text1.isNotEmpty && text2.isNotEmpty){
              setState(() {
                dataList.add("text1: $text1,text2: $text2");
                
              });
            }

    }
    
  @override
  void dispose(){
    _textController1.dispose();
     _textController2.dispose();
     super.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
      ),
      body: Column(
        children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController1,
                  decoration: InputDecoration(
                    hintText: "Director name"
                  ),
                  
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    controller: _textController2,
                  decoration: InputDecoration(
                    hintText: "Movie name"
                  ),
                  
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: addtoList,
                 
                  
                 child:Text("Add",style: TextStyle(color: Colors.black),), )

              ],
            ),

SizedBox(height: 16,),
Text("Entered Data:"),
SizedBox(height: 8.0,),
Expanded(child: ListView.builder(
  itemCount: dataList.length,
  itemBuilder: (context,index){
  return ListTile(
    title: Text(dataList[index]),
  );
}))

        ], 
        

      ),
    );
  }
}