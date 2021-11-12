import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flaevr/utils/sharedAssets.dart';

class FolderProductService {
  static Future<Response?> postNewFolderProduct(
      int idFolder, int idProduct) async {
    try {
      final response = await http
          .post(Uri.parse(SharedAssets.apiURL + '/folderProducts/post'), body: {
        "idFolder": idFolder.toString(),
        "idProduct": idProduct.toString(),
      });
      return response;
    } catch (e) {
      print("\x1B[33mFolderProductService.dart: x1B[0m" + e.toString());
    }
  }
}
