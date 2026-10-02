import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget{
  final String currentRoute;

  const NavigationButtons({
    super.key,
    required this.currentRoute,
  });

  void navigateTo(
    BuildContext context,
    String route,
  ){
      if(currentRoute == route){
        return;
      }
    Navigator.pushReplacementNamed(
    context,
    route,
  );
}

Widget buildNavigationButton({
  required BuildContext context,
  required String route,
  required String text,
  required IconData icon,
  required Color color,

}){
   return Container(
     width: double.infinity,
     margin: const EdgeInsets.only(bottom: 20),

     child: ElevatedButton.icon(
        onPressed: (){
          navigateTo(context, route);
        },
        icon: Icon(
           icon,
           size: 28,
        ),
        label: Text(
            text,
           style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
           ),

        ),
        style: ElevatedButton.styleFrom(
           backgroundColor: color,
           foregroundColor: Colors.white,

           padding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 20,
           ),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(16),
           ),
           elevation: 5,
        ),
     ),


   );
}

@override
Widget build(BuildContext context){
  return Column(
     crossAxisAlignment: CrossAxisAlignment.stretch,

     children:[
        if(currentRoute != '/')
          buildNavigationButton(
            context: context,
            route: '/',
            text: 'Go to home page',
            icon: Icons.home,
            color: Colors.blue
          ),
          if(currentRoute != '/products')
          buildNavigationButton(
            context: context,
            route: '/products',
            text: 'Go to products',
            icon: Icons.shopping_cart,
            color: Colors.green,
          ),
          if(currentRoute != '/profile')
          buildNavigationButton(
            context: context,
            route: '/profile',
            text: 'Go to profile',
            icon: Icons.person,
            color: Colors.deepPurple,
          ),

     ],

  );
}
}