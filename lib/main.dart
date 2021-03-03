/* /* import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CalendarController _calendar;
  @override
  void initState() {
    super.initState();
   _calendar = CalendarController();
  }

  @override
  void dispose() {
    _calendar.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[50],
              appBar: AppBar(
          title: Text('👨🏾‍💻')
        ),
        body:/* MyCalendar(calendar: _calendar) */ GridView.builder(gridDelegate: null, itemBuilder: null)
      ),
    );
  }
}

class MyCalendar extends StatelessWidget {
  const MyCalendar({
    Key key,
    @required CalendarController calendar,
  }) : _calendar = calendar, super(key: key);

  final CalendarController _calendar;

  @override
  Widget build(BuildContext context) {
    final deviceSize =MediaQuery.of(context).size;
    bool out = true;
    return Column(
          children:<Widget> [
            Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        height: deviceSize.height/2.2,
            child: Center(
              child: Container(
          decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey,
                     blurRadius: 2.0,
                     spreadRadius: 0.0,
                     offset: Offset(4.0, 4.0)
                   )
                 ]
               ),
          width:deviceSize.width/1.2,
          alignment: Alignment.topCenter,
          child: TableCalendar(
            rowHeight:deviceSize.height/14,
            availableGestures: AvailableGestures.none,
            headerVisible: false,
              calendarController: _calendar,
              locale: 'fr_FR',
              builders: CalendarBuilders(
                dayBuilder: (context, date, events) {
                  if(!out){
                    if(date.month != DateTime.now().month){
                      out = true;
                    }
                  }
                  if(date.day == 1){
                    out = false;
                  }
                 final DateTime today = DateTime.now();
                 final int indiceDay = today.weekday;
                 final int nbJoursAvant = indiceDay - 1;
                 final int nbJoursApres = 7 - indiceDay;
                if (date.day >= today.day - nbJoursAvant - 1 && date.day < today.day + nbJoursApres && date.month == today.month){
                   return Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.indigo[200],
                      child:Center(child: Text('${date.day}',style: TextStyle(fontWeight: FontWeight.values[4], color: out?Colors.grey:Colors.black),))
                  );
                 }
                  return Center(child: Text('${date.day}', style: TextStyle(color: out?Colors.grey:Colors.black),));
                },
              /*   weekendDayBuilder: (context, date, events ){
                final DateTime today = DateTime.now();
                 final int indiceDay = today.weekday;
                 print(indiceDay);
                 final int nbJoursAvant = indiceDay - 2;
                 final int nbJoursApres = 7 - indiceDay;
                  if(date.day > DateTime.now().day - 6 && date.day < DateTime.now().day + 6 ){
                    return Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.indigo[200],
                      child: Center(child: Text('${date.day}',style: TextStyle(fontWeight: FontWeight.values[4]),)),
                  );
                  }
                  return Center(
                    child: Text(date.day.toString()),
                    );
                }, */
                outsideDayBuilder: (context, date, events) {
                 return Center(
                   child:Text('${date.day}', style: TextStyle(color: Colors.grey),),
                 );
                },
                todayDayBuilder: (context, date, events) {
                  return Container(
                    padding: EdgeInsets.all(4),
                    color: Colors.indigo[200],
                      child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                      ),
                      child: Center(child: Text('${date.day}',style: TextStyle(fontWeight: FontWeight.values[4]),)),
                    ),
                  );
                },
                dowWeekdayBuilder: (context, weekday) {
                  String date;
                  weekday[0]== 'l'? date  = 'L':
                  
                    weekday[0] == 'm'? date = 'M':
                  
                    weekday[0] == 'j'? date = 'J':
                    
                      weekday[0] == 'v'? date = 'V':
                      weekday[0] == 'd'? date = 'D':
                      date = 'S';

                  return Center(
                     child: Text('$date', style: TextStyle(fontWeight: FontWeight.bold),),
                  );
                },
              )
          ),
        ),
            ),
      ),
      SizedBox(height: 20,),
      Container(
        /* height: 100, */
        decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey,
                     blurRadius: 2.0,
                     spreadRadius: 0.0,
                     offset: Offset(0.0, 1.2)
                   )
                 ]
               ),
        child: Column(
          children: [
           /*  InkWell(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          isThreeLine: false,
            leading: Icon(Icons.calendar_today_rounded, color: Colors.yellow, size: deviceSize.height/25,),
            title: Text('Semaine en cours',style: TextStyle(color: Colors.grey, fontSize:deviceSize.height/60, fontWeight: FontWeight.bold)),
            subtitle: Text('0 devoir(s)', style: TextStyle(color: Colors.blue, fontSize:deviceSize.height/75)),
          ),
        ), */
        Container(
          margin: EdgeInsets.symmetric(vertical: 5 ),
          child: Row(
            children: [
              SizedBox(width: 20),
              Icon(Icons.calendar_today_rounded, color: Colors.yellow, size: deviceSize.height/22,),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Semaine en cours',style: TextStyle(color: Colors.grey, fontSize:deviceSize.height/57, fontWeight: FontWeight.bold)),
                  Text('0 devoir(s)', style: TextStyle(color: Colors.indigo, fontSize:deviceSize.height/73)),
                ],
              )
            ],
          ),
        ),
      Divider(endIndent: 20, indent: 20, ),
     Container(
          margin: EdgeInsets.symmetric(vertical: 5 ),
          child: Row(
            children: [
              SizedBox(width: 20),
              Icon(Icons.calendar_today_rounded, color: Colors.yellow, size: deviceSize.height/22,),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Semaine prochaine',style: TextStyle(color: Colors.grey, fontSize:deviceSize.height/57, fontWeight: FontWeight.bold)),
                  Text('1 devoir(s)', style: TextStyle(color: Colors.indigo ,fontSize:deviceSize.height/72)),
                ],
              )
            ],
          ),
        ),
          ],
        ),
      ),
      ]
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

void main()=>runApp(MyApp());

/* class MyApp extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('👨🏾‍💻')
        ),
        body: DoubleColumn()
      )
    );
  }

}

class DoubleColumn extends StatefulWidget{
  @override
  _DoubleColumnState createState() => _DoubleColumnState();
}

class _DoubleColumnState extends State<DoubleColumn> {
  final List<String> jours = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi',"Dimanche"];

  Map<String, bool> clicked = {'Lundi':false, 'Mardi':false, 'Mercredi':false, 'Jeudi':false, 'Vendredi':false, 'Samedi':false,"Dimanche":false};

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: deviceSize.width/2,
          height: deviceSize.height/1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: 
              jours.map((e){
                return RaisedButton(
                splashColor: Colors.orange[200],
                color: clicked[e]?Colors.orange[200]:Colors.white,
                onPressed: (){
                  clicked.forEach((key, value) {
                    setState(() {
                      clicked[key] = false;
                    });
                  });
                  setState(() {
                    clicked[e] = true;
                  });
                },
                child: Text(e));
              }).toList(),
          )
        ),
         Container(
          width: deviceSize.width/2,
          height: deviceSize.height/1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                height: 23,
                width: 60,
                color: Colors.blue, 
              ),
              Text('COURS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                ],
              ),
              Container(
                 padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Matin:', textAlign: TextAlign.left,),
              ),
               Container(
                 padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Soir:', textAlign: TextAlign.left),
              ),
                  ],
                ) 
              ),
                 Container(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                height: 23,
                width: 70,
                color: Colors.blue, 
              ),
              Text('DEVOIRS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
                ],
              ),
              Container(
                 padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Matin:', textAlign: TextAlign.left,),
              ),
               Container(
                 padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Soir:', textAlign: TextAlign.left),
              ),
                  ],
                ) 
              ),
            ]
          )
        )
      ],
    );
  }
} */


//Code normal

class MyApp extends StatelessWidget {
 final List<Lesson> _lessons = [
    Lesson(
        id: '-MBx7Zd6OhsKR5AoafXN',
        name: 'Résistance des matériaux',
        classes: ['CP1']),
    Lesson(
        id: '-MBx7ZdAxxh4P0MKjhDp',
        name: "Statique de l'ingénieur",
        classes: ['CP1']),
    Lesson(
        id: '-MBx7ZdNzr04MdMjByFH',
        name: 'Probabilité et Statistique',
        classes: ['CP1']),
    Lesson(
        id: '-MBx7ZeWTN8VdsRKo4vV',
        name: 'Graphe et Optimisation',
        classes: ['CP1']),
    Lesson(
        id: '-MBx7Zk8Fd2PDYyL2KIk', name: 'Anglais', classes: ['CP1', 'CP2']),
    Lesson(
        id: '-MBx7aWb2fJILAI3d4K0',
        name: 'Cinématique et dynamique',
        classes: ['CP1']),
    Lesson(
        id: '-MBx7dKZoP4FDgSmzddL',
        name: 'Analyse Numérique',
        classes: ['CP1']),
    Lesson(id: '-MBx7ZdNzr04MdMjByFI', name: 'Maths I', classes: ['CP1']),
    Lesson(id: '-MBx7_502WIU2XsM95', name: 'Maths II', classes: ['CP1']),
    Lesson(id: '-MBx7ZhK8c2ldvYS26Bc', name: 'Algorithmique', classes: ['CP1']),
    Lesson(
        id: '-MBx7Zjfi1kHRTXXd4Cw',
        name: 'Langage et Programmation',
        classes: ['CP1']),
    Lesson(
        id: '-MBx7Zd8y7MInx16eJUh', name: 'Thermodynamique', classes: ['CP1']),
    Lesson(
        id: '-MBx7ZdI1_og3K0EaApp', name: 'Sport I', classes: ['CP1', 'CP2']),
    Lesson(
        id: '-MBx7ZdKoRUWSGvjiC-J', name: 'Sport II', classes: ['CP1', 'CP2']),
    Lesson(
        id: '-MBx7chQrR2tAjKxwxnv',
        name: 'Mécanique des fluides',
        classes: ['CP2']),
    Lesson(
        id: '-MBx7lTqOLXxunbwnY7C',
        name: "Biologie de l'ingénieur",
        classes: ['CP2']),
    Lesson(
        id: '-MBx7ZdLT5wwnfF1W3X5',
        name: 'Modélisation des phénomènes aléatoires',
        classes: ['CP2']),
    Lesson(id: '-MBx7gLurtLqVprCIwuq', name: 'TEMC', classes: ['CP2', 'CP1']),
    Lesson(
        id: '-MBx7chQrR2tAjKxwxnu',
        name: 'Recherche Opérationnelle',
        classes: ['CP2']),
    Lesson(
        id: '-MBx7ZdNzr04MdMjByFG',
        name: "Physique des Matériaux",
        classes: ['CP2']),
    Lesson(
        id: '-MBx7_DV5YWjpm8BzImu',
        name: 'Transfert thermique',
        classes: ['CP2']),
    Lesson(
        id: '-MBx7_BlnUst20d8TSsy',
        name: 'Dessin Technique/Assisté par Ordinateur',
        classes: ['CP2']),
    Lesson(id: '-MBx7_6aBRWKQUmQLvkb', name: 'Maths III', classes: ['CP2']),
    Lesson(id: '-MBx7Zk0X3g3WZKvdKL2', name: 'Maths IV', classes: ['CP2']),
    Lesson( 
        id: '-MBx7_8KZWsii6ZLCFqo',
        name: 'Méthode numérique de Calcul',
        classes: ['CP2']),
    Lesson(id: '-MBx7frU0y8DsnLSxVO5', name: 'Electricité', classes: ['CP2']),
    Lesson(
        id: '-MBx7ae2XkIixe5pd7sQ',
        name: 'Onde et Electromagnétisme',
        classes: ['CP2']),
  ];
  final Student student = Student(id: '1234567890', nom: 'DJIKPE', prenom: 'Orphée', classe: 'CP2', notes: [
    Note(lessonId: '-MBx7ae2XkIixe5pd7sQ', devoir1: 12, devoir2: 20),
    Note(lessonId: '-MBx7_8KZWsii6ZLCFqo', devoir1: 15, devoir2: 18),
    Note(lessonId: '-MBx7_BlnUst20d8TSsy', devoir1: 09, devoir2: 10),
    Note(lessonId: '-MBx7_DV5YWjpm8BzImu', devoir1: 18, devoir2: 20, devoir3:  16),
    Note(lessonId: '-MBx7chQrR2tAjKxwxnu', devoir1: 10, devoir2: 20),
    Note(lessonId: '-MBx7ZdLT5wwnfF1W3X5', devoir1: 12, ),
    Note(lessonId: '-MBx7lTqOLXxunbwnY7C', devoir1: 12, devoir2: 20, rattrapage:  15),
    Note(lessonId: '-MBx7ZeWTN8VdsRKo4vV', devoir1: 12,),
    Note(lessonId: '-MBx7ZdAxxh4P0MKjhDp', devoir1: 12, devoir2: 20),
    Note(lessonId: '-MBx7Zd6OhsKR5AoafXN')
  ], email: null);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:PerfGrid(lessons: _lessons, student: student),
        )
    );
  }
}

class PerfGrid extends StatefulWidget {
  final List<Lesson> lessons;
  final Student student;

  PerfGrid({@required this.lessons, @required this.student});

  @override
  _PerfGridState createState() => _PerfGridState();
}

class _PerfGridState extends State<PerfGrid> {
 
  double devoir1 ;
  double devoir2 ;
  double devoir3 ;
  double rattrapage = 0;
    double moyenne(dev1, dev2, dev3, rattrap){
    double moyenne = rattrap == 0
          ? (dev3 == 0
              ? (dev1 + dev2) / 2
              : (dev1 + dev2 + dev3) / 3)
          : (rattrap >= 12 ? 12 : rattrap);

    return moyenne;
  }
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final appBarSize = AppBar().preferredSize.height + kToolbarHeight;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text("🤧"),
        ),
          body: 
          Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: Column(
                children:[ Container(
                      /* decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)
                      ), */
                      margin: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                       color: Colors.grey.shade300,
                       boxShadow: [
                          BoxShadow(
                            offset: Offset( -2, -2),
                            color: Colors.black38,
                            blurRadius: 20),
                          BoxShadow(
                            offset: Offset(10, 10),
                           color: Colors.white.withOpacity(0.85),
                          blurRadius: 20)
      ]),
                      height: deviceSize.height/4,
                      width: deviceSize.width/1.3,
                      alignment: Alignment.center,
                      child: Row(
                            children: [
                              Container(
                                width: deviceSize.width/2.6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text("   Table de notes", style:  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                  Row(children: [Text('   Devoir 1: ', style: TextStyle(fontWeight: FontWeight.values[3], color: Colors.grey),),Text('${devoir1 == null || devoir1 == 0? "": devoir1}', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.values[6]),) ]),
                                  Row(children: [Text('   Devoir 2: ', style: TextStyle(fontWeight: FontWeight.values[3], color: Colors.grey),),Text('${devoir2 == null || devoir2 == 0? "": devoir2}', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.values[6]),) ]),
                                  Row(children: [Text('   Devoir 3: ', style: TextStyle(fontWeight: FontWeight.values[3], color: Colors.grey),),Text('${devoir3 == null || devoir3 == 0? "": devoir3}', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.values[6]),) ]),
                                  ],
                                ),
                              ),
                              Container(
                                width: deviceSize.width/2.6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                  Column(children: [SizedBox(height: 25), Row(children: [Text('   Rattrapage: ', style: TextStyle(fontWeight: FontWeight.values[3], color: Colors.grey),),Text('${rattrapage == 0? "": rattrapage}', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.values[6]),) ])]),
                                      Column(children: [
                                        Text('   Decision', style: TextStyle(fontWeight: FontWeight.values[3], color: Colors.grey),),
                                        devoir1 != null?
                                        Decision(devoir2: devoir2,moyenne: moyenne(devoir1, devoir2, devoir3, rattrapage),):
                                        SizedBox(height: 0)
                                        ]),
                                  ],
                                ),
                              )
                            ],
                          ),
                      ),
                  Container(
                    height: (3*deviceSize.height/4)  - appBarSize ,
                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, 
                                    childAspectRatio:3.5,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 3),
             itemBuilder:(ctx, i){
             return InkWell(
                    onTap: (){
                      setState(() {
                        if(i == 0){
                           i = 1;
                        }
                        devoir1 = widget.student.notes[i].devoir1;
                        devoir2 = widget.student.notes[i].devoir2;
                        devoir3 = widget.student.notes[i].devoir3;
                        rattrapage = widget.student.notes[i].rattrapage;
                      });
                    },
                            child: Card(

                              shadowColor: Colors.grey.shade300,
                   semanticContainer: true,
                   clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 2,
                          child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                             Row(
                               children: [
                             Icon(Icons.work, color: Colors.orange),
                             Container(
                               alignment: Alignment.centerLeft,
                               height: 20,
                               width: 100,
                               child: Text('${widget.lessons.firstWhere((element) => element.id == widget.student.notes[i].lessonId).name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: deviceSize.height/80),textAlign: TextAlign.left,)),
                               ],
                             ),
                             Container(
                               child: widget.student.notes[i].devoir2 ==0?
                               Icon(Icons.watch_later_outlined, color: Colors.grey, size: 10,):
                               moyenne(widget.student.notes[i].devoir1,
                                       widget.student.notes[i].devoir2, 
                                      widget.student.notes[i].devoir3, 
                                      widget.student.notes[i].rattrapage) <12? Icon(Icons.cancel,color: Colors.red,size: 10,):
                                      Icon(Icons.check_circle, color: Colors.lightGreen, size: 10,),
                               alignment: Alignment.bottomRight,
                             )
                         ],
                       ),
               ),
             );
             },
             itemCount: widget.student.notes.length, ),
                  ),
                ] 
        ),
      ),
    );
  }
}

class Lesson {
  String id;
  String name;
  List<String> classes;
  Lesson({@required this.id, @required this.name, @required this.classes});
}


class Note {
  String lessonId;
  double devoir1;
  double devoir2;
  double devoir3;
  double rattrapage;
  Note(
      {this.devoir1 = 0,
      this.devoir2 = 0,
      this.devoir3 = 0,
      this.rattrapage = 0,
      @required this.lessonId});
}


class Student {
  String id;
  String nom;
  String prenom;
  String classe;
  String email;
  List<Note> notes;
  Student(
      {@required this.id,
      @required this.nom,
      @required this.prenom,
      @required this.classe,
      @required this.notes,
      @required this.email});
}

class Decision extends StatefulWidget {
  final moyenne;
  final devoir2;
  Decision({@required this.moyenne, @required this.devoir2,});
  @override
  _DecisionState createState() => _DecisionState();
}

class _DecisionState extends State<Decision> {
  @override
  Widget build(BuildContext context) {
    return Container(
                width: MediaQuery.of(context).size.width/4.2,
                height: MediaQuery.of(context).size.height/20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: widget.devoir2 == 0
                      ? Colors.indigo[200]
                      : (widget.moyenne < 12 ? Colors.red : Colors.green),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child:widget.devoir2 == 0
                        ? Text("En attente")
                        : (widget.moyenne < 12
                            ? Text(
                                'Non validée',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            : Text('Validée',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))),
                  ),
                ),
              );
  }
}

 */


// Url Launcheur
/* import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
home: Scaffold(
  body: Center(
    child: IconButton(
      onPressed: ()async{
        await launch('https://asiedukevin050.wixsite.com/info');
      },
      icon: Icon(Icons.ac_unit_outlined),
    )
  ),
),
debugShowCheckedModeBanner: false,
  );
  }
} */
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import './music.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.grey[900],
      home: MyHomePage(),
      title: "Ulrixh Music Player",
    );
  }

}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List <Music> maMusique= [];
    Music maMusiqueActuelle;
    AudioPlayer audioPlayer;
    Duration tempsEcoule = Duration(seconds: 0);
    int dureeMinute = 0;
    int dureeSeconde = 0;
    int soundIndex = 0;
    int secondesEcoule = 0;
    PlayerState playerState = PlayerState.Stoppped;
    final FlutterAudioQuery audioQuery = FlutterAudioQuery();
    bool started = false;

    void bottomShit(){
      showModalBottomSheet(context: context ,
                          builder:(_)=>SingleChildScrollView(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: maMusique.length,
                              itemBuilder: (context, index){
                                return Card(
          elevation: 5.0,
          child: ListTile(
            leading: Icon(Icons.music_note_outlined),
            title: Text('${maMusique[index].titre}'),
            subtitle: Text('${maMusique[index].artiste}'),
            trailing: Text('${maMusique[index].temps.inSeconds~/60}: ${maMusique[index].temps.inSeconds - (maMusique[index].temps.inSeconds~/60)*60}'),
            onTap: (){
              setState(() {
                audioPlayer.stop();
              soundIndex = maMusique.indexOf(maMusique[index]);
              print('Index $soundIndex');
              maMusiqueActuelle =  maMusique[soundIndex];
              playLocal(maMusiqueActuelle.emplacement, "click");
              Navigator.of(context).pop();
              });
            },
          ));}
                              ),
                                                          /* child: Wrap(
        children: maMusique.map((musique) => Card(
          elevation: 5.0,
          child: ListTile(
            leading: Icon(Icons.music_note_outlined),
            title: Text('${musique.titre}'),
            subtitle: Text('${musique.artiste}'),
            trailing: Text('${musique.temps.inSeconds~/60}: ${musique.temps.inSeconds - (musique.temps.inSeconds~/60)*60}'),
            onTap: (){
              setState(() {
                audioPlayer.stop();
              soundIndex = maMusique.indexOf(musique);
              maMusiqueActuelle = maMusique[soundIndex];
              playLocal(maMusiqueActuelle.emplacement);
              Navigator.of(context).pop();
              });
            },
          ),
        ))
            .toList(),
      ), */)
                          );}

    void setSoundIndex(Etat etat){
      final avant = soundIndex;
      final playing = playerState;
      if (etat == Etat.Forward){
        if (soundIndex != maMusique.length - 1){
          if(playerState == PlayerState.Playing){
          audioPlayer.stop();
          setState(() {
            playerState = PlayerState.Stoppped;
          });
          }
            soundIndex += 1;
        }else{
          setState(() {
             playerState = PlayerState.Stoppped;
          });
         
        }
      }
      if (etat == Etat.Rewind){
        if (soundIndex > 0){
            if(playerState == PlayerState.Playing){
          audioPlayer.stop();
           setState(() {
            playerState = PlayerState.Stoppped;
          });
          }
            soundIndex -= 1;
        }
      }
      if( soundIndex != avant){
         setState(() {
        maMusiqueActuelle = maMusique[soundIndex];
      });
      if(playing == PlayerState.Playing){
           playLocal(maMusiqueActuelle.emplacement, "");
        }else{
          setState(() {
             playerState = PlayerState.Stoppped;
          });
        }
        setSongDuration();
        print("Changement de Track");
        print(maMusiqueActuelle.titre);
      }
    }
    Text textAvecStyle(String data, double scale){
  return Text(
    data,
    textScaleFactor: scale,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.white,
      fontStyle: FontStyle.italic
    ),
  );
}

IconButton bouton(IconData icone, Etat etat, Function fonction){
  return IconButton(
    splashColor: Colors.yellow,
    splashRadius: 10.2,
    icon: Icon(icone, color: Colors.white,),
    iconSize: etat ==Etat.Pause? 40: etat == Etat.Play?40: 35,
    onPressed:fonction
  );
}
  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            scrollable: true,
            elevation: 0.7,
            title: Text(
              '⛔ Impossible de jouer cette Musique',
              textAlign: TextAlign.center,
            ),
            content: Text('Nature de l\'erreur: $message'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
  setSongDuration(){
    setState(() {
      dureeMinute  = maMusiqueActuelle.temps.inMilliseconds~/60000;
      dureeSeconde =  (maMusiqueActuelle.temps.inMilliseconds - dureeMinute*60000)~/1000;
      print('$dureeMinute: $dureeSeconde');
    });
  }

     fetchSongs()async{
     List<SongInfo> songs = await audioQuery.getSongs();
     List<AlbumInfo> albums = await audioQuery.getAlbums();

    await songs.forEach((song) {
      final songsAlbum = albums.firstWhere((elt) => elt.id==song.albumId);
      print(song);
      maMusique.add(Music(artiste: song.artist, temps: Duration(milliseconds: int.parse(song.duration)),titre: song.title, emplacement: song.filePath, imagePath: songsAlbum.albumArt ));

/*       print("------------------Musique------------------");
      print("Titre: ${song.title}");
      print("Durée: $minute : $seconde"); */
    });
    setState(() {
    maMusiqueActuelle = maMusique[0];
    started = true;
    });
    setSongDuration();

  }
  void playLocal(localPath, str) async {
    if(playerState == PlayerState.Stoppped || str =='click'){
      try{
          int result = await audioPlayer.play(localPath, isLocal: true);
          setState(() {
            playerState = PlayerState.Playing;
          });
      }catch (e){
        setState(() {
          _showErrorDialog(e.toString());
          playerState = PlayerState.Stoppped;
        });
      }
    }
    else if (playerState == PlayerState.Playing){
      try{
        await audioPlayer.pause();
              setState(() {
            playerState = PlayerState.Paused;
          });
      }catch (e){
        setState(() {
          _showErrorDialog(e.toString());
          playerState = PlayerState.Stoppped;
        });
      }
    }
    else if (playerState == PlayerState.Paused){
      try{
        await audioPlayer.resume();
        setState(() {
          playerState = PlayerState.Playing;
        });
      }catch (e){
        setState(() {
          _showErrorDialog(e.toString());
          playerState = PlayerState.Stoppped;
        });
      }
    }
  }

    @override
  void initState() {
    super.initState();
    print('InitState');
    fetchSongs();
    if (audioPlayer != null){
      audioPlayer.stop();
    }
    setState(() {
      audioPlayer = AudioPlayer();
    });
  }
  @override
  void dispose() {
   audioPlayer.stop();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
   var _positionSubscription = audioPlayer.onAudioPositionChanged.listen((s) {setState(() {tempsEcoule = s;
                                                                                              secondesEcoule = (tempsEcoule.inMilliseconds - (tempsEcoule.inMilliseconds~/60000)*60000)~/1000;
                                                                                              if (s.inSeconds >= dureeMinute*60+dureeSeconde){
                                                                                                tempsEcoule = Duration(seconds: 0);
                                                                                                secondesEcoule = 0;
                                                                                                setSoundIndex(Etat.Forward);
                                                                                              }
                                                                                              });});
  
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("Ulrixh's Music Player", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: started?Container(
        color: Colors.grey[800],
        height: deviceSize.height,
        width: deviceSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Colors.grey[800],
              elevation: 0.9,
              child: Container(
                height: deviceSize.height/2.5,
                width: deviceSize.height/2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image:AssetImage("assets/abstract-2027962_1280.png")
                  )
                ),
              ),
            ),
            textAvecStyle(maMusiqueActuelle.titre, 1.5),
            textAvecStyle(maMusiqueActuelle.artiste, 0.8),
           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bouton(Icons.fast_rewind, Etat.Rewind,()=>setSoundIndex(Etat.Rewind) ),
                  bouton( playerState != PlayerState.Playing?Icons.play_arrow: Icons.pause_outlined, Etat.Play, ()=> playLocal(maMusiqueActuelle.emplacement, "")),
                  bouton(Icons.fast_forward, Etat.Forward, ()=>setSoundIndex(Etat.Forward)),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Text('${tempsEcoule.inMilliseconds~/60000}:${secondesEcoule >9? '$secondesEcoule' : '0$secondesEcoule'}', style: TextStyle(color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:15.0),
                  child: Text('$dureeMinute:${dureeSeconde>9? '$dureeSeconde': '0$dureeSeconde'}', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            Slider(
              value: tempsEcoule.inSeconds.toDouble() , onChanged: (d){
                  setState(() {
                    Duration newDuration = new Duration(seconds: d.toInt());
                    tempsEcoule = newDuration;
                    print("${tempsEcoule.inSeconds}");
                    audioPlayer.seek(Duration(seconds: tempsEcoule.inSeconds));
                  });
                },
                min: 0.0,
                max: double.parse((dureeMinute*60 + dureeSeconde).toString()),
                activeColor: Colors.white,
                inactiveColor: Colors.grey.withOpacity(0.5),),
          ],
        ),
      ): Container(
        color: Colors.grey[800],
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,            
          ),
        ),
        height: deviceSize.height,
        width: deviceSize.width,
      ),
      floatingActionButton: FloatingActionButton(
                                                onPressed:()=>bottomShit(),
                                                child:Icon(Icons.format_indent_increase_rounded, color: Colors.white),
                                                backgroundColor: Colors.transparent,
                                                elevation: 7.0,
                                                ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
enum Etat{
  Pause,
  Play,
  Rewind,
  Forward
}

enum PlayerState{
  Playing,
  Paused,
  Stoppped
}