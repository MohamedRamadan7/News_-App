
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticalItem(article,context)=> InkWell(
  onTap: ()
  {
    Navigator.push(context, MaterialPageRoute(
        builder:(context)=> WebViewScreen(article['url']))
    );
  },
  child:Padding(

    padding: const EdgeInsets.all(20.0),
    child: Row(

      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

          ),

        ),



      ],

    ),

  ),
);

Function? validateFunc() => null;


Widget defaultFormFiled({
  required TextEditingController controller,
  required TextInputType type,
  required String lable,
  required IconData fixIcon,
  IconData? suffix,
  bool ispassword= false,
  Function onChanged=validateFunc,
  Function onsumit=validateFunc,
  Function ontap=validateFunc,
  Function validation=validateFunc,
  Function sufixpressd=validateFunc,
  bool isClicable = true,

})=>TextFormField(
  controller:controller,
  keyboardType:type,
  obscureText: ispassword,
  onFieldSubmitted: onsumit(),
  onChanged: (value)=>onChanged(value),
  onTap: ()=>ontap(),
  enabled:isClicable ,
  validator: (value)=>validation(value),

  decoration:InputDecoration(
    prefixIcon: Icon(
        fixIcon
    ),
    suffixIcon: IconButton(
      onPressed:()=>sufixpressd() ,
      icon: Icon(
          suffix
      ),
    ) ,
    labelText: lable,
    border: OutlineInputBorder(),

  ),
);

