import 'package:learn_dart_together/240401/dto/photo_search_dto.dart';
import 'package:learn_dart_together/240401/mapper/photo_mapper.dart';
import 'package:learn_dart_together/240401/model/photo.dart';
import 'package:learn_dart_together/240401/model/result.dart';
import 'package:learn_dart_together/240401/repository/photo_repository.dart';
import 'package:learn_dart_together/240401/data_source/photo_api.dart';
import 'package:test/test.dart';

import 'resource/photo_search.dart';

void main() {
  group('Photo Test', () {
    final repository = PhotoRepositoryImpl(api: PhotoApi());
    final expectedList = PhotoSearchDto
        .fromJson(expected)
        .hits!
        .map((e) => e.toPhoto())
        .toList();

    test('쿼리 테스트', () async {
      final Result<List<Photo>> result = await repository
          .getPhotos('yellow+flowers&page=1&per_page=3'); // 3개만 가져오기
      final test = switch (result) {
        Success<List<Photo>>() => result.data.length,
        Error() => result.e
      };

      final test2 = result.when(success: (data) => data, error: (e) => e);
      // 또 다른 방법

      expect(test == 3, true);
    });

    test('비속어 테스트', () async {
      final Result<List<Photo>> result = await repository
          .getPhotos('바보&page=1&per_page=3');
      final test = switch (result) {
        Success<List<Photo>>() => result.data,
        Error() => result.e
      };
      expect(test == 'Error : 비속어를 사용할 수 없습니다', true);
    });
  });
}