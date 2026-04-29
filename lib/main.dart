import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

// GoRouter configuration
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HalamanBeranda(),
      routes: [
        GoRoute(
          path: 'jelajah',
          builder: (context, state) => HalamanJelajah(),
        ),
        GoRoute(
          path: 'akun',
          builder: (context, state) => HalamanAkun(),
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Praktikum Navigasi',
      routerConfig: _router,
    );
  }
}

class HalamanBeranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Praktikum Navigasi'),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/telkom_logo.png',
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text('Lihat Koleksi'),
              onTap: () {
                context.go('/jelajah');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.man_3),
              title: Text('Akun'),
              onTap: () {
                context.go('/akun');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Ini adalah tampilan Halaman Beranda'),
      ),
    );
  }
}

class HalamanJelajah extends StatefulWidget {
  @override
  State<HalamanJelajah> createState() => _HalamanJelajahState();
}

class _HalamanJelajahState extends State<HalamanJelajah> {
  int _selectedIndex = 0;

  final List<String> categories = ['Formal', 'Kasual', 'Vintage'];

  // Map untuk menyimpan gambar lokal untuk setiap kategori
  final Map<String, String> categoryImages = {
    'Formal': 'assets/formal.jpg',
    'Kasual': 'assets/kasual.jpg',
    'Vintage': 'assets/vintage.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Jelajah'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    child: Image.asset(
                      categoryImages[categories[_selectedIndex]]!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.image, size: 50);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        '${categories[_selectedIndex]} ${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Rp 99.999',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Formal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_people),
            label: 'Kasual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_fix_high),
            label: 'Vintage',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HalamanAkun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Akun'),
      ),
      body: Center(
        child: Text('Ini adalah tampilan Halaman Akun'),
      ),
    );
  }
}
