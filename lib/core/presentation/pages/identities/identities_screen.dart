import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:identity_engine/core/presentation/pages/identities/identities_controller.dart';
import 'package:identity_engine/core/presentation/pages/scanner_qr/scanner_controller.dart';
import 'package:identity_engine/core/presentation/widget/widgets.dart';

class IdentitiesScreen extends GetWidget<IdentitiesController> {
  const IdentitiesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScannerController scannerController = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xffFEF7FF),
      body: Obx(
        () => controller.identities.isNotEmpty
            ? ListView.builder(
                itemCount: controller.identities.length,
                itemBuilder: (context, index) {
                  return IdentitiesContainer(
                    controller: controller,
                    scannerController: scannerController,
                    identity: controller.identities[index],
                    index: index,
                  );
                },
              )
            : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No tienes identidades.',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Toque el icono "+" de abajo para comenzar',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (controller.isDeleteMode.value)
              FloatingActionButton(
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  controller.showDeleteConfirmationDialog();
                },
              ),
            const SizedBox(height: 10),
            if (!controller.isDeleteMode.value)
              CustomFAB(controller: controller),
          ],
        ),
      ),
    );
  }
}
