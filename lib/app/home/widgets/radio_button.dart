import 'package:flutter/material.dart';

class YesNoRadioButton extends StatefulWidget {
  final String label;
  final Function(bool?) onSelection;

  const YesNoRadioButton({
    Key? key,
    required this.label,
    required this.onSelection,
  }) : super(key: key);

  @override
  _YesNoRadioButtonState createState() => _YesNoRadioButtonState();
}

class _YesNoRadioButtonState extends State<YesNoRadioButton> {
  bool? _groupValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: const Text('Sim'),
                leading: Radio<bool>(
                  value: true,
                  groupValue: _groupValue,
                  onChanged: (bool? value) {
                    setState(() {
                      _groupValue = value;
                    });
                    widget.onSelection(value);
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: const Text('Não'),
                leading: Radio<bool>(
                  value: false,
                  groupValue: _groupValue,
                  onChanged: (bool? value) {
                    setState(() {
                      _groupValue = value;
                    });
                    widget.onSelection(value);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



// Para usar esse componente nas telas do seu app, você pode fazer algo assim:

//   YesNoRadioButton(
//   label: 'Você estuda?',
//   onSelection: (bool? value) {
//   },),
