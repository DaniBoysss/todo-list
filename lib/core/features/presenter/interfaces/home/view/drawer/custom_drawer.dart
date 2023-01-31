import 'package:flutter/material.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/component/molecule/list_tile_molecule.dart';
import 'package:lista_tarefas/core/features/presenter/interfaces/home/view/mixin/mixin_home_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> with MixinHomePage{

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListTileMolecule()
        ),
      ),
    );
  }
}
