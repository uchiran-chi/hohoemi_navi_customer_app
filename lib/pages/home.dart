import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../domain/reaction/reaction.dart';
import '../domain/reaction_controller.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();

    Future<List<Reaction?>> widgetBuilder()async{
      List<Reaction> reactionList = ref.watch(reactionProvider);
      for(int i = 0; i <= reactionList.length; i++){
        if(reactionList[i].sendAt.month == now.month){
          print('reactionList::${reactionList[i]}');
        }
      }
      return reactionList;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('徳島　幸子　さん'),
        ),
        body: FutureBuilder(
          future: widgetBuilder(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Text('roading now...');
            }else{
              return Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: TableCalendar(
                        shouldFillViewport: true,
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                        ),
                        calendarStyle: CalendarStyle(
                          markersAlignment: Alignment.bottomCenter,
                          cellPadding: EdgeInsets.all(1),
                          cellMargin: EdgeInsets.all(14),
                        ),
                        calendarBuilders: CalendarBuilders(
                          markerBuilder: (context, date, events){
                            List<Reaction?> reactionList = ref.watch(reactionProvider);
                            Reaction? reaction = reactionList.firstWhereOrNull((reaction) =>
                            reaction?.sendAt.year == date.year &&
                                reaction?.sendAt.month == date.month &&
                                reaction?.sendAt.day == date.day);
                            if (reaction != null) {
                              return Container(
                                decoration: BoxDecoration(
                                  // color: Colors.amber
                                ),
                                padding: EdgeInsets.only(top:10),
                                margin: EdgeInsets.only(top: 20),
                                child: Image(image: AssetImage('assets/${reaction.reaction}.png')),
                              );
                            } else {
                              return SizedBox();
                            }
                            // return hasReaction ? Icon(Icons.favorite, color: Colors.black) : Text('');
                          }
                        ),
                        focusedDay: DateTime.now(),
                        firstDay: DateTime(2024, 1, 1),
                        lastDay: DateTime(2024, 12, 31),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
