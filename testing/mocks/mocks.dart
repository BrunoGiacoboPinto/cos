import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cos/data/services/cos/cos_data_access_interface.dart';
import 'package:cos/domain/model/car_auction.dart';
import 'package:cos/data/model/cos_response.dart';

final class SharedPreferencesAsyncMock extends Mock implements SharedPreferencesAsync {}

// Local abstract classes to bypass interface class restrictions for repository tests
abstract class TestCosServiceAccess implements CosServiceAccess<CosResponse> {}
abstract class TestCosServiceReadWriteAccess implements CosServiceReadWriteAccess<CarAuctionModel> {}

class MockRemoteService extends Mock implements TestCosServiceAccess {}
class MockLocalService extends Mock implements TestCosServiceReadWriteAccess {}
class MockMemoryService extends Mock implements TestCosServiceReadWriteAccess {}