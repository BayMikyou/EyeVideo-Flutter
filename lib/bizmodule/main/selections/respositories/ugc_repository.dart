import 'package:eye_video/bizmodule/main/selections/model/ugc/ugc_list_model.dart';

abstract class UgcRepository {
  Future<UgcListModel> fetchUgcList({
    int page,
    int pageSize: 20,
  });
}
