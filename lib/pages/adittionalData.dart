import 'package:flaevr/components/togglePicker.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';

class AdditionalData extends StatefulWidget {
  AdditionalData({Key? key, required this.buildAppBar}) : super(key: key);

  final bool buildAppBar;

  @override
  AdditionalDataState createState() => AdditionalDataState();
}

class AdditionalDataState extends State<AdditionalData> {
  double _currentSliderValue = 65;
  double _currentIdealSliderValue = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xFF3d3d4e)),
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.0),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gênero",
                style: Styles.mediumTitle,
              ),
              TogglePicker(),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Peso atual",
                  style: Styles.mediumTitle,
                ),
              ),
              Row(children: [
                Text("0", style: Styles.smallTitle),
                Expanded(
                    child: Slider(
                  activeColor: Color(0xFFFF4646),
                  thumbColor: Color(0xFFFF4646),
                  inactiveColor: Styles.ultraLightMutedGrey,
                  min: 0,
                  max: 200,
                  divisions: 200,
                  label: _currentSliderValue.round().toString(),
                  value: _currentSliderValue,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                )),
                Text("200", style: Styles.smallTitle),
              ]),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Peso ideal",
                  style: Styles.mediumTitle,
                ),
              ),
              Row(children: [
                Text("0", style: Styles.smallTitle),
                Expanded(
                  child: Slider(
                    activeColor: Color(0xFFFF4646),
                    thumbColor: Color(0xFFFF4646),
                    inactiveColor: Styles.ultraLightMutedGrey,
                    divisions: 200,
                    min: 0,
                    max: 200,
                    label: _currentIdealSliderValue.round().toString(),
                    value: _currentIdealSliderValue,
                    onChanged: (double value) {
                      setState(() {
                        _currentIdealSliderValue = value;
                      });
                    },
                  ),
                ),
                Text("200", style: Styles.smallTitle),
              ]),
              Text(
                "O peso ideal será usado para calcular a necessidade diária de calorias. Não coloque pesos muito diferentes do seu atual. Se deseja colocar um peso muito diferente, consulte um nutricionista antes para uma análise personalizada.",
                style: Styles.noteText,
              ),
            ],
          )),
        ));
  }
}
