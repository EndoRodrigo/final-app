import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tirando_factos/data/model/user_model.dart';
import 'package:tirando_factos/data/services/firestore_service.dart';

import '../../../routing/app_routes.dart';


class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  final email = ''.obs;
  final password = ''.obs;
  final selectedRole = ''.obs;
  final isLoading = false.obs;


  Future<void> register() async {
    print('${email.value} -  ${password.value}');
    try {
      isLoading.value = true;

      final result = await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      final user = UserModel(
        uid: result.user!.uid,
        email: email.value,
        role: selectedRole.value,
        createdAt: DateTime.now(),
      );


      await _firestoreService.saveUser(user);

      Get.snackbar('Éxito', 'Usuario creado correctamente');
      Get.offAllNamed(AppRoutes.HOME);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? e.code);
      print('Auth error: ${e.message}');
    } catch (e) {
      print('Unknown error: $e');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offAllNamed(AppRoutes.HOME);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}