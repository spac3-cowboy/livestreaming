import 'package:flutter/material.dart';
import 'package:my_app/live_stream.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var host = false;

  final TextEditingController userNameControler = TextEditingController();
  final TextEditingController userIdControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              textField(
                controller: userNameControler,
                text: 'User Name',
                icon: Icons.person,
              ),
              const SizedBox(height: 25),
              textField(
                controller: userIdControler,
                text: 'User Id',
                icon: Icons.pin,
              ),
              const SizedBox(height: 10),
              hostCheck(),
              const SizedBox(height: 15),
              submitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Row hostCheck() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Host'),
        Checkbox(
          value: host,
          onChanged: ((value) {
            setState(() {
              host = value!;
            });
          }),
        ),
      ],
    );
  }

  Material submitButton(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(5),
      color: Colors.brown,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 12),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => MyWidget(
                    userID: userIdControler.text,
                    userName: userNameControler.text,
                    liveID: '100',
                    isHost: host,
                  ))));
        },
        child: const Text(
          'Join',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  TextFormField textField({
    required TextEditingController controller,
    required String text,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      onSaved: (value) {
        controller.text = value!;
      },
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.brown,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.brown,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.brown,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: text,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 182, 174, 172),
        ),
      ),
    );
  }
}
