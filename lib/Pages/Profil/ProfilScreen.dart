import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:takip_plus/Colors/Renkler.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    // Uint8List? _image;

    // void selectImage() async {
    //   Uint8List img = await pickImage(ImageSource.gallery);
    //   setState(() {
    //     _image = img;
    //   });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Renkler.White,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "PROFİLİM",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              "Profil bilgilerinize göz atın.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      backgroundColor: Renkler.White,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const CircleAvatar(
                maxRadius: 50,
                backgroundColor: Renkler.Black,
                child: Center(
                  child: Icon(
                    IconlyLight.profile,
                    color: Renkler.White,
                    size: 50,
                  ),
                ),
              ),
              // _image != null
              //     ? CircleAvatar(
              //         radius: 50,
              //         backgroundImage: MemoryImage(_image!),
              //       )
              //     : const CircleAvatar(
              //         radius: 50,
              //         backgroundImage: AssetImage("assets/urunler/ürün-1.png"),
              //       ),
              // Center(
              //   child: Positioned(
              //     child: IconButton(
              //       onPressed: selectImage,
              //       icon: const Icon(Icons.add_a_photo),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    const TextField(
                      cursorColor: Renkler.Black,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Ad Soyad",
                        labelStyle: TextStyle(color: Renkler.Black),
                        counterStyle: TextStyle(color: Renkler.Black),
                        hintText: "Ad Soyad",
                        prefixIcon:
                            Icon(IconlyLight.profile, color: Renkler.Black),
                        hintStyle: TextStyle(color: Renkler.Black),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Renkler.Green),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      cursorColor: Renkler.Black,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Renkler.Black),
                        labelText: "E-posta",
                        hintText: "E-posta",
                        prefixIcon:
                            Icon(IconlyLight.message, color: Renkler.Black),
                        hintStyle: TextStyle(color: Renkler.Black),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      cursorColor: Renkler.Black,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Telefon",
                        labelStyle: TextStyle(color: Renkler.Black),
                        counterStyle: TextStyle(color: Renkler.Black),
                        hintText: "Telefon",
                        prefixIcon:
                            Icon(IconlyLight.call, color: Renkler.Black),
                        hintStyle: TextStyle(color: Renkler.Black),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Renkler.Green),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      cursorColor: Renkler.Black,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Renkler.Black),
                        labelText: "Şifreniz",
                        hintText: "Şifreniz",
                        counterStyle: TextStyle(color: Renkler.Black),
                        prefixIcon:
                            Icon(IconlyLight.password, color: Renkler.Black),
                        hintStyle: TextStyle(color: Renkler.Black),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 5, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Renkler.Black),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Renkler.White,
                          backgroundColor: Renkler.Black,
                          fixedSize: const Size(200, 50),
                        ),
                        child: const Text(
                          "Güncelle",
                          style: TextStyle(
                              color: Renkler.White,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // pickImage(ImageSource source) async {
  //   final ImagePicker imagePicker = ImagePicker();
  //   XFile? file = await imagePicker.pickImage(source: source);

  //   if (file != null) {
  //     return await file.readAsBytes();
  //   }
  //   print("Resim seçilmedi.");
  // }
}
