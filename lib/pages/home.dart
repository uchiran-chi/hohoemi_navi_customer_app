import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../domain/reaction/reaction.dart';
import '../domain/reaction_controller.dart';
import '../domain/user_controller.dart';

//ホーム画面
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();

    final user = ref.watch(userProvider);

    Future<List<Reaction?>> widgetBuilder() async {
      List<Reaction> reactionList = ref.watch(reactionProvider);
      for (int i = 0; i <= reactionList.length; i++) {
        if (reactionList[i].sendAt.month == now.month) {}
      }
      return reactionList;
    }

    void _showSimpleDialog(Reaction reaction) async {
      print(reaction.sendAt);
      var result = await showDialog(
        context: context,
        builder: (_) {
          return SimpleDialog(
            title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(DateFormat('yyyy/MM/dd hh:mm')
                  .format(reaction.sendAt.toLocal())),
            ]),
            children: <Widget>[
              Image(
                image: AssetImage('assets/${reaction.reaction}.png'),
                height: 250,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  reaction.comment,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('${user?.protectedName}さん'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                ref.watch(reactionProvider.notifier).getReactionState(user!.id);
              },
            )
          ],
        ),
        body: FutureBuilder(
          future: widgetBuilder(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color(0xFFE76992),
              ));
            } else {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: TableCalendar(
                        locale: 'ja_JP',
                        shouldFillViewport: true,
                        headerStyle: const HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                        ),
                        calendarStyle: const CalendarStyle(
                          markersAlignment: Alignment.bottomCenter,
                          cellPadding: EdgeInsets.all(1),
                          cellMargin: EdgeInsets.all(14),
                        ),
                        calendarBuilders: CalendarBuilders(
                            markerBuilder: (context, date, events) {
                          List<Reaction?> reactionList =
                              ref.watch(reactionProvider);
                          Reaction? reaction = reactionList.lastWhereOrNull(
                              (reaction) =>
                                  reaction?.sendAt.year == date.year &&
                                  reaction?.sendAt.month == date.month &&
                                  reaction?.sendAt.day == date.day);
                          if (reaction != null) {
                            return InkWell(
                                onTap: () {
                                  _showSimpleDialog(reaction);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 10),
                                  margin: EdgeInsets.only(top: 20),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/${reaction.reaction}.png')),
                                ));
                          } else {
                            return SizedBox();
                          }
                          // return hasReaction ? Icon(Icons.favorite, color: Colors.black) : Text('');
                        }),
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
