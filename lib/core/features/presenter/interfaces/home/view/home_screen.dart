import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/core/app/config/service/utils_service.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/controller/home_controller.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/component/molecule/floating_button_molecule.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/component/organism/app_bar_organism.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/component/organism/card_organism.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/drawer/custom_drawer.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/mixin/mixin_home_page.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/animations/custom_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with MixinHomePage {
  final controller = Get.find<HomeController>();

  bool get _isLoading => controller.isLoading$.value;

  @override
  void initState() {
    Get.find<HomeController>();

    final message = Get.arguments;
    if (message != null) {
      UtilService.showToast(
        message: message,
        isError: false,
      );
    }

    controller.isLoading$.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: const FloatingButtonMolecule(),
      endDrawer: const CustomDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AppBarOrganism(),
            ],
          ),
        ),
      ),
      body: Container(
        color: AppColors.whiteColor,
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => !_isLoading
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: controller.taskEntity.value.length,
                          itemBuilder: (context, index) {
                            final tasks = controller.taskEntity.value[index];
                            return CardOrganism(taskEntity: tasks);
                          },
                        ),
                      )
                    : Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                            4,
                            (index) => Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 12),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CustomShimmer(
                                  height: 60,
                                  width: 350,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
