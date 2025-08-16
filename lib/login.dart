import 'package:flutter/material.dart';

class PersonIllustrationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF8B6B47)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    
    final center = Offset(size.width / 2, size.height / 2);
    
    // Head
    canvas.drawCircle(Offset(center.dx, center.dy - 10), 15, paint);
    
    // Hair lines
    Path hairPath = Path();
    hairPath.moveTo(center.dx - 12, center.dy - 18);
    hairPath.quadraticBezierTo(center.dx - 8, center.dy - 22, center.dx - 4, center.dy - 20);
    hairPath.quadraticBezierTo(center.dx, center.dy - 24, center.dx + 4, center.dy - 20);
    hairPath.quadraticBezierTo(center.dx + 8, center.dy - 22, center.dx + 12, center.dy - 18);
    canvas.drawPath(hairPath, paint);
    
    // Body/dress
    Path bodyPath = Path();
    bodyPath.moveTo(center.dx - 8, center.dy + 5);
    bodyPath.lineTo(center.dx - 15, center.dy + 25);
    bodyPath.lineTo(center.dx + 15, center.dy + 25);
    bodyPath.lineTo(center.dx + 8, center.dy + 5);
    canvas.drawPath(bodyPath, paint);
    
    // Backpack
    Rect backpack = Rect.fromCenter(
      center: Offset(center.dx - 12, center.dy + 8),
      width: 8,
      height: 12,
    );
    canvas.drawRect(backpack, paint);
    
    // Backpack straps
    canvas.drawLine(
      Offset(center.dx - 10, center.dy + 2),
      Offset(center.dx - 6, center.dy + 5),
      paint,
    );
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please Log In',
              style: TextStyle(fontSize: 24, color: Colors.grey[600]),
            ),
            SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: UnderlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text('LOG IN', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text('CREATE AN ACCOUNT', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Sign Up Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text('Sign Up', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Already have an account? Login',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD4B5A0),
                  ),
                  child: CustomPaint(
                    painter: PersonIllustrationPainter(),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Mariam yahya',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Software Engineer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                elevation: 3,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.blue),
                      title: Text('01120696930'),
                    ),
                    Divider(height: 1),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.blue),
                      title: Text('my654717@gmail.com'),
                    ),
                    Divider(height: 1),
                    ListTile(
                      leading: Icon(Icons.web, color: Colors.blue),
                      title: Text('https://linkedin.name.com'),
                    ),
                    Divider(height: 1),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.blue),
                      title: Text('Sohag'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}