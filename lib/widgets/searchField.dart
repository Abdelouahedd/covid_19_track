import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final TextEditingController _filter;
  final _changeStateOfTextField;
  SearchField(this._filter, this._changeStateOfTextField);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return new TextField(
      controller: widget._filter,
      onChanged: widget._changeStateOfTextField(),
      decoration: new InputDecoration(
          prefixIcon: new Icon(Icons.search),
          hintText: 'Search...',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
    );
  }
}
