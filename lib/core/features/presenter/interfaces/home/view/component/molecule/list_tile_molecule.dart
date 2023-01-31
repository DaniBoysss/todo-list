import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/controller/home_controller.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/mixin/mixin_home_page.dart';
import 'package:lista_tarefas/core/shareds/routes/app_routes.dart';

class ListTileMolecule extends StatefulWidget {
  const ListTileMolecule({Key? key}) : super(key: key);

  @override
  State<ListTileMolecule> createState() => _ListTileMoleculeState();
}

class _ListTileMoleculeState extends State<ListTileMolecule>
    with MixinHomePage {

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            FontAwesomeIcons.circleUser,
            color: AppColors.primaryColor,
            size: 40.0,
          ),
          title: RichText(
            text: TextSpan(
              text: 'Olá, ',
              style: const TextStyle(
                color: AppColors.secundaryColor,
                fontSize: 18,
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: controller.personEntity!.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const TextSpan(
                  text: '\nSeja bem vindo(a)!',
                  style: TextStyle(
                    color: AppColors.secundaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 15),
        TextButton(
          onPressed: () async {
            await storage.delete(key: 'userData');
            Get.offAllNamed(PagesRoutes.signInRoute);
          },
          child: const Text(
            'Sair',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: IconButton(
                onPressed: () => launchURL(1),
                icon: Image.asset('assets/images/ico-instagram.png'),
              ),
            ),
            SizedBox(
              width: 70,
              height: 70,
              child: IconButton(
                onPressed: () => launchURL(2),
                icon: Image.asset('assets/images/ico-linkedin.png'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
