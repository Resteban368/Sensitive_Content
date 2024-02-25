import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Designs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SensitiveContentDesign(),
    );
  }
}

class SensitiveContentDesign extends StatefulWidget {
  const SensitiveContentDesign({super.key});

  @override
  State<SensitiveContentDesign> createState() => _SensitiveContentDesignState();
}

class _SensitiveContentDesignState extends State<SensitiveContentDesign> {
  bool _isSensitiveContentVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final blurFilter = _isSensitiveContentVisible
        ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
        : ImageFilter.blur(sigmaX: 25, sigmaY: 25);

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: screenSize.height,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://c0.wallpaperflare.com/preview/1022/246/466/cartagena-colombia-trip-caribbean.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
            child: BackdropFilter(
              filter: blurFilter,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: !_isSensitiveContentVisible
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.visibility_off_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Sensitive Content',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Text(
                                    'This photo contains sensitive content which some people may find offensive or disturbing.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: .5,
                    height: 0,
                    indent: 26,
                    endIndent: 26,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSensitiveContentVisible =
                            !_isSensitiveContentVisible;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          _isSensitiveContentVisible
                              ? 'Hide Photo'
                              : 'See Photo',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
