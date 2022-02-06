import 'package:flutter/material.dart';

class Translation extends StatelessWidget {
  const Translation({Key? key, required this.micVisibility}) : super(key: key);

  final bool micVisibility;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: micVisibility,
            child: Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                onPressed: () {},
                child: const Icon(
                  Icons.volume_up,
                  color: Colors.black,
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size(20, 30),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Text(
            'こんにちは元気ですか',
            style: TextStyle(fontSize: 25),
          ),
          const Text("Kon'nichiwa genkidesuka")
        ],
      ),
    );
  }
}