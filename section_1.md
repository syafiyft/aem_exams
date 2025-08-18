# Section 1

## 1) Dart Basics — `final` vs `const`

**Key idea**  
- `final`: value is chosen at **runtime**, then cannot change.  
- `const`: value is fixed at **compile time** and never changes.

**Examples**
```dart
final timestamp = DateTime.now();           // runtime value
const appName = 'AEM Assessment';           // compile-time
const kPadding = EdgeInsets.all(12);        // compile-time
```

**Reflection**  
I use `const` for fixed design tokens (colors, spacing) so Flutter can optimize rebuilds, and `final` for runtime values (dates, API data) to avoid accidental reassignment.

---

## 2) Widget Types — `StatelessWidget` vs `StatefulWidget`

**Key idea**  
- `StatelessWidget`: no internal mutable state; rebuilds only when inputs/parents change.  
- `StatefulWidget`: holds mutable state in a `State` object - call `setState` to update the UI.

**When I choose which**  
- Stateless: static “About” page, icons + labels.  
- Stateful: counter, form with validation, async data.

**Reflection**  
If the UI must react to user input or data, I choose `StatefulWidget` (or an external state manager). Otherwise I keep it stateless for simplicity and performance.

---

## 3) State Management

**What it means**  
How the app stores data (state) and updates the correct widgets when that data changes.

**Two approaches I know**  
- **Provider**: ChangeNotifier + listeners via context.  
- **Riverpod**: providers not tied to `BuildContext` and easy to test.

**How Riverpod feels (brief)**
```dart
final counterProvider = StateProvider<int>((ref) => 0);
// ref.watch(counterProvider) → widget rebuilds when value changes
```

**Reflection**  
Provider is quick for small features- Riverpod scales better and is easier to test, with a slightly steeper learning curve.

---

## 4) Navigation — using `Navigator` (pass & return data)

**Pattern**
```dart
final result = await Navigator.push<String>(
  context,
  MaterialPageRoute(builder: (_) => DetailScreen(message: 'Hello')),
);

// In DetailScreen:
Navigator.pop(context, 'Thanks!');
```

```dart
class DetailScreen extends StatelessWidget {
  final String message;
  const DetailScreen({super.key, required this.message});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Detail')),
    body: Center(child: Text(message)),
  );
}
```

**Reflection**  
I `await` the push when I need a return value and ensure the context is under a `MaterialApp/Scaffold` so `Navigator` and `ScaffoldMessenger` work correctly.

---

## 5) Async Programming — `async` & `await`

**Key idea**  
- `async`: function returns a `Future`.  
- `await`: pause inside that function until the future completes (UI stays responsive).

**Example (HTTP)**
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchNames() async {
  final r = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  if (r.statusCode == 200) {
    final list = jsonDecode(r.body) as List;
    return list.map((e) => e['name'] as String).toList();
  }
  throw Exception('Failed: ${r.statusCode}');
}
```

**Reflection**  
I always show loading/error/data states, sequence calls with `await`, and guard UI updates after async gaps with `if (!mounted) return;` in `State` classes.
