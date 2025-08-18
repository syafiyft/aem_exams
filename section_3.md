# Section 3

## 9) Debugging — UI does not update in a `StatefulWidget`

### Problem → Fix 

**1. Changed a variable but didn’t call `setState`**  
**Fix:** Wrap the change in `setState(() { ... })` so Flutter knows to rebuild.
```dart
// Before
count++; // no rebuild

// After
setState(() => count++);
```

**2. Used `StatelessWidget` but the UI needs to change**  
**Fix:** Convert to `StatefulWidget` (or lift state into a manager) so you can call `setState`.

**3. Mutable value declared inside `build()` (it resets every build)**  
**Fix:** Move the value to a field on the `State` class so it persists between rebuilds.

**4. `const` used on a widget that displays changing data**  
**Fix:** Remove `const` from widgets that show values that can change.
```dart
// Before
const Text('Count: $count'); // freezes value

// After
Text('Count: $count');
```

**5. Using a state manager but not notifying/listening (Provider/Riverpod/BLoC)**  
**Fix:** Emit/notify new state and ensure the widget **watches/listens** (not just “reads”).

**6. Calling `setState` after `await` when widget is disposed**  
**Fix:** Guard updates with `if (!mounted) return;` before `setState`.
```dart
await Future.delayed(const Duration(seconds: 1));
if (!mounted) return;
setState(() { /* ... */ });
```

**7. Dynamic lists show the “wrong item” changing (missing keys)**  
**Fix:** Give each row a stable identity with `ValueKey(id)`.
```dart
ListTile(key: ValueKey(item.id), title: Text(item.title));
```

---

## 10) Performance Optimization — `ListView` with 1000 items feels laggy

### Problem → Fix

**1. Building too many rows eagerly**  
**Fix (Technique 1):** Use `ListView.builder` (lazy building) so only visible rows are built.
```dart
ListView.builder(
  itemCount: 1000,
  itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
);
```

**2. Excess layout work per row (Flutter must measure each row)**  
**Fix (Technique 2):** Provide a fixed row height with `itemExtent` (or `prototypeItem`).
```dart
ListView.builder(
  itemCount: 1000,
  itemExtent: 56, // hints height -> less layout work
  itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
);
```

### Other method
- Large images decoded repeatedly → use caching/thumbnails (e.g., a cached image widget).  
- Whole list rebuilds for small changes → update the smallest subtree; avoid rebuilding the parent list.



