import 'package:bookworm/pages/search_page.dart';
import 'package:flutter/material.dart';

class DetailsBook extends StatelessWidget {
  const DetailsBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 150, 179, 204),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, top: 34 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      tooltip: 'Voltar',
                      onPressed: (){Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => SearchPage(),
                        ),
                        );
                        }, icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),),
                        Text(
                          'Detalhes',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                          ),

                        ),
                        Tooltip(
                          message: 'Adicionar Livro',
                          triggerMode: TooltipTriggerMode.tap,
                          // child: IconButton(onPressed: (){}
                           

                          ),
                        
                  ],)   
                ),
                
                
            ],
          ),
        )
      )


    );
  }
}
