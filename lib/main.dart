import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MaterialApp(
      home: NBIVerificationScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class NBIVerificationScreen extends StatefulWidget {
  const NBIVerificationScreen({super.key});

  @override
  State<NBIVerificationScreen> createState() => _NBIVerificationScreenState();
}

class _NBIVerificationScreenState extends State<NBIVerificationScreen> {
  final TextEditingController _idController = TextEditingController();

  void _verify() {
    // Logic for verification - placeholder action
    if (_idController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Verifying ID: ${_idController.text}'),
          backgroundColor: const Color(0xFF330D0D),
        ),
      );
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          // Custom Header to allow precise Logo and Border positioning
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Use a Container for the background and border
              Container(
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF330D0D),
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFFFA500), width: 1.0),
                  ),
                ),
              ),
              // Position the logo to likely sit on the line or just above it
              Positioned(
                bottom: 0,
                child: Image.asset('assets/image/nbi_logo.png', height: 100),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Enter NBI ID Number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Text Input Field
                  TextField(
                    controller: _idController,
                    maxLength: 21,
                    onSubmitted: (_) => _verify(),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      counterText: "",
                      isDense: true, // Makes the field more compact
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 12,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFFA500),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFFA500),
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: const Icon(
                        Icons.qr_code_scanner,
                        color: Color(0xFFFFA500),
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Buttons Row
                  Row(
                    children: [
                      // Verify Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _verify,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFA500),
                            fixedSize: const Size.fromHeight(
                              50,
                            ), // Match height
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'Verify',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),

                      // Clear Button
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _idController.clear();
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFFFFA500)),
                            fixedSize: const Size.fromHeight(
                              50,
                            ), // Match height
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'Clear',
                            style: TextStyle(
                              color: Color(0xFFFFA500),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
