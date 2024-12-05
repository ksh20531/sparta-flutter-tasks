import 'package:flutter/material.dart';
import 'package:flutter_markte_app/core/geolocator_helper.dart';
import 'package:flutter_markte_app/ui/pages/address_search/address_search_view_model.dart';
import 'package:flutter_markte_app/ui/pages/join/join_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressSearchPage extends StatelessWidget {
  const AddressSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Consumer(builder: (context, ref, child) {
            return TextField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  hintText: '동명(읍,면)으로 검색 (ex. 서초동)'),
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  final viewModel = ref.read(addressSearchViewModel.notifier);
                  viewModel.searchByName(value);
                }
              },
            );
          }),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10),
              Consumer(builder: (context, ref, child) {
                return SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () async {
                        // 1. geolocator에서 위치 받아오기
                        final position = await GeolocatorHelper.getPosition();
                        print('check');
                        if (position != null) {
                          print('check2');
                          // 2. 뷰모델에 요청하기
                          final viewModel =
                              ref.read(addressSearchViewModel.notifier);
                          viewModel.searchByLoaction(
                            position.latitude,
                            position.longitude,
                          );
                        }
                        print('check3');
                      },
                      child: Text('현재 위치로 찾기')),
                );
              }),
              Consumer(builder: (context, ref, child) {
                final addresses = ref.watch(addressSearchViewModel);
                return Expanded(
                  child: ListView.builder(
                    itemCount: addresses.length,
                    itemBuilder: (context, index) {
                      final item = addresses[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return JoinPage(item);
                          }));
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          color: Colors.transparent,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
