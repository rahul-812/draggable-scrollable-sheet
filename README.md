# amazing_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

## How It works

![animal_data](https://user-images.githubusercontent.com/85408038/163686739-cc57132f-b747-4127-8564-547034c56be4.gif)

## DraggableScrollableSheet

basic structure of this widget is

```dart
DraggableScrollableSheet(
  initialChildSize: 0.20,              // range between 0.0 - 1.0
  minChildSize: 0.20,                  // range between 0.0 - 1.0
  maxChildSize: 0.8,                   // range between 0.0 - 1.0
  builder: (context, scrollController) {
    // build and return your widget
  },
);
```

now we can use any widget as a child of ```DraggableScrollableSheet``` widget

a perfect example would be using ```ListView```

```dart
builder: (context, scrollController) {
return ListView(
  physics: const BouncingScrollPhysics(),
  controller: scrollController,
  children: [
    // ...
  ],
);
```

It is usefull to wrap ```DraggableScrollableSheet```with a ```dContaner``` and a ```Stack``` widget like:

```dart
Stack(
  children: [
    // ....
    Container(
      decoration: BoxDecoration(
        // ...
      ),
      DraggableScrollableSheet(
        // ...
      ),
    ),
  ],
),
```
