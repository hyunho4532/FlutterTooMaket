import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_manager/repository/product_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class ProductInsertScreen extends StatefulWidget {
  const ProductInsertScreen({Key? key}) : super(key: key);

  @override
  State<ProductInsertScreen> createState() => _ProductInsertScreenState();
}

class _ProductInsertScreenState extends State<ProductInsertScreen> {
  final picker = ImagePicker();
  PickedFile? _image;

  String? _imageUrl;

  int favoriteCount = 0;

  bool? isChecked = false;
  bool? isSelected = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _userAddressController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // 기존 위도와 경도
  double _latitude = 33.450701;
  double _longitude = 126.570667;

  void _onCameraMove(double lat, double lng) {
    setState(() {
      _latitude = lat;
      _longitude = lng;
    });
  }

  final auth = FirebaseAuth.instance;

  final ProductRepository _productRepository = ProductRepository();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      Reference ref = FirebaseStorage.instance.ref().child('images/').child(DateTime.now.toString());
      UploadTask uploadTask = ref.putFile(imageFile);

      await uploadTask.whenComplete(() async {
        _imageUrl = await ref.getDownloadURL();
      });

      setState(() {

      });
    }

    setState(() {
      _image = pickedFile;
    });
  }

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition (
    target: LatLng(37.4537251, 126.7960716),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    getUserName();

    _markers.add (
      Marker (
        markerId: const MarkerId("1"),
        draggable: true,
        onTap: () => print("Marker!"),
        position: const LatLng(37.4537251, 126.7960716)
      )
    );
  }

  void getUserName() async {
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;

    DocumentSnapshot document = await fireStore.collection('users').doc(auth.currentUser!.uid).get();

    if (document.exists) {
      var userData = document.data() as Map<String, dynamic>;
      var nickname = userData['nickname'];
      var address = userData['address'];
      _nicknameController.text = nickname;
      _userAddressController.text = address;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: const Text (
          '중고 물품 등록하기',
          style: TextStyle (
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        actions: [
          Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              GestureDetector (
                onTap: () {
                  _productRepository.insertProducts(_titleController.text, _priceController.text, _addressController.text, _userAddressController.text, _nicknameController.text, _imageUrl!, favoriteCount, isChecked!, isSelected!);
                },

                child: const Padding (
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text (
                    '확인',
                    style: TextStyle (
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
        backgroundColor: Colors.white70,
      ),

      body: SingleChildScrollView (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            GestureDetector (
              onTap: () {
                getImage();
              },

              child: const Padding (
                padding: EdgeInsets.only(left: 24.0, top: 30),
                child: SizedBox (
                  width: 60,
                  height: 60,

                  child: Card (
                    child: Icon(Icons.camera_alt, color: Colors.grey),
                  ),
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 16.0),
              child: SizedBox (
                width: 140,
                height: 140,
                child: _image == null
                    ? const Text('이미지를 선택해주세요 .')
                    : Card (
                  child: Image.file(File(_image!.path), fit: BoxFit.cover),
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
              child: TextFormField (
                controller: _titleController,
                decoration: const InputDecoration (
                  hintText: '제목을 입력해주세요.',
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
              child: TextFormField (
                controller: _priceController,
                decoration: const InputDecoration (
                  hintText: '가격을 정해주세요.',
                ),
              ),
            ),

            Row (
              children: [
                const Padding (
                    padding: EdgeInsets.only(left: 24.0, top: 36.0, right: 24.0),
                    child: Text (
                        '다른 사람들에게 가격 제안을 받아볼게요!'
                    )
                ),

                Padding (
                    padding: const EdgeInsets.only(left: 24.0, top: 50.0, right: 24.0),
                    child: SizedBox (
                      width: 30,
                      height: 30,

                      child: RoundCheckBox (
                        onTap: (selected) {
                          isChecked = selected;
                        },
                      ),
                    )
                ),
              ],
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 48.0, right: 24.0, bottom: 36.0),
              child: GestureDetector (
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('주소 조회'),
                        content: SizedBox(
                          width: 1200,  // Adjust the width as needed
                          height: 1200, // Adjust the height as needed
                          child: Column(
                            children: [
                              Expanded (
                                child: SizedBox(
                                  width: 500, // Expand to maximum width
                                  height: 300, // Expand to maximum height
                                  child: GoogleMap (
                                    mapType: MapType.normal,
                                    markers: Set.from(_markers),
                                    initialCameraPosition: _kGooglePlex,
                                    onMapCreated: (GoogleMapController controller) {
                                      _controller.complete(controller);
                                    },
                                    myLocationButtonEnabled: false,
                                  )
                                ),
                              ),

                              Padding (
                                padding: const EdgeInsets.only(top: 32.0),
                                child: SizedBox (
                                  width: MediaQuery.of(context).size.width,

                                  child: ElevatedButton (
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },

                                    child: const Text (
                                      '주소 조회 완료!',
                                      style: TextStyle (
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },

                child: TextFormField (
                  enabled: false,
                  controller: _addressController,
                  decoration: const InputDecoration (
                    hintText: '주소를 입력해주세요.',
                  ),
                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
              child: Opacity (
                opacity: 0.0,

                child: TextFormField (
                  controller: _nicknameController,
                  decoration: const InputDecoration (
                    hintText: '이름을 입력해주세요.',
                  ),

                ),
              ),
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
              child: Opacity(
                opacity: 0.0, // 0.0으로 설정하여 숨김
                child: TextFormField (
                  controller: _userAddressController,
                  decoration: const InputDecoration (
                    hintText: '주소를 입력해주세요.',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
