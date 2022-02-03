import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper Widget Demo',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: const StepperWidgetScreen(),
    );
  }
}

class StepperWidgetScreen extends StatefulWidget {
  const StepperWidgetScreen({Key? key}) : super(key: key);

  @override
  _StepperWidgetScreenState createState() => _StepperWidgetScreenState();
}

class _StepperWidgetScreenState extends State<StepperWidgetScreen> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stepper Widget Demo"),),
      body: SafeArea(
        child: Center(
          child: Stepper(
            steps: const [
              Step(title: Text("Step 1"),
                  content: Text("Information for step 1"),
              ),
              Step(title: Text("Step 2"),
                content: Text("Information for step 2"),
              ),
              Step(title: Text("Step 3"),
                content: Text("Information for step 3"),
              ),
            ],
            currentStep: _currentStep,
            onStepTapped: (int newIndex) {
              setState(() {
                _currentStep = newIndex;
              });
            },
            onStepContinue: () {
              if(_currentStep != 2) {
                setState(() {
                  _currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              if(_currentStep != 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}

