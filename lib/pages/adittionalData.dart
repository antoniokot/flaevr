import 'package:flaevr/components/button.dart';
import 'package:flaevr/components/togglePicker.dart';
import 'package:flaevr/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AdditionalData extends StatefulWidget {
  AdditionalData({Key? key, required this.buildAppBar, this.onSubmmit})
      : super(key: key);

  final bool buildAppBar;
  final Function? onSubmmit;

  @override
  AdditionalDataState createState() => AdditionalDataState();
}

class AdditionalDataState extends State<AdditionalData> {
  double _currentSliderValue = 65;
  double _currentIdealSliderValue = 60;
  String dropdownValue = 'Sedentário';
  int _currentAgeValue = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Color(0xFF3d3d4e)),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.0),
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
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(
                      "Peso atual",
                      style: Styles.mediumTitle,
                    ),
                  ),
                  NumberPicker(
                    value: _currentAgeValue,
                    minValue: 3,
                    maxValue: 120,
                    step: 1,
                    itemHeight: 50,
                    axis: Axis.horizontal,
                    onChanged: (value) =>
                        setState(() => _currentAgeValue = value),
                    selectedTextStyle: TextStyle(
                        color: Color(0xFFFF4646), fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "O cálculo para crianças abaixo de 3 anos não está disponível. Para cálculo de necessidade diária de calorias de pessoas com enfermidades, gestantes, lactantes ou idosos os cálculos também não se aplicam.",
                    style: Styles.noteText,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Peso atual",
                              style: Styles.mediumTitle,
                            ),
                            Text(
                              _currentSliderValue.toString().split(".")[0],
                              style: Styles.smallText
                                  .apply(color: Color(0xFFFF4646)),
                            ),
                          ])),
                  Row(children: [
                    Text("0", style: Styles.smallTitle),
                    Expanded(
                        child: Slider(
                      activeColor: Color(0xFFFF4646),
                      thumbColor: Color(0xFFFF4646),
                      inactiveColor: Styles.ultraLightMutedGrey,
                      min: 0,
                      max: 200,
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Peso ideal",
                              style: Styles.mediumTitle,
                            ),
                            Text(
                              _currentIdealSliderValue.toString().split(".")[0],
                              style: Styles.smallText
                                  .apply(color: Color(0xFFFF4646)),
                            ),
                          ])),
                  Row(children: [
                    Text("0", style: Styles.smallTitle),
                    Expanded(
                      child: Slider(
                        activeColor: Color(0xFFFF4646),
                        thumbColor: Color(0xFFFF4646),
                        inactiveColor: Styles.ultraLightMutedGrey,
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
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: Text(
                      "Nível de atividade física",
                      style: Styles.mediumTitle,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Styles.ultraLightMutedGrey,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        value: dropdownValue,
                        isExpanded: true,
                        underline: Container(),
                        icon: const Icon(
                          Icons.expand_more_rounded,
                          color: Color(0xFFFF4646),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Color(0xff3d3d4e)),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'Sedentário',
                          'Pouco ativo',
                          'Ativo',
                          'Muito Ativo'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                  Button(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 300),
                    width: double.infinity,
                    height: 42,
                    text: "Adicionar",
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    backgroundColor: Color(0xFFFF4646),
                    onPressed: widget.onSubmmit ?? () => {},
                  )
                ],
              )),
        ));
  }
}
