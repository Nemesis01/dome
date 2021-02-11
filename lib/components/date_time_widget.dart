import 'package:dome/bloc/bloc_provider.dart';
import 'package:dome/blocs/bloc_date_time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<DateTimeBloc>(context);

    return StreamBuilder<DateTime>(
        initialData: DateTime.now().toLocal(),
        stream: bloc.now,
        builder: (context, snapshot) {
          print('Date is UTC :${DateTime.now().isUtc}');
          var data = snapshot.data;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  DateFormat.yMMMMEEEEd().format(data).toUpperCase(), //,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: Colors.white54),
                ),
                Text(
                  DateFormat.Hm().format(data.toLocal()).toUpperCase(), //,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Colors.white60, fontSize: 72.0),
                ),
              ],
            ),
          );
        });
  }
}
