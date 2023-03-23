import 'package:flutter/material.dart';
import 'colors.dart';
import 'home.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,

      appBar: AppBar(
          title: Text('Giới thiệu'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                icon: Icon(Icons.start_outlined))
          ]
      ),
      body: Center(  
          child: Column(  
            children: <Widget>[  
              
              Image.network(  'https://raw.githubusercontent.com/Ganod-d/Nhom3_Laptrinhdidong/main/avatar2.png',
                 height: 600,  
                  width: 600  
              ),
              Text(  
                  'Thành viên Nhóm 3:',  
                  style: TextStyle(fontSize: 50.0, color: Colors.orange),  
              )  ,  
              Text(  
                  'Ngô Anh Đông',  
                  style: TextStyle(fontSize: 30.0,color:Colors.blue),  
              ),
              Text(  
                  'Đặng Danh Cường',
                   
                  style: TextStyle(fontSize: 30.0, color:Colors.blue),  
              ),
             
              Text(  
                  'Trần Thị Thuận',  
                  style: TextStyle(fontSize: 30.0,color:Colors.blue),  
              )      
            ],  
          ),  
        ),  
      //  body: Center(
        
      //   child: const Image(
              
      //         image: NetworkImage('https://raw.githubusercontent.com/Ganod-d/Nhom3_Laptrinhdidong/main/avatar2.png'),
      //         height: 500,
      //         width: 500,
              
      //   )
      //   /* add child content here */,
      // ),
    );
  }
}
