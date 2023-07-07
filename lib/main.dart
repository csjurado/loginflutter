import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final StreamSubscription<User?> _firebaseStreamEvents;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _firebaseStreamEvents =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        if (user.emailVerified) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>
                  HomeScreen(), // Página de inicio después de iniciar sesión
            ),
          );
        } else {
          user.sendEmailVerification();
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firebaseStreamEvents.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == "user-not-found") {
                      print('No user found for that email.');
                    } else if (e.code == "wrong-password") {
                      print('Wrong password provided for that user.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _dataList = [];
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadData();
    }
  }

  Future<void> _loadData() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    // Simulación de carga de datos
    await Future.delayed(Duration(seconds: 2));

    List<String> newDataList =
        List.generate(10, (index) => 'Item ${_dataList.length + index}');
    setState(() {
      _dataList.addAll(newDataList);
      _isLoading = false;
    });
  }

  Future<void> _addItem() async {
    // Simulación de operación de creación de elemento
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _dataList.add('New Item ${_dataList.length + 1}');
    });
  }

  Future<void> _updateItem(int index) async {
    // Simulación de operación de actualización de elemento
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _dataList[index] = 'Updated Item $index';
    });
  }

  Future<void> _deleteItem(int index) async {
    // Simulación de operación de eliminación de elemento
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _dataList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _dataList.length + 1,
        itemBuilder: (context, index) {
          if (index < _dataList.length) {
            return Dismissible(
              key: Key(_dataList[index]),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                _deleteItem(index);
              },
              background: Container(
                color: Colors.red,
                child: const Icon(Icons.delete),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 16.0),
              ),
              child: ListTile(
                title: Text(_dataList[index]),
                onTap: () {
                  _updateItem(index);
                },
              ),
            );
          } else {
            return _isLoading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : ListTile(
                    title: ElevatedButton(
                      onPressed: _addItem,
                      child: const Text('Add Item'),
                    ),
                  );
          }
        },
      ),
    );
  }
}
