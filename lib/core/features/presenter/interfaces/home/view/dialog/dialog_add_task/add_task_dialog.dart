import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/dialog/components/molecules/dialog_form_molecules.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/dialog/components/atom/positioned_atom.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/controller/home_controller.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/mixin/mixin_views.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask>
    with TickerProviderStateMixin, MixinViews {
  final _formKey = GlobalKey<FormState>();
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
          const PositionedAtom(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Nova tarefa!!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryColor,
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
                    'Para criar uma nova tarefa, digite o nome da tarefa e a descrição, em seguida clique em "Adicionar"',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
                DialogFormMolecules(
                  formKey: _formKey,
                  onSavedTask: (value) {
                    controller.entity.title = value!;
                  },
                  onSavedDescription: (value) {
                    controller.entity.description = value!;
                  },
                  onPressed: _isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            addTask(controller: controller);
                          }
                        },
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
                          'Adicionar',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.whiteColor,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
