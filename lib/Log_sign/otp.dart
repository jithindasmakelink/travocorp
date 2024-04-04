import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  final String email;

  const OTPPage({Key? key, required this.email}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (index) => FocusNode());
    _controllers = List.generate(
        4,
        (index) => TextEditingController()
          ..addListener(() {
            if (_controllers[index].text.length == 1 && index < 3) {
              _focusNodes[index].unfocus();
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
          }));
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0),
                const Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Verification",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Enter your OTP ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "from the mail we just send you. ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                          child: TextField(
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            focusNode: _focusNodes[index],
                            controller: _controllers[index],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              counterText: '', // Hide counter text
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: IgnorePointer(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                '1',
                                style: TextStyle(color: Colors.transparent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      // Handle resend OTP
                    },
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle verify OTP
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        backgroundColor: Colors.orange,
                      ),
                      child: Text(
                        'Verify OTP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
