import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Renkler.Blue,
        foregroundColor: Renkler.White,
        title: const Text(
          'Profilim',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage('assets/images/avatar.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Renkler.Blue,
                      ),
                      child: const Icon(
                        Icons.create_sharp,
                        color: Renkler.White,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    const TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Ad Soyad",
                        counterStyle: TextStyle(color: Renkler.Blue),
                        hintText: "Ad Soyad",
                        prefixIcon: Icon(Icons.supervisor_account_rounded,
                            color: Renkler.Grey),
                        hintStyle: TextStyle(color: Renkler.Grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5, color: Renkler.Grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Renkler.Blue),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-posta",
                        hintText: "E-posta",
                        prefixIcon:
                            Icon(Icons.mail_outline, color: Renkler.Grey),
                        hintStyle: TextStyle(color: Renkler.Grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5, color: Renkler.Grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Renkler.Blue),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Telefon",
                        hintText: "Telefon",
                        prefixIcon: Icon(Icons.phone, color: Renkler.Grey),
                        hintStyle: TextStyle(color: Renkler.Grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5, color: Renkler.Grey),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Renkler.Blue),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Şifreniz",
                        hintText: "Şifreniz",
                        counterStyle: TextStyle(color: Renkler.Blue),
                        prefixIcon:
                            Icon(Icons.lock_open_sharp, color: Renkler.Grey),
                        hintStyle: TextStyle(color: Renkler.Grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 5, color: Renkler.Grey),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Renkler.Blue),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Renkler.Blue,
                          side: BorderSide.none,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                          "Güncelle",
                          style: TextStyle(
                              color: Renkler.White,
                              fontWeight: FontWeight.w400,
                              fontSize: 20),
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
}
