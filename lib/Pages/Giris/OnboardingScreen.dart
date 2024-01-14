
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Pages/Giris/Login-SignUp/GirisYap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  // Button işleri Burada yapılacak
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  ),
                  child: Container(
                      decoration: const BoxDecoration(),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Atla',
                          style: TextStyle(
                              color: Renkler.Black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                      )),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                ),
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  demo_data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Renkler.Black),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      fixedSize: MaterialStateProperty.all(const Size(85, 60)),
                    ),
                    child: const Icon(
                      Icons.arrow_right_alt,
                      color: Renkler.White,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class DotIndicator extends StatefulWidget {
  const DotIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  State<DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.isActive ? 13 : 4,
        width: 4,
        decoration: BoxDecoration(
          color:
              widget.isActive ? Renkler.Black : Renkler.Black.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(11)),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

// ignore: non_constant_identifier_names
final List<Onboard> demo_data = [
  Onboard(
    image: "assets/images/icons1.png",
    title: "Finansal Başarı İçin Takip Plus!",
    description:
        "İşletmenizin mali süreçlerini kolaylaştırın, müşteri takibini güçlendirin ve stok yönetimini optimize edin. Takip Plus, işinizi daha verimli yönetmenize yardımcı oluyor.",
  ),
  Onboard(
    image: "assets/images/icons2.png",
    title: "Cari Hesaplarınızı Kontrol Edin Takip Plus İle Hızlı Çözüm!",
    description:
        "Takip Plus, cari hesap yönetimini basitleştirir, müşteri takibini hızlandırır ve stok yönetimini optimize eder. İş süreçlerinizi kontrol altına alın.",
  ),
  Onboard(
    image: "assets/images/icons3.png",
    title: "Takip Plus İle Finansal Yönetimi Kolaylaştırın!",
    description:
        "Takip Plus, işletmenizin büyümesine odaklanır, müşteri takibi, cari hesap yönetimi ve stok takibi süreçlerinizi basitleştirir. Finansal başarı için adım atın!",
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 170,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500, color: Renkler.Black),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Renkler.Black),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:takip_plus/Colors/Renkler.dart';
import 'package:takip_plus/Pages/Giris/Login-SignUp/GirisYap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  // Button işleri Burada yapılacak
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  ),
                  child: Container(
                      decoration: const BoxDecoration(),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Atla',
                          style: TextStyle(
                              color: Renkler.Black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                      )),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnboardingContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                ),
              ),
            ),
            Row(
              children: [
                ...List.generate(
                  demo_data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Renkler.Black),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      fixedSize: MaterialStateProperty.all(const Size(85, 60)),
                    ),
                    child: const Icon(
                      Icons.arrow_right_alt,
                      color: Renkler.White,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class DotIndicator extends StatefulWidget {
  const DotIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  State<DotIndicator> createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.isActive ? 13 : 4,
        width: 4,
        decoration: BoxDecoration(
          color:
              widget.isActive ? Renkler.Black : Renkler.Black.withOpacity(0.4),
          borderRadius: const BorderRadius.all(Radius.circular(11)),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

// ignore: non_constant_identifier_names
final List<Onboard> demo_data = [
  Onboard(
    image: "assets/images/icons1.png",
    title: "Finansal Başarı İçin Takip Plus!",
    description:
        "İşletmenizin mali süreçlerini kolaylaştırın, müşteri takibini güçlendirin ve stok yönetimini optimize edin. Takip Plus, işinizi daha verimli yönetmenize yardımcı oluyor.",
  ),
  Onboard(
    image: "assets/images/icons2.png",
    title: "Cari Hesaplarınızı Kontrol Edin Takip Plus İle Hızlı Çözüm!",
    description:
        "Takip Plus, cari hesap yönetimini basitleştirir, müşteri takibini hızlandırır ve stok yönetimini optimize eder. İş süreçlerinizi kontrol altına alın.",
  ),
  Onboard(
    image: "assets/images/icons3.png",
    title: "Takip Plus İle Finansal Yönetimi Kolaylaştırın!",
    description:
        "Takip Plus, işletmenizin büyümesine odaklanır, müşteri takibi, cari hesap yönetimi ve stok takibi süreçlerinizi basitleştirir. Finansal başarı için adım atın!",
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 170,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500, color: Renkler.Black),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Renkler.Black),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
