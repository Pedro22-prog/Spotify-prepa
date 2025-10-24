import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_prepa/common/config/assets/app_image.dart';
import 'package:spotify_prepa/common/config/assets/app_vectors.dart';
import 'package:spotify_prepa/common/config/theme/app_color.dart';
import 'package:spotify_prepa/common/widgets/button/app_button.dart';
import 'package:spotify_prepa/presentation/choose_mode/pages/chose_mode.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.intro),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(color: Colors.black.withValues(alpha: 0.15)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const Text(
                  'Disfruta tu musica en todos lados',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 21),
                const Text(
                  'Registrate en la aplicacion',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColor.grey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ChoseModes(),
                      ),
                    );
                  },
                  title: 'Inicio',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
