import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sl_app/core/ui-components/theme/colors.dart';
import 'package:sl_app/features/word_to_sl/logic/word_to_sl_cubit.dart';
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sl_app/features/real_time/logic/real_time_cubit.dart';
import 'package:tflite/tflite.dart';

class WordToSlScreenWithCubit extends StatelessWidget {
  const WordToSlScreenWithCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WordToSlCubit()..initialize(),
      child: const WordToSlScreen(),
    );
  }
}

class WordToSlScreen extends StatefulWidget {
  const WordToSlScreen({Key? key}) : super(key: key);

  @override
  _WordToSlScreenState createState() => _WordToSlScreenState();
}

class _WordToSlScreenState extends State<WordToSlScreen> {
  bool play = false;
  TextEditingController wordController = TextEditingController();
  String? newWord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Language App'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: BlocConsumer<WordToSlCubit, WordToSlState>(
        listener: (context, state) async {},
        builder: (context, state) {
          return state.when(
              initial: () => loadedUI(),
              loaded: () => loadedUI(),
              wordloaded: (word, letter, i) =>
                  loadedUI(word: word, letter: letter),
              error: (error, code) => loadedUI());
        },
      ),
    );
  }

  Widget loadedUI({String? word, String? letter}) {
    Size size = MediaQuery.of(context).size;
    List<Widget> list = [];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (letter != null)
          Stack(
            children: [
              Image.asset('assets/images/$letter.jpg'),
              if (play)
                IconButton(
                    alignment: Alignment.center,
                    onPressed: () {
                      context.read<WordToSlCubit>().play();
                      setState(() {
                        play = !play;
                      });
                    },
                    icon: Icon(
                      Icons.play_arrow,
                      size: 50,
                    ))
            ],
          ),
        if (word != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('$word',
                    style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                        fontWeight: FontWeight.bold)),
              ),
              decoration:
                  BoxDecoration(border: Border.all(color: primaryColor)),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: wordController,
            onChanged: (String? value) {
              if (value != null) newWord = value;
            },
            decoration: InputDecoration(
              labelText: 'Word to SL',
              border: const OutlineInputBorder(),
              filled: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ))),
                onPressed: () {
                  if (newWord != null) {
                    context.read<WordToSlCubit>().toSL(newWord!);
                    setState(() {
                      newWord = null;
                      play = true;
                    });
                  }
                },
                child: Text('To SL')),
          ),
        )
      ],
    );
  }
}
