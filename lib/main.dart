import 'package:flutter/material.dart';
import 'package:test/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarffic Roles',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 26, 99, 77)),
        useMaterial3: true,
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
            ),
       
            
          ),
        ),
      ),
      home: const MyHomePage(title: 'Traffic Roles'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8ECDFF),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(left: 6),
              width: 150,
              height: 80,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "About us",
                  softWrap: false,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
        elevation: 30,
        // bottom: PreferredSize(preferredSize: MediaQuery.of(context).size., child: child),
        leading: const Text(""),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 56,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF8ECDFF),
      ),
      body: Column(
        children: [
          SizedBox(height: 80,),
          Container(
            padding: const EdgeInsets.all(100),
            height: MediaQuery.of(context).size.height - 280,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  "assets/images/book.png",
                ),
              ),
            ),
          ),
          
          const SizedBox(
            height: 40,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RulesScreen(),
                    ),
                  );
                },
                child: const Text("Rules"),
              ),
             const SizedBox(width: 50,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GamesScreen(),
                    ),
                  );
                },
                child: const Text("Games"),
              ),
              const SizedBox(width: 50,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TestScreen(),
                    ),
                  );
                },
                child: const Text("Test"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
