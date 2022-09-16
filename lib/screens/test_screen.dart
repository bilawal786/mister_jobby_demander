import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int childValue = 0;
  List<int> expansion = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Test Screen",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Nous sommes Ikae Digital, une équipe créative et professionnelle avec plus de 7 ans d'expérience chez Conception UI/UX et développement front-end. Nous apportons de la beauté au design. Nous sommes Ikae Digital, une équipe créative et professionnelle avec plus de 7 ans d'expérience chez Conception UI/UX et développement front-end. Nous apportons de la beauté au design. Nous sommes Ikae Digital, une équipe créative et professionnelle avec plus de 7 ans d'expérience chez Conception UI/UX et développement front-end. Nous apportons de la beauté au design. Nous sommes Ikae Digital, une équipe créative et professionnelle avec plus de 7 ans d'expérience chez Conception UI/UX et développement front-end. Nous apportons de la beauté au design. Nous sommes Ikae Digital, une équipe créative et professionnelle avec plus de 7 ans d'expérience chez Conception UI/UX et développement front-end. Nous apportons de la beauté au design. Nous sommes Ikae Digital, une équipe créative et professionnelle avec plus de 7 ans d'expérience chez Conception UI/UX et développement front-end. Nous apportons de la beauté au design.",
                  style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/40,),
              Card(
                child: Column(
                  children: [
                    Image.asset("assets/images/appLogo.png",scale:4),
                    Text("Tous les droits sont réservés.",style: Theme.of(context).textTheme.bodySmall,),
                    SizedBox(height: MediaQuery.of(context).size.width/40,),
                    Text("Mister Jobby est une application de services mobiles polyvalents. Professionnellement construit avec un UX élevé pour donner à votre page\n                le grand regard.",style: Theme.of(context).textTheme.bodySmall,),
                    SizedBox(height: MediaQuery.of(context).size.width/40,),
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*.08,
                          width: MediaQuery.of(context).size.height*.08,
                          color: Colors.blue.shade100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
