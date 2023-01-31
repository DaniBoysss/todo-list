import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:lista_tarefas/core/features/domain/entities/task_entity.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/mixin/mixin_views.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/controller/home_controller.dart';
import 'package:lista_tarefas/core/shareds/common_widgets/atom/custom_button.dart';

class DeleteTask extends StatefulWidget {
  final TaskEntity taskEntity;

  const DeleteTask({
    Key? key,
    required this.taskEntity,
  }) : super(key: key);

  @override
  State<DeleteTask> createState() => _DeleteTaskState();
}

class _DeleteTaskState extends State<DeleteTask>
    with TickerProviderStateMixin, MixinViews {
  final controller = Get.find<HomeController>();

  bool get _isLoading => controller.isLoading$.value;

  @override
  void initState() {
    //INJECAO
    Get.find<HomeController>();

    //NOTIFIERS
    controller.isLoading$.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Deseja excluir a tarefa ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    'Se quiser excluir a tarefa, clique em "Excluir"',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  colorButton: Colors.red.shade400,
                  onPressed: _isLoading
                      ? null
                      : () {
                          deleteTask(
                            controller: controller,
                            idTask: widget.taskEntity.id,
                          );
                        },
                  sizeWidth: null,
                  child: _isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                            color: AppColors.whiteColor,
                          ),
                        )
                      : Text(
                          'Excluir',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.whiteColor,
                          ),
                        ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
