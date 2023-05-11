import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException.general(String message) = AppGeneralException;
  const factory AppException.noPic() = NoPictureException;
  const factory AppException.permission(Permission permission) =
      PermissionFailure;
}

extension AppExceptionMessage on AppException {
  String message() {
    return when(
      general: (msg) => msg,
      noPic: () => "Não foi escolhido nenhuma imagem.",
      permission: (permission) {
        String source;
        switch (permission.value) {
          case 1:
            source = "câmera";
            break;
          case 9:
          case 15:
            source = "galeria";
            break;
          default:
            return "Acesso desconhecido - ${permission.value}";
        }
        return "O aplicativo não tem permissão para acessar a $source. Tente novamente e conceda permissão para acessar, caso queira.";
      },
    );
  }
}
