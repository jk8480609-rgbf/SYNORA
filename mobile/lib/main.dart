import 'package:flutter/material.dart';

void main() => runApp(const SynoraApp());

const purple = Color(0xFF9B35FF);
const bg = Color(0xFF090711);

class SynoraApp extends StatelessWidget {
  const SynoraApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SYNORA',
    theme: ThemeData.dark(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(seedColor: purple, brightness: Brightness.dark),
      appBarTheme: const AppBarTheme(backgroundColor: bg, foregroundColor: Colors.white),
    ),
    home: const LoginPage(),
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool create = false;
  bool usePhone = false;
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() { email.dispose(); phone.dispose(); password.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.blur_on, size: 76, color: purple),
        const Text('SYNORA', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, letterSpacing: 4)),
        const Text('Connect • Share • Be Unique', style: TextStyle(color: Colors.white60)),
        const SizedBox(height: 34),
        Text(create ? 'Create your account' : 'Welcome back', style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        const SizedBox(height: 18),
        SegmentedButton<bool>(segments: const [ButtonSegment(value: false, label: Text('Email')), ButtonSegment(value: true, label: Text('Phone'))], selected: {usePhone}, onSelectionChanged: (s) => setState(() => usePhone = s.first)),
        const SizedBox(height: 14),
        if (usePhone) field(phone, 'Phone number', Icons.phone, keyboard: TextInputType.phone)
        else field(email, 'Email address', Icons.email, keyboard: TextInputType.emailAddress),
        if (create) ...[const SizedBox(height: 12), field(TextEditingController(), 'Username', Icons.person)],
        const SizedBox(height: 12),
        field(password, 'Password', Icons.lock, obscure: true),
        Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => notice(context, 'Password reset will work after Firebase Authentication is connected.'), child: const Text('Forgot password?'))),
        const SizedBox(height: 8),
        SizedBox(width: double.infinity, child: FilledButton(onPressed: () => notice(context, 'Demo screen only. Connect Firebase to enable secure account access.'), child: Text(create ? 'Create account' : 'Log in'))),
        TextButton(onPressed: () => setState(() => create = !create), child: Text(create ? 'Already have an account? Log in' : 'Create account')),
      ]),
    ))),
  );
}

Widget field(TextEditingController c, String hint, IconData icon, {bool obscure = false, TextInputType? keyboard}) =>
  TextField(controller: c, obscureText: obscure, keyboardType: keyboard, decoration: InputDecoration(prefixIcon: Icon(icon), hintText: hint, filled: true, fillColor: Colors.white.withOpacity(.06), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none)));

void notice(BuildContext c, String message) => ScaffoldMessenger.of(c).showSnackBar(SnackBar(content: Text(message)));

class SocialShell extends StatefulWidget {
  const SocialShell({super.key});
  @override State<SocialShell> createState() => _SocialShellState();
}
class _SocialShellState extends State<SocialShell> {
  int index = 0;
  final pages = const [HomeTab(), ReelsTab(), SearchTab(), ProfileTab()];
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('SYNORA', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 3)), actions: [IconButton(onPressed: () => notice(context, 'Notifications coming soon'), icon: const Icon(Icons.notifications_none))]),
    body: pages[index],
    bottomNavigationBar: NavigationBar(selectedIndex: index, onDestinationSelected: (v) => setState(() => index = v), destinations: const [
      NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.play_circle_outline), label: 'Reels'),
      NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
      NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
    ]),
  );
}
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(16), children: [
    const Text('Stories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    SizedBox(height: 100, child: ListView(scrollDirection: Axis.horizontal, children: List.generate(8, (i) => Padding(padding: const EdgeInsets.all(8), child: Column(children: [CircleAvatar(radius: 29, backgroundColor: purple, child: Text(i == 0 ? '+' : 'S', style: const TextStyle(fontSize: 22))), Text(i == 0 ? 'Your story' : 'User ${i}')])))),
    const SizedBox(height: 12),
    postCard(context, 'synora_creator', 'A new place to connect ✨'),
    postCard(context, 'travel_diaries', 'Explore. Create. Share. 🌍'),
  ]);
}
Widget postCard(BuildContext context, String user, String caption) => Card(color: const Color(0xFF171321), clipBehavior: Clip.antiAlias, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  ListTile(leading: const CircleAvatar(backgroundColor: purple, child: Icon(Icons.person)), title: Text(user), trailing: const Icon(Icons.more_horiz)),
  Container(height: 190, color: const Color(0xFF282039), child: const Center(child: Icon(Icons.photo_outlined, size: 64, color: purple))),
  Row(children: [IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)), IconButton(onPressed: () {}, icon: const Icon(Icons.mode_comment_outlined)), IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)), const Spacer(), IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border))]),
  Padding(padding: const EdgeInsets.fromLTRB(14, 0, 14, 14), child: Text(caption)),
]));
class ReelsTab extends StatelessWidget { const ReelsTab({super.key}); @override Widget build(BuildContext c) => const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.video_library_outlined, size: 72, color: purple), Text('Reels', style: TextStyle(fontSize: 24)), Text('Short videos will appear here') ])); }
class SearchTab extends StatelessWidget { const SearchTab({super.key}); @override Widget build(BuildContext c) => Padding(padding: const EdgeInsets.all(16), child: Column(children: [TextField(decoration: InputDecoration(prefixIcon: const Icon(Icons.search), hintText: 'Search people, tags and posts', filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))), const SizedBox(height: 20), const Text('Discover SYNORA', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))])); }
class ProfileTab extends StatelessWidget { const ProfileTab({super.key}); @override Widget build(BuildContext c) => ListView(padding: const EdgeInsets.all(20), children: [const CircleAvatar(radius: 42, backgroundColor: purple, child: Icon(Icons.person, size: 44)), const SizedBox(height: 12), const Center(child: Text('Your profile', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))), const Center(child: Text('0 posts     0 followers     0 following')), const SizedBox(height: 16), OutlinedButton(onPressed: () => notice(c, 'Profile editing coming soon'), child: const Text('Edit profile')), const Divider(), const Text('Your posts')]); }
