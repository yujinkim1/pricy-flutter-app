import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pricy/providers/dailyByData.dart';
import 'package:pricy/widgets/customContainer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../assets/colors/palette.dart';
import '../providers/periodByData.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key, required this.title});
  final String title;
  @override
  State<ComparePage> createState() => _Compare();
}

class _Compare extends State<ComparePage> {
  String inputText = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Palette.normalTextColor),
            backgroundColor: Palette.screensColor,
            centerTitle: false,
            elevation: 0,
            actions: [],
          ),
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ItemBox()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ChartBox()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Palette.containerColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            color: Palette.shadowColor,
                            offset: Offset(0, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            inputText = text;
                          });
                        },
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: '금액 입력하기',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
                      alignment: AlignmentDirectional(0, 0),
                      decoration: BoxDecoration(
                          color: Palette.containerColor,
                          borderRadius: BorderRadius.circular(5.0),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0,
                                color: Palette.shadowColor,
                                offset: Offset(0, 5))
                          ]),
                      child: Text(inputText),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
