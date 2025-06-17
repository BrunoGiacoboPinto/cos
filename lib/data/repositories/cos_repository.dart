import 'package:cos/data/services/cos_service.dart';
import 'package:cos/domain/model/car_auction.dart';

class CosRepository {
  CosRepository({
    required this.remoteService,
    required this.localService,
  });

  final CosService remoteService;
  final CosService localService;

  Future<CarAuctionModel> getCarAuction() async {
    final response = await remoteService.getData();
    
    return CarAuctionModel.fromResponse(response);
  }
}
