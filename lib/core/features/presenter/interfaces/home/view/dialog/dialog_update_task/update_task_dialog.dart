import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/dialog/components/molecules/dialog_form_molecules.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/dialog/components/atom/positioned_atom.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/controller/home_controller.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/auth/view/mixin/mixin_views.dart';
import 'package:lista_tarefas/core/features/domain/entities/task_entity.dart';
import 'package:lista_tarefas/core/app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateTask extends StatefulWidget {
  final TaskEntity taskEntity;

  const UpdateTask({
    Key? key,
    required this.taskEntity,
  }) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask>
    with TickerProviderStateMixin, MixinViews {
  //INSTANCIAS
  final _formFieldKey = GlobalKey<FormState>();
  final controller = Get.find<HomeController>();

  //VARIAVEIS
  bool get _isLoading => controller.isLoading$.value;

  @override
  void initState() {
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
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Quer atualizar a tarefa ?',
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
                    'Diga o nome da nova tarefa e a descrição, em seguida clique em "Atualizar"',
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
                DialogFormMolecules(
                  formKey: _formFieldKey,
                  onSavedTask: (value) {
                    controller.entity.title = value!;
                  },
                  onSavedDescription: (value) {
                    controller.entity.description = value!;
                  },
                  onPressed: _isLoading
                      ? null
                      : () {
                          if (_formFieldKey.currentState!.validate()) {
                            _formFieldKey.currentState!.save();
                            updateTask(
                                controller: controller,
                                task: widget.taskEntity);
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
                          'Atualizar',
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
