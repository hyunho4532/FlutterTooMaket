import 'package:flutter/material.dart';

typedef AddressCallback = void Function(String);

// ignore: must_be_immutable
class BuildRegisterListView extends StatefulWidget {

  List<String> addressList = [];
  String addressValues = "";
  final AddressCallback onAddressSelected;

  BuildRegisterListView({Key? key, required this.addressList, required this.addressValues, required this.onAddressSelected}) : super(key: key);

  @override
  State<BuildRegisterListView> createState() => _BuildRegisterListViewState();
}

class _BuildRegisterListViewState extends State<BuildRegisterListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded (
      child: ListView.builder (
        itemCount: widget.addressList.length,
        itemBuilder: (context, index) {
          return ListTile (
            title: SizedBox (
              height: 60,
              child: Card (
                child: Padding (
                  padding: const EdgeInsets.only(left: 8.0, top: 18.0),
                  child: Text (
                      widget.addressList[index]
                  ),
                ),
              ),
            ),
            onTap: () {
              widget.onAddressSelected(widget.addressList[index]);
            },
          );
        },
      ),
    );
  }
}
