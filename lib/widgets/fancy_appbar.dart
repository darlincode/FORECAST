import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FancyAppBar extends StatefulWidget implements PreferredSizeWidget {
  FancyAppBar({
    Key? key,
    required bool alert,
    required String alertDescription,
    required String alertEvent,
    required String alertHeadline,
    required String alertInstructions,
    required String alertNote,
    required String alertType,
    required String alertUrgency,
    required String alertAreas,
    required bool useDarkMode,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        alertInEffect = alert,
        alertAreas = alertAreas,
        alertDescription = alertDescription,
        alertEvent = alertEvent,
        alertHeadline = alertHeadline,
        alertInstructions = alertInstructions,
        alertNote = alertNote,
        alertType = alertType,
        alertUrgency = alertUrgency,
        useDarkMode = useDarkMode,
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  final bool alertInEffect, useDarkMode;
  final String alertUrgency,
      alertEvent,
      alertAreas,
      alertType,
      alertDescription,
      alertHeadline,
      alertInstructions,
      alertNote;

  @override
  _FancyAppBarState createState() => _FancyAppBarState();
}

class _FancyAppBarState extends State<FancyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: widget.useDarkMode ? Colors.white : Colors.black,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: widget.useDarkMode ? Colors.grey[800] : Colors.white,
      title: widget.alertInEffect
          ? Chip(
              onDeleted: () {
                AwesomeDialog(
                  dialogBackgroundColor:
                      widget.useDarkMode ? Colors.grey[800] : Colors.white,
                  buttonsBorderRadius: BorderRadius.circular(10),
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.TOPSLIDE,
                  body: Column(
                    children: [
                      Text(
                        widget.alertType,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color:
                              widget.useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.alertEvent,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 28,
                          color:
                              widget.useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          widget.alertNote.replaceAll(RegExp(r'\n'), ' '),
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.useDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Text(
                          widget.alertInstructions
                              .replaceAll(RegExp(r'\n'), ' '),
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.useDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Text(
                          widget.alertDescription
                              .replaceAll(RegExp(r'\n'), ' '),
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.useDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  btnOkColor: Colors.red,
                  btnOkOnPress: () {},
                )..show();
              },
              deleteIcon: Icon(
                Icons.info_outline,
                // size: 18,
              ),
              backgroundColor: Colors.red.withOpacity(0.8),
              label: Text(
                'WEATHER ALERT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Container(height: 48),
    );
  }
}
