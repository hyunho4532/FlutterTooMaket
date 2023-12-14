import 'dart:async';
import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_manager/const/show_category_list.dart';
import 'package:customer_manager/permissions/location_permission.dart';
import 'package:customer_manager/repository/product_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
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
  final TextEditingController _categorySelectController = TextEditingController();

  final auth = FirebaseAuth.instance;

  final List<Marker> _markers = [
    const Marker (
      markerId: MarkerId('1'),
      position: LatLng(37.4537251, 126.7960716),
      draggable: true,
    ),
  ];

  final ProductRepository _productRepository = ProductRepository();

  LocationPermission locationPermission = LocationPermission();
  final Location _location = Location();

  void _updatePosition() async {
    var locationData = await _location.getLocation();

    print(locationData);

    var marker = _markers.firstWhere (
      (element) => element.markerId == const MarkerId('1'),
    );

    if (marker != null) {
      _markers.remove(marker);
    }

    _markers.add (
      Marker (
        markerId: const MarkerId('1'),
        position: LatLng(locationData.latitude!, locationData.longitude!),
        draggable: true,
      )
    );

    setState(() {

    });
  }

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

  static const CameraPosition _kGooglePlex = CameraPosition (
    target: LatLng(37.4537251, 126.7960716),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    getUserName();
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
                  _productRepository.insertProducts (
                      _titleController.text, _priceController.text, _addressController.text,
                      _userAddressController.text, _nicknameController.text, _categorySelectController.text,
                      _imageUrl!, favoriteCount, isChecked!, isSelected!
                  );
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
                padding: const EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
                child: CustomDropdown (
                  hintText: 'ddd',
                  items: dropdownCategoryList,
                  initialItem: dropdownCategoryList[0],
                  onChanged: (value) {
                    _categorySelectController.text = value;
                  },
                )
            ),

            Padding (
              padding: const EdgeInsets.only(left: 24.0, top: 48.0, right: 24.0, bottom: 36.0),
              child: GestureDetector (
                onTap: () {

                  // 권한 요청하기
                  locationPermission.getLocationPermission();

                  _updatePosition();

                  showDialog (
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
                                    myLocationEnabled: false,
                                    onCameraIdle: () {
                                      _updatePosition();
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
              child: TextFormField (
                controller: _userAddressController,
                decoration: const InputDecoration (
                  hintText: '주소를 입력해주세요.',
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
          ],
        ),
      ),
    );
  }
}
