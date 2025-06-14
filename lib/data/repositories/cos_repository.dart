import 'package:cos/data/model/cos_response.dart';
import 'package:cos/data/services/cos_service.dart';
import 'package:cos/domain/model/car_auction.dart';

class CosRepository {
  CosRepository({
    required this.remoteService,
    required this.localService,
  });

  final CosService remoteService;
  final CosService localService;

  Future<CarAuction?> getCarAuction() async {
    final response = await remoteService.getData();
    return switch (response) {
      CosResponseWithData(data: final data) => CarAuction.from(data),
      _ => null, // Handle other cases or return null
    };
  }
}
