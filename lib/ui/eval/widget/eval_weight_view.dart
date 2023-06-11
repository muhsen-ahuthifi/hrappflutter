import 'package:flutter/material.dart';

import '../../widget/AppTheme.dart';

class EvalWeightView extends StatelessWidget {
  final String weight;

  const EvalWeightView({super.key,required this.weight});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'الوزن',
          textAlign: TextAlign.center,
          style: HrSmartAppTheme.weightLableStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Container(
            height: 4,
            width: 70,
            decoration: BoxDecoration(
              color: Color(4287078629).withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ((70 / 1.1) * 1),
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(4287078629),
                      Color(4287078629).withOpacity(0.5),
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            weight,
            textAlign: TextAlign.center,
            style: HrSmartAppTheme.weightValueStyle,
          ),
        ),
      ],
    );
  }
}

class EvalPercentageView extends StatelessWidget {
  final String pg;
  const EvalPercentageView({super.key,required this.pg});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'الدرجة المحققة',
          style: TextStyle(
            fontFamily: SmartAppTheme.fontName,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: -0.2,
            color: SmartAppTheme.darkText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 4),
          child: Container(
            height: 4,
            width: 70,
            decoration: BoxDecoration(
              color: Color(0xFFF1B440).withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: ((70 / 2.5) * 1),
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFF1B440).withOpacity(0.1),
                      Color(0xFFF1B440),
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            pg,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: SmartAppTheme.fontName,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: SmartAppTheme.grey.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}

class EvalTitleView extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color borderColor;

  const EvalTitleView({super.key,required this.title,
   required this.subtitle,
   required  this.borderColor,

  
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48,
          width: 2,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
        ),

                              
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 2),
                child: Container(
                    width: 200,
                    child: Text(
                      title,
                      textAlign: TextAlign.start,
                      style:HrSmartAppTheme.evalTitleStyle,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2, bottom: 3),
                    child: Container(
                        width: 220,
                        child: Text(
                          subtitle,
                          textAlign: TextAlign.start,
                          style: HrSmartAppTheme.evalsubTitleStyle,
                        )),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
